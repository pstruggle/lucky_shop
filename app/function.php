<?php
/**
 * 自定义函数系统处理函数
 * User: 纯简
 * Date: 2017\9\18 0018
 * Time: 22:43
 */


/**
 * 提取短信模板${name}参数
 * @param string $temp 短信模板字符串
 * @return string 以逗号分隔的字符串
 */
function sms_temp_re($temp){
    $search = '/\$\{(.*?)\}/is';
    preg_match_all($search,$temp,$res,PREG_SET_ORDER );
    $r = [];
    foreach ($res as $re){
        $r[] = $re[1];
    }
    return implode(',',$r);
}

/**
 * 获取并设置缓存
 * @param string $name 缓存名称
 * @param mixed $value 缓存设置值
 * @return mixed
 */
function get_cache($name,$value = null){
    if($value !== null){
        return cache($name,$value);
    }
    $result = cache($name);
    if(empty($result)){
        $names = explode('.',$name);
        try{
            model($names[0])->setCache(empty($names[1])?'':$names[1]);
        }catch (Exception $e){
            dump($e->getMessage());
            throw new Exception($name.'缓存不存在');
        }
        $result = cache($name);
    }
    return $result;
}

/**
 * 短信发送时的参数格式化
 * @param string $param 短信模板参数key
 * @param string $value 短信模板key对应的值
 * @return string JSON
 */
function sms_param($param,$value){
    $params = explode(',',$param);
    $values = explode(',',$value);
    $result = [];
    foreach ($params as $key => $param){
        $result[$param] = !empty($values[$key]) ?$values[$key]: '';
    }
    return json_encode($result);
}

/**
 * 获取序列号
 * @param string $prefix 序列号前缀标识，控制在三个字符以内
 * @return string
 */
function serial($prefix=''){
    $time_ext = substr(time(),'4');
    return $prefix . $time_ext.mt_rand(10000,99999);
}

/**
 * 发送短信日志
 * @param array $send 发送短信内容的配置
 * @param object $result 发送短信发送结果
 * @return mixed
 */
function sms_log($send,$result){
    $map = [
        'out_id'    =>$send['outId'],
        'param'     =>$send['param'],
        'temp'      =>$send['temp'],
        'sign_name' =>$send['signName'],
        'rec_num'   =>$send['recNum'],
        'message'   =>empty($result->Message)?'':$result->Message,
        'code'      =>empty($result->Code)?'':$result->Code,
        'result'    =>json_encode($result),
        'send_time' =>time(),
    ];
    return \think\Db::name('sms_log')->insert($map);
}
/**
 * 发送邮箱日志
 * @param string $to 接收邮件的邮件地址
 * @param string $name 接收邮件者的称呼
 * @param string $subject 邮件发送主题
 * @param string $body 邮件发送内容
 * @param array $error 发送状态
 * @return mixed
 */
function mail_log($to,$name,$subject,$body,$error){
    $map = [
        'body'      =>$body,
        'to'        =>$to,
        'subject'   =>$subject,
        'name'      =>$name,
        'error'     =>empty($error['error'])?'':$error['error'],
        'result'    =>json_encode($error),
        'send_time' =>time(),
    ];
    return \think\Db::name('mail_log')->insert($map);

}
/**
 * 发送电子邮件
 * @param string $to 接收邮件的邮件地址
 * @param string $name 接收邮件者的称呼
 * @param string $subject 邮件发送主题
 * @param string $body 邮件发送内容
 * @return mixed
 */
function send_mail($to,$name='',$subject,$body){
    $error = array('errorCode' => true);
    if(empty($to) || empty($subject) || empty($body)){
        $error['errorCode'] = false;
        $error['error'] = '参数错误';
        return $error;
    }
    vendor('PHPMailer/PHPMailerAutoload' , EXT);
    $mail = new PHPMailer(); //实例化
    $email_config = get_cache('config.email');
    $mail->IsSMTP(); // 启用SMTP
    $mail->Host= $email_config['host']; //smtp服务器的名称（这里以QQ邮箱为例）
    $mail->SMTPAuth = config('email.smtpauth'); //启用smtp认证
    $mail->Username = $email_config['username']; //你的邮箱名
    $mail->Password = $email_config['password'] ; //邮箱密码
    $mail->From = $email_config['from']; //发件人地址（也就是你的邮箱地址）
    $mail->FromName = $email_config['fromname']; //发件人姓名
    $mail->AddAddress($to,$name);
    $mail->WordWrap = 50; //设置每行字符长度
    $mail->IsHTML(config('email.ishtml')); // 是否HTML格式邮件
    $mail->CharSet=config('email.charset'); //设置邮件编码
    $mail->Subject = $subject; //邮件主题
    $mail->Body = $body; //邮件内容
    $mail->AltBody = "这是一个纯文本的身体在非营利的HTML电子邮件客户端"; //邮件正文不支持HTML的备用显示
    if($mail->Send()){
        $error = ['errorCode' => true,'error' => '发送成功'];
    }else{
        $error = ['errorCode' => false,'error' => $mail->ErrorInfo];
    }
    mail_log($to,$name,$subject,$body,$error);
    return $error;
}
/**
 * 加密解密
 * @param string $string ： 明文 或 密文
 * @param string $operation D表示解密,其它表示加密
 * @param string $key ： 密匙
 * @param int $expiry ：密文有效期
 * @return string
 */
