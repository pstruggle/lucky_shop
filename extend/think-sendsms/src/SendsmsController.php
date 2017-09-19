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
use think\Request;

class SendsmsController
{
    protected $request;
    /**
     * 初始化类
     */
    public function __construct()
    {
        $this->request = Request::instance();
    }

    /**
     * 验证短信
     */
    public function index($id = "")
    {
//        $prompt = ['code'=>0,'info'=>'发送成功'];
//        if(!$this->request->isPost()){
//            $prompt['code'] = 1;
//            $prompt['info'] = '请求出错';
//            return json_encode($prompt);
//        }
        $this->update_config();
        $sendsms = new Sendsms();
        $code = $sendsms->entry($id);
        $scene = input('post.scene');
        $phone = input('post.phone');
        if(empty($scene) || empty($phone)){
            $prompt['code'] = 1;
            $prompt['info'] = '参数错误';
            return json_encode($prompt);
        }
        $smstemp = get_cache('smstemp')[$scene];
        if(empty($smstemp)){
            $prompt['code'] = 1;
            $prompt['info'] = '参数错误';
            return json_encode($prompt);
        }
        $param = sms_param($smstemp['param'],$code);

        $send = [
            'recNum' => $phone,
            'signName' => $smstemp['sign_name'],
            'temp' => $smstemp['temp_code'],
            'param' => $param,
            'outId' => serial('sms')
        ];
//        dump($sendsms->check($code,$id));
//        验证码${code}，您正在注册成为${product}用户，感谢您的支持！
        $result = $sendsms->send($send);
        dump($result);
//        return $sendsms->entry($id);
    }
    /**
     * 更新配置
     */
    private function update_config(){
        $sms_config = get_cache('config.sms');
        config('sms.terrace',$sms_config['send_mode']);
        config('sms.accessKeyId',$sms_config['sms_appkey']);
        config('sms.secret',$sms_config['sms_secretKey']);
    }
}