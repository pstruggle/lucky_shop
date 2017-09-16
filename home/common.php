<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2016 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 流年 <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 应用公共文件
//error_reporting(E_ERROR | E_PARSE );
error_reporting(0 );
use think\Request;
/**
 * 获取当前链接URL
 * */
function current_url()
{
    $current_url = 'http://';
    if (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] == 'on') {
        $current_url = 'https://';
    }
    if ($_SERVER['SERVER_PORT'] != '80') {
        $current_url .= $_SERVER['SERVER_NAME'] . ':' . $_SERVER['SERVER_PORT'] . $_SERVER['REQUEST_URI'];
    } else {
        $current_url .= $_SERVER['SERVER_NAME'] . $_SERVER['REQUEST_URI'];
    }
    return $current_url;
}
/**
 * 异步访问链接并返回结果
 * @param $url 访问链接地址
 * @param $datas post访问数据
 * @param $type 以get、post方式访问链接
 */
//异步访问链接
function wwCurl($url,$datas='',$type = 'GET'){
    $ch = curl_init();
    $type = strtoupper($type);

    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    if($type == 'POST'){
        curl_setopt($ch,CURLOPT_POST,true);
        curl_setopt($ch,CURLOPT_POSTFIELDS,$datas);
    }
    $result = curl_exec($ch);
    curl_close($ch);
    return $result;
}
/**
 * 获取客户端ip
 */
function getIP() {
    if (getenv('HTTP_CLIENT_IP')) {
        $ip = getenv('HTTP_CLIENT_IP');
    }
    elseif (getenv('HTTP_X_FORWARDED_FOR')) {
        $ip = getenv('HTTP_X_FORWARDED_FOR');
    }
    elseif (getenv('HTTP_X_FORWARDED')) {
        $ip = getenv('HTTP_X_FORWARDED');
    }
    elseif (getenv('HTTP_FORWARDED_FOR')) {
        $ip = getenv('HTTP_FORWARDED_FOR');

    }
    elseif (getenv('HTTP_FORWARDED')) {
        $ip = getenv('HTTP_FORWARDED');
    }
    else {
        $ip = $_SERVER['REMOTE_ADDR'];
    }
    return $ip;
}
/**
 * 判断是否在微信中打开
 */
function is_wechat(){
    if ( strpos($_SERVER['HTTP_USER_AGENT'], 'MicroMessenger') !== false ) {
        return true;
    }
    return false;
}
//生成订单号
function serial(){
    $num = mt_rand(10000,99999);
    $time = time();
    return $time.$num;
}
//获取缓存函数
function getCache($name){
    $value = cache($name);
    if(empty($value)){
        $config = model('config');
        $config->config_cache();
        $value = cache($name);
    }
    return $value;
}
/**
 * 获取中文字的首字母
 * @param $str 中文字符串
 */
function getFirstCharter($str)
{
    if (empty($str)) {
        return '';
    }

    $fchar = ord($str{0});

    if ($fchar >= ord('A') && $fchar <= ord('z'))
        return strtoupper($str{0});

    $s1 = iconv('UTF-8', 'gb2312', $str);

    $s2 = iconv('gb2312', 'UTF-8', $s1);

    $s = $s2 == $str ? $s1 : $str;

    $asc = ord($s{0}) * 256 + ord($s{1}) - 65536;

    if ($asc >= -20319 && $asc <= -20284)
        return 'A';

    if ($asc >= -20283 && $asc <= -19776)
        return 'B';

    if ($asc >= -19775 && $asc <= -19219)
        return 'C';

    if ($asc >= -19218 && $asc <= -18711)
        return 'D';

    if ($asc >= -18710 && $asc <= -18527)
        return 'E';

    if ($asc >= -18526 && $asc <= -18240)
        return 'F';

    if ($asc >= -18239 && $asc <= -17923)
        return 'G';

    if ($asc >= -17922 && $asc <= -17418)
        return 'H';

    if ($asc >= -17417 && $asc <= -16475)
        return 'J';

    if ($asc >= -16474 && $asc <= -16213)
        return 'K';

    if ($asc >= -16212 && $asc <= -15641)
        return 'L';

    if ($asc >= -15640 && $asc <= -15166)
        return 'M';

    if ($asc >= -15165 && $asc <= -14923)
        return 'N';

    if ($asc >= -14922 && $asc <= -14915)
        return 'O';

    if ($asc >= -14914 && $asc <= -14631)
        return 'P';

    if ($asc >= -14630 && $asc <= -14150)
        return 'Q';

    if ($asc >= -14149 && $asc <= -14091)
        return 'R';

    if ($asc >= -14090 && $asc <= -13319)
        return 'S';

    if ($asc >= -13318 && $asc <= -12839)
        return 'T';

    if ($asc >= -12838 && $asc <= -12557)
        return 'W';

    if ($asc >= -12556 && $asc <= -11848)
        return 'X';

    if ($asc >= -11847 && $asc <= -11056)
        return 'Y';

    if ($asc >= -11055 && $asc <= -10247)
        return 'Z';

    return null;
}
/**
 * 随机字符串
 * @param $length 随机字符串长度
 */
