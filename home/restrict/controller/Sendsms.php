<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017\9\19 0019
 * Time: 23:27
 */

namespace app\restrict\controller;


use think\Controller;

class Sendsms extends Controller
{
    /**
     * 验证短信
     */
    public function index($id = "")
    {
        $prompt = ['code'=>0,'info'=>'发送成功'];
        if(!$this->request->isPost()){
            $prompt['code'] = 1;
            $prompt['info'] = '请求出错';
            return json_encode($prompt);
        }
        $this->update_config();
        $sendsms = new \think\sendsms\Sendsms();
        $code = $sendsms->entry($id);
        $scene = input('post.scene');
        $phone = input('post.phone');
        $smstemp = get_cache('smsTemp')[$scene];

//        $scene = 'scene_reg';
//        $phone = '15879221657';
        if(empty($scene) || empty($phone) || empty($smstemp)){
            $prompt['code'] = 1;
            $prompt['info'] = '参数错误';
            return json_encode($prompt);
        }else{
            $param = sms_param($smstemp['param'],$code);
            $send = [
                'recNum' => $phone,
                'signName' => $smstemp['sign_name'],
                'temp' => $smstemp['temp_code'],
                'param' => $param,
                'outId' => serial('sms')
            ];
//        dump($sendsms->check($code,$id));
            $result = $sendsms->send($send);
            if($result->Message != 'OK' ||
                $result->Code != 'OK'){
                $prompt['code'] = 1;
                $prompt['info'] = '发送失败';
            }
        }
        return json_encode($prompt);
    }
    /**
     * 验证短信验证码是否正确
     */
    public function check($id=''){
        $this->update_config();
        $sendsms = new \think\sendsms\Sendsms();
        $code = input('code');
        return $sendsms->check($code,$id);
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