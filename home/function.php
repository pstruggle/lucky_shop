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