function make_password( $length = 8 )
{

    // 密码字符集，可任意添加你需要的字符
    $chars = array('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h',
        'i', 'j', 'k', 'l','m', 'n', 'o', 'p', 'q', 'r', 's',
        't', 'u', 'v', 'w', 'x', 'y','z', 'A', 'B', 'C', 'D',
        'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L','M', 'N', 'O',
        'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z',
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

    // 在 $chars 中随机取 $length 个数组元素键名
    $keys = array_rand($chars,$length);
    $password = '';
    foreach($keys as $key)
    {
        // 将 $length 个数组元素连接成字符串
        $password .= $chars[$key];
    }
    return $password;
}
//数组格式化输出
function input_str($array){
    $str = '[<br/>';
    foreach ($array as $item => $value){
        $str .= "'$item'=> input('$item')?input('$item'):'',<br/>";
    }
    $str .= ']';
    return $str;
}
/**
 * 获取一周内的时间
 */
function get_week(){
    $i=0;
    do{
        $time = strtotime($i . ' day');
        $w = date('w',$time);
        $date = strtotime(date('Y-m-d',$time));
        $times[(int)$w] = $date;
        $i--;
    }while($w != 0);
    ksort($times);
    $times = array_pad($times,7,0);
    return $times;
}
/*********************************************************************
函数名称:encrypt
函数作用:加密解密字符串
使用方法:
加密  :encrypt('str','E','nowamagic');
解密  :encrypt('被加密过的字符串','D','nowamagic');
参数说明:
$string :需要加密解密的字符串
$operation:判断是加密还是解密:E:加密 D:解密
$key  :加密的钥匙(密匙);
 *********************************************************************/
function encrypt($string,$operation,$key='')
{
    $key=md5($key);
    $key_length=strlen($key);
    $string=$operation=='D'?base64_decode($string):substr(md5($string.$key),0,8).$string;
    $string_length=strlen($string);
    $rndkey=$box=array();
    $result='';
    for($i=0;$i<=255;$i++)
    {
        $rndkey[$i]=ord($key[$i%$key_length]);
        $box[$i]=$i;
    }
    for($j=$i=0;$i<256;$i++)
    {
        $j=($j+$box[$i]+$rndkey[$i])%256;
        $tmp=$box[$i];
        $box[$i]=$box[$j];
        $box[$j]=$tmp;
    }
    for($a=$j=$i=0;$i<$string_length;$i++)
    {
        $a=($a+1)%256;
        $j=($j+$box[$a])%256;
        $tmp=$box[$a];
        $box[$a]=$box[$j];
        $box[$j]=$tmp;
        $result.=chr(ord($string[$i])^($box[($box[$a]+$box[$j])%256]));
    }
    if($operation=='D')
    {
        if(substr($result,0,8)==substr(md5(substr($result,8).$key),0,8))
        {
            return substr($result,8);
        }
        else
        {
            return'';
        }
    }
    else
    {
        return str_replace('=','',base64_encode($result));
    }
}
/**
 * 获取这个周末时间
 *
 */
function getWeekend(){
    $i=0;
    $times = [];
    do{
        $time = strtotime('+'.$i . ' day');
        $w = date('w',$time);
        if($w == 6 || $w == 0)
            $times[] = strtotime( date( 'Y-m-d', $time ) );
        $i++;
    }while($w != 0);
    return $times;
}

/**
 * 剩余时间计算
 * @param $time_s int min_time
 * @param $time_n int max_time
 */
function gettime($time_s,$time_n){
    $strtime = '';
    $time = $time_n-$time_s;
    if($time >= 86400){
        return $strtime = date('Y-m-d H:i:s',$time_s);
    }
    if($time >= 3600){
        $strtime .= intval($time/3600).'小时';
        $time = $time % 3600;
    }else{
        $strtime .= '';
    }
    if($time >= 60){
        $strtime .= intval($time/60).'分钟';
        $time = $time % 60;
    }else{
        $strtime .= '';
    }
    if($time > 0){
        $strtime .= intval($time).'秒';
    }else{
        $strtime = false; //过期返回false
    }
    return $strtime;
}
/**
 * 图片压缩url
 * @param $img string 图片地址
 * @param $w 压缩图片宽度
 * @param $h 压缩图片高度
 */
function img_url($img = '', $w = 0, $h = 0){
    $request = Request::instance();
    $host = $request->domain();
    $date = date('YmdHis').mt_rand(10000,99999);
    $url = '/api.php/upload/handle/'.$date.'.html';
    $parameter = '?';
    $parameter .= 'pic='.urlencode($img);
    if($w !== 0){
        $parameter .= '&w='.$w;
    }
    if($h !== 0){
        $parameter .= '&h='.$h;
    }
    return $host.$url.$parameter;
}
/**
 * 图片添加文字水印
 * @param $img 图片链接地址
 * @param $txt 水印文字
 */
//图片添加文件水印处理链接
function water_img_url($img = '', $txt = 0){
    $request = Request::instance();
    $host = $request->domain();
    $date = date('YmdHis').mt_rand(10000,99999);
    $url = '/api.php/upload/water_text/'.$date.'.html';
    $parameter = '?';
    $parameter .= 'pic='.urlencode($img);
    if($txt !== 0){
        $parameter .= '&txt='.$txt;
    }
    return $host.$url.$parameter;
}

// 工具函数
function addKey(&$val,$key,$param){
    $val[$param['key']] = $param['val'];
}
// 替换字符串
function enstr($str){
    return substr_replace($str, '***', 3);
}
