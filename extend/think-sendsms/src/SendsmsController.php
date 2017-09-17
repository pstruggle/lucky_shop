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
    /**
     * 验证短信
     */
    public function index($id = "")
    {
        config('sms.accessKeyId','aaaa');
//        config('sms.uNDDVOZX0lF6jAjnn9pk24gtsoD9M6','aaaa');
        dump((array)Config::get('sms'));
        $sendsms = new Sendsms();
        $code = $sendsms->entry($id);
        dump($sendsms->check($code,$id));
        $send = [
            'recNum' => 15879221657,
            'signName' => '小惠猫',
            'temp' => 'SMS_73920020',
            'param' => '{"code":"123456","product":"123456"}',
            'outId' => ''
        ];
//        验证码${code}，您正在注册成为${product}用户，感谢您的支持！
//        $result = $sendsms->send($send);
//        dump($result);
//        return $sendsms->entry($id);
    }
}