// $string： 明文 或 密文
// $operation：DECODE表示解密,其它表示加密
// $key： 密匙
// $expiry：密文有效期
function authcode($string, $key = '', $operation = 'E', $expiry = 0) {
    // 动态密匙长度，相同的明文会生成不同密文就是依靠动态密匙
    $ckey_length = 4;

    // 密匙
    $key = md5($key ? $key : 'lucky');

    // 密匙a会参与加解密
    $keya = md5(substr($key, 0, 16));
    // 密匙b会用来做数据完整性验证
    $keyb = md5(substr($key, 16, 16));
    // 密匙c用于变化生成的密文
    $keyc = $ckey_length ? ($operation == 'D' ? substr($string, 0, $ckey_length): substr(md5(microtime()), -$ckey_length)) : '';
    // 参与运算的密匙
    $cryptkey = $keya.md5($keya.$keyc);
    $key_length = strlen($cryptkey);
    // 明文，前10位用来保存时间戳，解密时验证数据有效性，10到26位用来保存$keyb(密匙b)，解密时会通过这个密匙验证数据完整性
    // 如果是解码的话，会从第$ckey_length位开始，因为密文前$ckey_length位保存 动态密匙，以保证解密正确
    $string = $operation == 'D' ? base64_decode(substr($string, $ckey_length)) : sprintf('%010d', $expiry ? $expiry + time() : 0).substr(md5($string.$keyb), 0, 16).$string;
    $string_length = strlen($string);
    $result = '';
    $box = range(0, 255);
    $rndkey = array();
    // 产生密匙簿
    for($i = 0; $i <= 255; $i++) {
        $rndkey[$i] = ord($cryptkey[$i % $key_length]);
    }
    // 用固定的算法，打乱密匙簿，增加随机性，好像很复杂，实际上对并不会增加密文的强度
    for($j = $i = 0; $i < 256; $i++) {
        $j = ($j + $box[$i] + $rndkey[$i]) % 256;
        $tmp = $box[$i];
        $box[$i] = $box[$j];
        $box[$j] = $tmp;
    }
    // 核心加解密部分
    for($a = $j = $i = 0; $i < $string_length; $i++) {
        $a = ($a + 1) % 256;
        $j = ($j + $box[$a]) % 256;
        $tmp = $box[$a];
        $box[$a] = $box[$j];
        $box[$j] = $tmp;
        // 从密匙簿得出密匙进行异或，再转成字符
        $result .= chr(ord($string[$i]) ^ ($box[($box[$a] + $box[$j]) % 256]));
    }
    if($operation == 'D') {
        // substr($result, 0, 10) == 0 验证数据有效性
        // substr($result, 0, 10) - time() > 0 验证数据有效性
        // substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16) 验证数据完整性
        // 验证数据有效性，请看未加密明文的格式
        if((substr($result, 0, 10) == 0 || substr($result, 0, 10) - time() > 0) && substr($result, 10, 16) == substr(md5(substr($result, 26).$keyb), 0, 16)) {
            return substr($result, 26);
        } else {
            return '';
        }
    } else {
        // 把动态密匙保存在密文里，这也是为什么同样的明文，生产不同密文后能解密的原因
        // 因为加密后的密文可能是一些特殊字符，复制过程可能会丢失，所以用base64编码
        return $keyc.str_replace('=', '', base64_encode($result));
    }
}
/**
 * 规格分组处理
 * @param array $data  规格数组
 * @return mixed
 */
function spec($data){
    if(!is_array($data) && !is_array($data[0])){
        throw new Exception("参数错误");
    }
    $len = count($data);
    if($len < 2){
        return $data[0];
    }
    $items = [];
    $i = 0;
    foreach ($data[0] as $value0){
        foreach ($data[1] as  $value1){
            $items[$i][] = $value0[0] .','. $value1[0];
            $items[$i][] = $value0[1] .','. $value1[1];
            $i++;
        }
    }
    $data = array_slice($data,2);
    array_unshift($data,$items);
    return spec($data);
}
/**
 * 输出自定义表单并自动提交
 * @param string $url 提交链接
 * @param array $params 数据以数组方式传递
 * @param string $method 提交方式get,post 非两种方式  默认post
 * @return  string
 */
function buildFrom($url,$params,$method="POST"){
    $method = $method=='GET' ?'GET':'POST';
    $name = make_password();
    $html = '<form id="'.$name.'" name="'.$name.'" method="'.$method.'" action="'.$url.'">';
    foreach ($params as $key => $val){
        $html .= '<input type="hidden" name="'.$key.'" value="'.$val.'" />';
    }
    $html .= '</form><script>document.forms["'.$name.'"].submit();</script>';
    return $html;
}


