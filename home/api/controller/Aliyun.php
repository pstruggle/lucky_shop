<?php
namespace app\api\controller;

use think\Controller;

class Aliyun extends Controller
{
    private $aliyun;
    protected function _initialize(){
        parent::_initialize();
        $this->aliyun = getCache('aliyun');
    }
    public function test(){
        date_default_timezone_set('Asia/Shanghai');

        $httpdns = new \HttpdnsGetRequest;
        $client = new \ClusterTopClient("24523079","e95e639fc56ac076a90cdda5fd2c4958");
        $client->gatewayUrl = "http://api.daily.taobao.net/router/rest";
        var_dump($client->execute($httpdns,"6100e23657fb0b2d0c78568e55a3031134be9a3a5d4b3a365753805"));
    }
    // 发送验证码
    public function ajax_send($data=[]){
        $temp = json_decode($this->aliyun[$data['temp']],true);
        $temp['param'] = explode(',',$temp['parameter']);
        $send['recNum'] = $data['recNum'];
        $send['temp'] = $temp['temp'];
        $send['signName'] = $temp['autograph'];
        $param = [];
        foreach ($temp['param'] as $item => $value){
            if($value == ''){
                continue ;
            }
            $param[$value] = $data['param'][$item];
        }
        $send['param'] = empty($param)?'{}':json_encode($param);

        $result = $this->sendSms($send);
//        $result = $this->querySendDetails($send);

        return $result;
        /*
         * ["Message"] => string(15) "模板不合法"
  ["RequestId"] => string(36) "4DDEAC71-15ED-4F63-A64D-A8B187D6033A"
  ["Code"] => string(24) "isv.SMS_TEMPLATE_ILLEGAL"
        {"Message":"OK","RequestId":"0158E9ED-D744-4F5E-B8B6-DBC813528F03","BizId":"108392661040^1111346396672","Code":"OK"}
         * */
//        dump($result);
//        return $result;
    }
    //阿里大鱼发送短信
    public function send_sms($send=[]){
        vendor('Aliyun/TopSdk',EXT);
        dump($this->aliyun);
        $c = new \TopClient;
        $c ->appkey = $this->aliyun['sms_appkey'] ;
        $c ->secretKey = $this->aliyun['sms_secretkey'] ;
        $req = new \AlibabaAliqinFcSmsNumSendRequest;
        $req ->setExtend( "" );
        $req ->setSmsType( "normal" );
        $req ->setSmsFreeSignName( "注册验证" ); //短信签名
        $req ->setSmsParam( "{name:'123456'}" );   //模板参数json{}
        $req ->setRecNum( "15879221657" );      //接手短信验证码
        $req ->setSmsTemplateCode( "SMS_73935003" ); //模板id
        $resp = $c ->execute( $req );
        dump($resp);
    }
    // 阿里云短信发送
    private function sendSms($send=[]) {
        vendor('AliyunSms/api/aliyun-php-sdk-core/Config',EXT);
        vendor('AliyunSms/api/Dysmsapi/Request/V20170525/SendSmsRequest',EXT);
        vendor('AliyunSms/api/Dysmsapi/Request/V20170525/QuerySendDetailsRequest',EXT);
        //此处需要替换成自己的AK信息
        $accessKeyId = $this->aliyun['sms_accessKeyId'];
        $accessKeySecret = $this->aliyun['sms_accessKeySecret'];
        //短信API产品名
        $product = "Dysmsapi";
        //短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";
        //暂时不支持多Region
        $region = "cn-hangzhou";

        //初始化访问的acsCleint
        $profile = \DefaultProfile::getProfile($region, $accessKeyId, $accessKeySecret);
        \DefaultProfile::addEndpoint("cn-hangzhou", "cn-hangzhou", $product, $domain);
        $acsClient= new \DefaultAcsClient($profile);

        $request = new \Dysmsapi\Request\V20170525\SendSmsRequest;
        //必填-短信接收号码
        $request->setPhoneNumbers( $send['recNum'] );
        //必填-短信签名
        $request->setSignName( $send['signName'] );
        //必填-短信模板Code
        $request->setTemplateCode( $send['temp'] );
        //选填-假如模板中存在变量需要替换则为必填(JSON格式)
        $request->setTemplateParam($send['param']);
        //选填-发送短信流水号
        $request->setOutId("1234");

        //发起访问请求
        $acsResponse = $acsClient->getAcsResponse($request);
        return $acsResponse;
    }
    // 查询发送
    public function querySendDetails($send=[]) {

        //此处需要替换成自己的AK信息
        $accessKeyId = $this->aliyun['sms_accessKeyId'];
        $accessKeySecret = $this->aliyun['sms_accessKeySecret'];
        //短信API产品名
        $product = "Dysmsapi";
        //短信API产品域名
        $domain = "dysmsapi.aliyuncs.com";
        //暂时不支持多Region
        $region = "cn-hangzhou";

        //初始化访问的acsCleint
        $profile = \DefaultProfile::getProfile($region, $accessKeyId, $accessKeySecret);
        \DefaultProfile::addEndpoint("cn-hangzhou", "cn-hangzhou", $product, $domain);
        $acsClient= new \DefaultAcsClient($profile);

        $request = new \Dysmsapi\Request\V20170525\QuerySendDetailsRequest();
        //必填-短信接收号码
        $request->setPhoneNumber( $send['recNum'] );
        //选填-短信发送流水号
//        $request->setBizId();
        //必填-短信发送日期，支持近30天记录查询，格式yyyyMMdd
        $request->setSendDate("20170625");
        //必填-分页大小
        $request->setPageSize(10);
        //必填-当前页码
        $request->setContent(1);
        //发起访问请求
        $acsResponse = $acsClient->getAcsResponse($request);
        var_dump($acsResponse);

    }
}