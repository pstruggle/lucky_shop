<?php
namespace aliyun;
/**
 * Created by PhpStorm.
 * User: 纯简
 * Date: 2017/9/15
 * Time: 9:09
 */
class Aliyun
{
    protected $config;
    public function __construct($config = [])
    {
        require_once (__DIR__.'/api/aliyun-php-sdk-core/Config'.EXT);
        require_once (__DIR__.'/api/Dysmsapi/SendSmsRequest'.EXT);
        require_once (__DIR__.'/api/Dysmsapi/QuerySendDetailsRequest'.EXT);
        $this->config = $config;
    }
    /**
     * 发送短信
     */
    public function send($send){
        $accessKeyId = $this->config['accessKeyId'];
        $accessKeySecret = $this->config['secret'];
        //短信API产品名
        $product = "Dysmsapi";
        //短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";

        $region = "cn-hangzhou";
        $profile = \DefaultProfile::getProfile($region, $accessKeyId, $accessKeySecret);
        \DefaultProfile::addEndpoint("cn-hangzhou", "cn-hangzhou", $product, $domain);
        $acsClient= new \DefaultAcsClient($profile);
//        $send = [
//            'recNum' => 15879221657,
//            'signName' => '小惠猫',
//            'temp' => 'SMS_73920020',
//            'param' => '{"code":"123456","product":"123456"}',
//            'outId' => ''
//        ];
        $request = new api\Dysmsapi\SendSmsRequest;
        //必填-短信接收号码
        $request->setPhoneNumbers( $send['recNum'] );
        //必填-短信签名
        $request->setSignName( $send['signName'] );
        //必填-短信模板Code
        $request->setTemplateCode( $send['temp'] );
        //选填-假如模板中存在变量需要替换则为必填(JSON格式)
        $request->setTemplateParam($send['param']);
        //选填-发送短信流水号
        $request->setOutId($send['outId']);
        //发起访问请求
        $acsResponse = $acsClient->getAcsResponse($request);
        return $acsResponse;
    }
}