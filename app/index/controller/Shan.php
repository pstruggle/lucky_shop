<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/10/23
 * Time: 10:24
 */

namespace app\index\controller;


class Shan extends Base
{
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }
    // 支付跳转
    public function index(){
        if(!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $data = input('post.');
        /**
         * $parameter = [
         *      'body' => '', // 订单描述
         *      'out_order_no' => '', //商户网站订单系统中唯一订单号，必填
         *      'total_fee' => '', // 付款金额 必填  必须为正数
         *      'subject' => '' // 订单名称
         * ]
         */
        $parameter = [
            'body' => $data['body'], // 订单描述
            'out_order_no' => $data['out_order_no'], //商户网站订单系统中唯一订单号，必填
            'total_fee' => $data['total_fee'], // 付款金额 必填  必须为正数
            'subject' => $data['subject'] // 订单名称
        ];
        $domain = $this->request->domain();
        $parameter['notify_url'] = $domain.url('index/shan/notify_url'); //服务器异步通知页面
        //需http://格式的完整路径，不能加?id=123这类自定义参数
        $parameter['return_url'] = $domain.url('index/shan/return_url'); //页面跳转通知页面
        //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/
        $payment = get_cache('config.payment');
        $parameter['partner'] = $payment['ytf_partner']; // 商户PID
        $parameter['user_seller'] = $payment['ytf_user_seller']; // 商户号
        $key = $payment['ytf_key']; //商户$key

        //建立请求
        $html_text = buildRequestFormShan($parameter, $key);
        echo $html_text;

    }
    // 服务器异步通知
    public function notify_url(){
        //计算得出通知验证结果
        $payment = get_cache('config.payment');
        $partner = $payment['ytf_partner']; // 商户PID
        $key = $payment['ytf_key']; //商户$key
        $shanNotify = md5VerifyShan($_REQUEST['out_order_no'],$_REQUEST['total_fee'],$_REQUEST['trade_status'],$_REQUEST['sign'],$key,$partner);
        if($shanNotify) {//验证成功
            if($_REQUEST['trade_status']=='TRADE_SUCCESS'){
                /*
                加入您的入库及判断代码;
                判断返回金额与实金额是否想同;
                判断订单当前状态;
                完成以上才视为支付成功
                */
                //商户订单号
                $out_trade_no = $_REQUEST['out_order_no'];
                //云通付交易号
                $trade_no = $_REQUEST['trade_no'];
                //价格
                $price=$_REQUEST['total_fee'];
                // var_dump($_REQUEST);
            }
            echo 'success';

        }else {
            //验证失败
            echo "fail";//请不要修改或删除
        }
    }
    // 页面跳转通知
    public function return_url(){
        //计算得出通知验证结果
        $payment = get_cache('config.payment');
        $partner = $payment['ytf_partner']; // 商户PID
        $key = $payment['ytf_key']; //商户$key

        $shanNotify = md5VerifyShan($_REQUEST['out_order_no'],$_REQUEST['total_fee'],$_REQUEST['trade_status'],$_REQUEST['sign'],$key,$partner);
        if($shanNotify) {//验证成功
            if($_REQUEST['trade_status']=='TRADE_SUCCESS'){
                /*
                加入您的入库及判断代码;
                判断返回金额与实金额是否想同;
                判断订单当前状态;
                完成以上才视为支付成功
                */
                //商户订单号
                $out_trade_no = $_REQUEST['out_order_no'];
                //云通付交易号
                $trade_no = $_REQUEST['trade_no'];
                //价格
                $price=$_REQUEST['total_fee'];
                var_dump($_REQUEST);
                echo "支付成功";
            }else{
                echo "支付失败";
            }

        }
        else {
            //验证失败
            echo "验证失败";
        }
    }
    // 测试页面
    public function sub(){

        return $this->template();
    }
}