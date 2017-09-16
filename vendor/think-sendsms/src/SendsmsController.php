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

namespace think\sendsms;

use think\Config;

class SendsmsController
{
    public function index($id = "")
    {
//        config('sms.accessKeyId','aaaa');
//        config('sms.uNDDVOZX0lF6jAjnn9pk24gtsoD9M6','aaaa');
        dump((array)Config::get('sms'));
//        $sendsms = new Sendsms((array)Config::get('sms'));

//        return $sendsms->entry($id);
    }
}