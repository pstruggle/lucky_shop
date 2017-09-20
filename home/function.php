<?php
/**
 * Created by PhpStorm.
 * User: 纯简
 * Date: 2017\9\18 0018
 * Time: 22:43
 */

use app\common\model\Config;

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
        model($names[0])->setCache();
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
    $time_ext = substr(time(),'5');
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
 * 发送电子邮件
 * @param array $send 参数数组 [to=>接收电子邮件,subject=>邮件主题,body=>邮件内容];
 * @return mixed
 */
function send_mail($send){
    vendor('PHPMailer/PHPMailerAutoload' , EXT);
    $mail = new PHPMailer(); //实例化
    $mail->IsSMTP(); // 启用SMTP
    $mail->Host=config('email.host'); //smtp服务器的名称（这里以QQ邮箱为例）
    $mail->SMTPAuth = config('email.smtpauth'); //启用smtp认证
    $mail->Username = config('email.username'); //你的邮箱名
    $mail->Password = config('email.password') ; //邮箱密码
    $mail->From = config('email.from'); //发件人地址（也就是你的邮箱地址）
    $mail->FromName = config('email.fromname'); //发件人姓名
    $mail->AddAddress($send['to'],"尊敬的计算机协会成员");
    $mail->WordWrap = 50; //设置每行字符长度
    $mail->IsHTML(config('email.ishtml')); // 是否HTML格式邮件
    $mail->CharSet=config('email.charset'); //设置邮件编码
    $mail->Subject =$send['subject']; //邮件主题
    $mail->Body = $send['body']; //邮件内容
    $mail->AltBody = "这是一个纯文本的身体在非营利的HTML电子邮件客户端"; //邮件正文不支持HTML的备用显示
    if($mail->Send())
        return array('errorCode' => true);
    return array('errorCode' => false,'error' => $mail->ErrorInfo);
}
