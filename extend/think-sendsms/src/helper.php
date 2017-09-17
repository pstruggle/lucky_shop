<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2015 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yunwuxin <448901948@qq.com>
// +----------------------------------------------------------------------

\think\Route::get('sendsms/[:id]', "\\think\\sendsms\\SendsmsController@index");

\think\Validate::extend('sendsms', function ($value, $id = '') {
    return sendsms_check($value, $id);
});

\think\Validate::setTypeMsg('sendsms', ':attribute错误!');


/**
 * @param string $id
 * @param array  $config
 * @return \think\Response
 */
function sendsms($id = '', $config = [])
{
    $sendsms = new \think\sendsms\Sendsms($config);
    return $sendsms->entry($id);
}


/**
 * @param $id
 * @return string
 */
function sendsms_src($id = '')
{
    return \think\Url::build('/sendsms' . ($id ? "/{$id}" : ''));
}


/**
 * @param $id
 * @return mixed
 */
function sendsms_img($id = '')
{
    return '<img src="' . sendsms_src($id) . '" alt="sendsms" />';
}


/**
 * @param        $value
 * @param string $id
 * @param array  $config
 * @return bool
 */
function sendsms_check($value, $id = '')
{
    $sendsms = new \think\sendsms\Sendsms((array)\think\Config::get('sendsms'));
    return $sendsms->check($value, $id);
}
