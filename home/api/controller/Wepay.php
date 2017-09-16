<?php
namespace app\api\controller;

use app\api\controller\Webase;
use think\Db;
use think\Log;

class Wepay extends Webase
{
    private $_order;
    private $_cart;
    private $_paylog;
    private $notify_url;
    protected function _initialize(){
        parent::_initialize();
        $this->init();
    }
    //初始化类
    private function init(){
        ini_set('date.timezone','Asia/Shanghai');
        $this->_order = model('orders');
        $this->_cart = model('cart');
//        $this->_paylog = model('paylog');
        $this->notify_url = $this->request->domain().url('Wepay/notify');

    }
    //扫码支付模式一
    public function native1(){
        Vendor("WxpayAPI.lib.WxPay",'.Api.php');
        Vendor("WxpayAPI.example.WxPay",".NativePay.php");
        Vendor("WxpayAPI.example.log",EXT);

        //模式一
        /**
         * 流程：
         * 1、组装包含支付信息的url，生成二维码
         * 2、用户扫描二维码，进行支付
         * 3、确定支付之后，微信服务器会回调预先配置的回调地址，在【微信开放平台-微信支付-支付配置】中进行配置
         * 4、在接到回调通知之后，用户进行统一下单支付，并返回支付信息以完成支付（见：native_notify.php）
         * 5、支付完成之后，微信服务器会通知支付成功
         * 6、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
         */
        $notify = new \NativePay();
        $url1 = $notify->GetPrePayUrl("51351496648815");

        return urlencode($url1);
    }
    //微信支付模式二
    public function native2($data){
        Vendor("WxpayAPI.example.WxPay",".NativePay.php");
        //模式二
        /**
         * 流程：
         * 1、调用统一下单，取得code_url，生成二维码
         * 2、用户扫描二维码，进行支付
         * 3、支付完成之后，微信服务器会通知支付成功
         * 4、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
         */
        $notify = new \NativePay();
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($data['body']);
        $input->SetAttach($data['attach']);
        $input->SetOut_trade_no($data['orders']['onumber']);
        $input->SetTotal_fee($data['prices']);  // 金额
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag($data['goods_tag']);
        $input->SetNotify_url($this->notify_url);
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id($data['product_id']);
        $result = $notify->GetPayUrl($input);
        if($result['result_code'] == 'FAIL'){
            $this->error('请重新下单！');
        }
        $url2 = $result["code_url"];
        return urlencode($url2);
    }
    //生成二维码
    public function qrcode(){
        error_reporting(E_ERROR);
        $url = urldecode($_GET["data"]);
        \QRcode::png($url);
    }
    //微信支付，jsapi
    public function jsapi($data){
        Vendor("WxpayAPI.example.WxPay",".JsApiPay.php");
        //①、获取用户openid
        $tools = new \JsApiPay();
        $url = current_url();
        $openId = $this->GetOpenid($url,false,'');
        //②、统一下单
        $input = new \WxPayUnifiedOrder();
        $input->SetBody($data['body']);
        $input->SetAttach($data['attach']);
        $input->SetOut_trade_no($data['orders']['onumber']);
        $input->SetTotal_fee($data['prices']);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag($data['goods_tag']);
        $input->SetNotify_url($this->notify_url);
        $input->SetTrade_type("JSAPI");
        $input->SetOpenid($openId);
        $order = \WxPayApi::unifiedOrder($input);
        if($order['result_code'] == 'FAIL'){
            $this->error('请重新下单！');
//            $this->error($order['err_code'].$order['err_code_des']);
        }
        $jsApiParameters = $tools->GetJsApiParameters($order);

        //获取共享收货地址js函数参数
        $editAddress = $tools->GetEditAddressParameters();
        $result = [
            'jsApiParameters' => $jsApiParameters,
            'editAddress' => $editAddress
        ];
        return $result;
    }
    // 微信申请退款
    /**
     * 以post方式提交xml到对应的接口url
     *
     * @param string $transaction_id  微信订单号
     * @param string $out_trade_no  商户订单号
     * @param int $total_fee 订单总金额以分为单位
     * @param int $refund_fee   退款金额以分为单位
     * @throws WxPayException
     */

    public function refund($transaction_id='',$out_trade_no='',$total_fee='',$refund_fee='',$out_refund_no=''){
        if(!empty($transaction_id) && $transaction_id != ""){
            $input = new \WxPayRefund();
            $input->SetTransaction_id($transaction_id);
            $input->SetTotal_fee($total_fee);
            $input->SetRefund_fee($refund_fee);
//            $input->SetOut_refund_no(getCache('wechat')['mch_id'].date("YmdHis"));
            $input->SetOut_refund_no($out_refund_no);
            $input->SetOp_user_id(getCache('wechat')['mch_id']);
            $result = \WxPayApi::refund($input);
            model('refund')->add_refund($result);
            return $result;
        }
        //$_REQUEST["out_trade_no"]= "122531270220150304194108";
        //$_REQUEST["total_fee"]= "1";
        //$_REQUEST["refund_fee"] = "1";
        if(!empty($out_trade_no) && $out_trade_no != ""){
            $input = new \WxPayRefund();
            $input->SetOut_trade_no($out_trade_no);
            $input->SetTotal_fee($total_fee);
            $input->SetRefund_fee($refund_fee);
            $input->SetOut_refund_no($out_refund_no);
            $input->SetOp_user_id(getCache('wechat')['mch_id']);
            $result = \WxPayApi::refund($input);
            model('refund')->add_refund($result);
            return $result;
        }
        return ['code'=>'FAIL','info'=>'请传入微信订单号或商户订单号'];
    }
    //微信支付整合
    public function wxpay(){
        $type = input('type');
        $oid = input('oid');
        $data = [];
        if($type == 'ly'){
            $order = Db::table('ly_shop')->where(['id'=>$oid])->find();
            if(empty($order)){
                $this->error('您的订单不存在');
            }
            $data['orders'] = $order;
            $data['attach'] = 'ly';
            $data['price'] = $order['sumprice'];
            $data['prices'] = $order['sumprice'] *100 ;
            $data['goods'] = Db::table('ly_trip')->where(['id'=>$order['tid']])->find();
            $data['body'] = $data['goods']['title'];
            $data['goods_tag'] = "使用积分！";
            $data['product_id']= $data['goods']['id'];
        }else if($type == 'mp'){
            $order = Db::table('ly_ticket_order')->where(['id'=>$oid])->find();
            if(empty($order)){
                $this->error('您的订单不存在');
            }
            $data['orders'] = $order;
            $data['attach'] = 'mp';
            $data['price'] = $order['discount'];
            $data['prices'] = $order['discount'] * 100 ;
            $data['goods'] = Db::table('ly_ticket')->where(['id'=>$order['ticket']])->find();
            $data['body'] = $data['goods']['title'];
            $data['goods_tag'] = "使用积分！";
            $data['product_id']= $data['goods']['id'];
        }elseif($type == 'qz'){
            $order = Db::table('ly_visa_order')->where(['id'=>$oid])->find();
            if(empty($order)){
                $this->error('您的订单不存在');
            }
            $data['orders'] = $order;
            $data['attach'] = 'qz';
            $data['price'] = $order['sumprice'];
            $data['prices'] = $order['sumprice'] * 100 ;
            $data['goods'] = Db::table('ly_visa')->where(['id'=>$order['vid']])->find();
            $data['body'] = $data['goods']['title'];
            $data['goods_tag'] = "使用积分！";
            $data['product_id']= $data['goods']['id'];
        }else{
            $orders = Db::name('orders')->where(['id'=>$oid])->find();
            if(empty($orders)){
                $this->error('您的订单不存在');
            }
            $data['orders'] = $orders;
            $data['attach'] = 'mall';
            $data['price'] = $orders['payprice'];
            $data['prices'] = $orders['payprice'] *100;
            $where = ['oid'=>$oid];
            $data['goods'] = $this->_cart->getCarts($where);
            $data['body'] = $data['goods'][0]['gname'].'等...';
            $data['goods_tag'] = "赠送积分：".$data['orders']['integral'];
            $data['product_id']= $data['goods'][0]['gid'];
        }
        if(is_wechat()){
            $result = $this->jsapi($data);
            $this->assign($result);
            $this->assign('type','1');//微信支付
        }else{
            $result = $this->native2($data);
            $this->assign('url',$result);
            $this->assign('type','2');//微信扫码支付
        }
        $this->assign($data);
        $this->assign('title','小惠猫旅行网-支付确认');
        return view();
    }
    //回调页面
    public function notify(){
        Vendor("WxpayAPI.example.notify",".php");
        $notify = new \PayNotifyCallBack();
        $notify->Handle(false);
        $return_code = $notify->GetReturn_code();
        $return_msg = $notify->GetReturn_msg();
        $result= ['return_code'=>$return_code,'return_msg'=>$return_msg];
        Log::init([
            'path'  =>  LOG_PATH.'wxpay/',
        ]);
        Log::write("notify :". json_encode($result));
        if($return_code == 'SUCCESS'){

            $datas = $notify->GetValues();
            $data = json_decode($datas['data'],true);
            if(!empty($data)){
                if(!empty($data['out_trade_no'])){
                    $oid = $data['out_trade_no'];
                    if($data['attach'] == 'ly'){
                        $where = ['onumber'=>$oid];
                        $shop = Db::table('ly_shop')->where($where)->find();
                        if(empty($shop)){
                            Log::write("order error : 订单不存在！");
                            return false;
                        }
                        if($shop['pay_status'] == 1){
                            $this->add_bill($shop,$data['attach']);
                            $this->send_sms($shop);
                            $map = [
                                'pay_status'=>2,
                                'paytime' => time(),
                                'payment' => 1,
                            ];
                            $result = Db::table('ly_shop')->where($where)->update($map);
                            if($result){
                                $map = [
                                    'uid'=>!empty($data['openid'])?$data['openid']:'',
                                    'attach'=>!empty($data['attach'])?$data['attach']:'',
                                    'transaction_id'=>!empty($data['transaction_id'])?$data['transaction_id']:'',
                                    'out_trade_no'=>!empty($data['out_trade_no'])?$data['out_trade_no']:'',
                                    'msg' => json_encode($data),
                                    'ment' => 1,
                                    'addtime' => time()
                                ];
                                Db::name('paylog')->insert($map);
                            }else{
                                Log::write("order error : 订单修改失败！");
                            }
                        }else{
                            Log::write("order error : 订单已经支付！");
                        }
                    }elseif($data['attach'] == 'mp'){
                        $where = ['onumber'=>$oid];
                        $ticket_order = Db::table('ly_ticket_order')->where($where)->find();
                        if(empty($ticket_order)){
                            Log::write("order error : 订单不存在！");
                            return false;
                        }
                        if($ticket_order['pay_status'] == 1){
                            $this->add_bill($ticket_order,$data['attach']);
                            $this->mp_send_sms($ticket_order);
                            $map = [
                                'pay_status'=>2,
                                'paytime' => time(),
                                'payment' => 1,
                            ];
                            $result = Db::table('ly_ticket_order')->where($where)->update($map);
                            if($result){
                                $map = [
                                    'uid'=>!empty($data['openid'])?$data['openid']:'',
                                    'attach'=>!empty($data['attach'])?$data['attach']:'',
                                    'transaction_id'=>!empty($data['transaction_id'])?$data['transaction_id']:'',
                                    'out_trade_no'=>!empty($data['out_trade_no'])?$data['out_trade_no']:'',
                                    'msg' => json_encode($data),
                                    'ment' => 1,
                                    'addtime' => time()
                                ];
                                Db::name('paylog')->insert($map);
                            }else{
                                Log::write("order error : 订单修改失败！");
                            }
                        }else{
                            Log::write("order error : 订单已经支付！");
                        }
                   }elseif($data['attach'] == 'qz'){
                        $where = ['onumber'=>$oid];
                        $visa_order = Db::table('ly_visa_order')->where($where)->find();
                        if(empty($visa_order)){
                            Log::write("order error : 订单不存在！");
                            return false;
                        }
                        if($visa_order['pay_status'] == 1){
                            $this->add_bill($visa_order,$data['attach']);
                            $this->qz_send_sms($visa_order);
                            $map = [
                                'pay_status'=>2,
                                'paytime' => time(),
                                'payment' => 1,
                            ];
                            $result = Db::table('ly_visa_order')->where($where)->update($map);
                            if($result){
                                $map = [
                                    'uid'=>!empty($data['openid'])?$data['openid']:'',
                                    'attach'=>!empty($data['attach'])?$data['attach']:'',
                                    'transaction_id'=>!empty($data['transaction_id'])?$data['transaction_id']:'',
                                    'out_trade_no'=>!empty($data['out_trade_no'])?$data['out_trade_no']:'',
                                    'msg' => json_encode($data),
                                    'ment' => 1,
                                    'addtime' => time()
                                ];
                                Db::name('paylog')->insert($map);
                            }else{
                                Log::write("order error : 订单修改失败！");
                            }
                        }else{
                            Log::write("order error : 订单已经支付！");
                        }

                    }else{
                        $where = ['onumber'=>$oid];
                        $order = $this->_order->where($where)->find();
                        if(empty($order)){
                            Log::write("order error : 订单不存在！");
                            return false;
                        }

                        if($order['status'] ==1){
                            $this->add_bill($order,$data['attach']);

                            $map = [
                                'status'=> 2,
                                'delivery_status'=> 1,
                                'paytime'=>time(),
                                'payment'=>1,
                            ];
                            $result = $this->_order->editOrder($map,$where);
                            if($result){
                                $map = [
                                    'uid'=>!empty($data['openid'])?$data['openid']:'',
                                    'attach'=>!empty($data['attach'])?$data['attach']:'',
                                    'transaction_id'=>!empty($data['transaction_id'])?$data['transaction_id']:'',
                                    'out_trade_no'=>!empty($data['out_trade_no'])?$data['out_trade_no']:'',
                                    'msg' => json_encode($data),
                                    'ment' => 1,
                                    'addtime' => time()
                                ];
                                Db::name('paylog')->insert($map);

                            }else{
                                Log::write("order error : 订单修改失败！");
                            }
                            Db::name('userinfo')->where('id',$order['uid'])->setInc('integral',$order['integral']);
//                        Db::name('userinfo')->where('id',$order['uid'])->setInc('integral',4);
                            $integra = [
                                'uid'=>$order['uid'],
                                'oid'=>$order['id'],
                                'payprice'=>$order['sumprice'],
                                'integral'=>$order['integral'],
                                'addtime'=>time()
                            ];
                            if(!Db::name('integralog')->insert($integra)){
                                Log::write("integra error : ".json_encode($integra));
                            }
                        }else{
                            Log::write("order error : 订单已经支付！");
                        }
                    }
                }
            }
        }
    }
    //账单添加
    public function add_bill($order,$attach){
        if($attach == 'ly'){
            //旅游账单
            $where = ['mid'=>$order['mid']];
            $bill = Db::name('bill')->where($where)->order(['addtime'=>'desc'])->find();
            $now_balance = empty($bill['nowbalance']) ? 0 : $bill['nowbalance'];
            $take = getCache('take')['m_take'];
            if($order['offer_type'] == 2){
                $mer_give = 0;
                $peoples = explode(',',$order['peoples']);
                $offers = json_decode($order['offer'],true);
                foreach ($peoples as $k => $people){
                    $mer_give += $people * ($offers[$k]['balance'] - take_m($offers[$k]['balance'],$take));
                }
            }else{
                $mer_give = $order['man']*($order['adult_balance'] - take_m($order['adult_balance'],$take)) + $order['child'] * ($order['child_balance'] - take_m($order['child_balance'],$take));
            }
            $map = [
                'mid' => $order['mid'],
                'sid' => '',
                'uid' => $order['uid'],
                'onumber' => $order['onumber'],
                'otype' => '1',
                'odetails' => '用户消费'.$order['sumprice'].'以进入平台',
                'sum' => $order['man']+$order['child'],
                'adult_balance' => $order['adult_balance'],
                'child_balance' => $order['child_balance'],
                'recorded' => $order['sumprice'],
                'mer_give' => $mer_give,
                'integration' => 0,
                'iconsume' => $order['use_integral'],
                'paytime' => time(),
                'nowbalance' => $now_balance + $mer_give,
                'take' => $take,
                'status' => '2',//不冻结
                'addtime' => time(),
            ];
        }elseif($attach == 'mp'){
            //门票账单
            $where = ['mid'=>$order['mid']];
            $bill = Db::name('bill')->where($where)->order(['addtime'=>'desc'])->find();
            $now_balance = empty($bill['nowbalance']) ? 0 : $bill['nowbalance'];
            $take = getCache('take')['m_take'];
            $mer_give = $order['sum'] * ($order['unit_price'] - take_m($order['unit_price'],$take)) ;
            $map = [
                'mid' => $order['mid'],
                'sid' => '',
                'uid' => $order['uid'],
                'onumber' => $order['onumber'],
                'otype' => '3',
                'odetails' => '用户消费'.$order['discount'].'以进入平台',
                'sum' => $order['sum'],
                'recorded' => $order['discount'],
                'mer_give' => $mer_give,
                'integration' => 0,
                'iconsume' => '0',
                'paytime' => time(),
                'nowbalance' => $now_balance + $mer_give,
                'take' => $take,
                'status' => '2',//不冻结
                'addtime' => time(),
            ];
        }elseif($attach == 'qz'){
            //门票账单
            $where = ['mid'=>$order['mid']];
            $bill = Db::name('bill')->where($where)->order(['addtime'=>'desc'])->find();
            $now_balance = empty($bill['nowbalance']) ? 0 : $bill['nowbalance'];
            $take = getCache('take')['m_take'];
            $mer_give = $order['num'] * ($order['sell'] - take_m($order['sell'],$take)) + $order['logistics'] ;
            $map = [
                'mid' => $order['mid'],
                'sid' => '',
                'uid' => $order['uid'],
                'onumber' => $order['onumber'],
                'otype' => '4',
                'odetails' => '用户消费'.$order['sumprice'].'以进入平台',
                'sum' => $order['num'],
                'recorded' => $order['sumprice'],
                'mer_give' => $mer_give,
                'integration' => 0,
                'iconsume' => '0',
                'paytime' => time(),
                'nowbalance' => $now_balance + $mer_give,
                'take' => $take,
                'status' => '2',//不冻结
                'addtime' => time(),
            ];

        }else{
            //商城账单
            $where = ['mid'=>$order['mid']];
            $bill = Db::name('bill')->where($where)->order(['addtime'=>'desc'])->find();
            $now_balance = empty($bill['nowbalance']) ? 0 : $bill['nowbalance'];
            $map = [
                'mid' => $order['mid'],
                'sid' => $order['sid'],
                'uid' => $order['uid'],
                'onumber' => $order['onumber'],
                'otype' => '2',
                'odetails' => '用户消费'.$order['sumprice'].'以进入平台',
                'sum' => $order['sum'],
                'adult_balance' => 0,
                'child_balance' => 0,
                'recorded' => $order['sumprice'],// 入账金额
                'mer_give' => $order['sumprice'],// 商户所得金额
                'integration' => $order['integral'], // 购买所获得积分
                'iconsume' => '0',// 使用积分
                'paytime' => time(),
                'nowbalance' => $now_balance + $order['sumprice'],
                'take' => '0',
                'status' => '1',//冻结
                'addtime' => time(),
            ];
        }
        Db::name('bill')->insert($map);
    }
    //为上级业务员添加余额
    public function upper($order,$attach){
        $uid = $order['uid'];
        $user = Db::name('userinfo')->where('id',$uid)->find();
        if(empty($user)){
            return false ;
        }
        switch ($attach){
            case 'ly' :
                $offer = json_decode($order['offer'],true);
                $take = getCache('take')['core_take']-getCache('take')['salesman_take'];
                $price = ( $order['man']*( $offer['adult'] - $offer['adult_balance'] )  + $order['child'] * ( $offer['children'] - $offer['child_balance'] ) ) * $take / 100;
                $map = [
                    'uid' => $user['id'],
                    'puid' => $user['puid'],
                    'oid' => $order['id'],
                    'price' => $price,
                    'type' => 1,
                    'addtime' => time()
                ];
                break ;
            case 'mp' :
                $offer = json_decode($order['offer'],true);
                $take = getCache('take')['core_take']-getCache('take')['salesman_take'];
                $price = $order['sum'] * ($offer['market']-$offer['discount']) * $take / 100;
                $map = [
                    'uid' => $user['id'],
                    'puid' => $user['puid'],
                    'oid' => $order['id'],
                    'price' => $price,
                    'type' => 2,
                    'addtime' => time()
                ];
                break;
            default:
                $map = [];
                break;
        }
        Db::table('ww_get')->insert($map);
    }
    // 支付成功发送短信通知
    public function send_sms($order){
        $trip = Db::table('ly_trip')->where(['id'=>$order['tid']])->find();
        if(!$trip){
            return '行程不存在';
        }
        $aliyun = controller('api/Aliyun');
        $infos = Db::table('ww_apply')->where('uid',$order['uid'])->field(['name','phone'])->find();
        $data = [];
        $data['recNum'] = $infos['phone'];
        $data['param'] = [$infos['name'],$trip['title'],'等待确认', '供应商'];
        $data['temp'] = 'sms_order';
        $result = $aliyun->ajax_send($data);
        Log::write("send log : ".json_encode($result));
        $merchant = Db::table('ww_merchant')->where('id',$trip['mid'])->find();
        $data['recNum'] = $merchant['phone'];
        $data['param'] = [$merchant['name'],''];
        $data['temp'] = 'sms_mch_order';
        $result = $aliyun->ajax_send($data);
        Log::write("send log : ".json_encode($result,JSON_UNESCAPED_UNICODE));
        return $result;
    }
    //门票短信通知
    public function mp_send_sms($order){
//        Log::write('test log:' . json_encode($order));
        $ticket = Db::table('ly_ticket')->where('id',$order['ticket'])->find();
        if (empty($ticket)){
            return '门票不存在！';
        }
        $aliyun = controller('api/Aliyun');
        $data = [];
        $data['recNum'] = $order['contact_phone'];
        $data['param'] = [$order['contact_name'],$ticket['title'],'等待确认','我们'];
        $data['temp'] = 'sms_order';
        $result = $aliyun->ajax_send($data);
        Log::write("send log : ".json_encode($result,JSON_UNESCAPED_UNICODE));
        return $result ;
    }
    //门票短信通知
    public function qz_send_sms($order){
//        Log::write('test log:' . json_encode($order));
        $visa = Db::table('ly_visa')->where('id',$order['vid'])->find();
        if (empty($visa)){
            return '签证不存在！';
        }
        $aliyun = controller('api/Aliyun');
        $data = [];
        $data['recNum'] = $order['contact_phone'];
        $data['param'] = [$order['contact_name'],$visa['title'],'等待确认','我们'];
        $data['temp'] = 'sms_order';
        $result = $aliyun->ajax_send($data);
        Log::write("send log : ".json_encode($result,JSON_UNESCAPED_UNICODE));
        return $result ;
    }
    //判断是否支付成功
    public function pay_success(){
        $id = input('oid');
        $type = input('type');
        if($type == 'mall'){
            $order = $this->_order->where(['onumber'=>$id])->find();
            if($order['status'] > 1){
                return '1';
            }else{
                return '0';
            }
        }elseif($type == 'mp'){
            $order = Db::table('ly_ticket_order')->where('onumber',$id)->find();
            if($order['pay_status'] > 1){
                return '1';
            }else{
                return '0';
            }
        }elseif($type == 'qz'){
            $order = Db::table('ly_visa_order')->where('onumber',$id)->find();
            if($order['pay_status'] > 1){
                return '1';
            }else{
                return '0';
            }
        }else{
            $order = Db::table('ly_shop')->where(['onumber'=>$id])->find();
            if($order['pay_status'] > 1){
                return '1';
            }else{
                return '0';
            }
        }

    }
    /*    public function jsapi(){
            Vendor("WxpayAPI.lib.WxPay",'.Api.php');
            Vendor("WxpayAPI.example.WxPay",".JsApiPay.php");
            $oid = input('oid');
            $orders = $this->_order->getList(['id'=>$oid],[],1);
            if(!empty($orders[0])){
                $orders = $orders[0];
            }
            $price = $orders['sumprice'] + $orders['freight'];
            $prices = $price *100;
            $where = ['oid'=>$oid];
            $goods = $this->_cart->getCarts($where);
            //①、获取用户openid
            $tools = new \JsApiPay();
            $openId = $this->GetOpenid();
            //②、统一下单
            $input = new \WxPayUnifiedOrder();
            $input->SetBody("小惠猫旅行网");
            $input->SetAttach($oid);
            $input->SetOut_trade_no($orders['onumber']);
            $input->SetTotal_fee($prices);
            $input->SetTime_start(date("YmdHis"));
            $input->SetTime_expire(date("YmdHis", time() + 600));
            $input->SetGoods_tag("优惠积分：");
            $input->SetNotify_url("http://paysdk.weixin.qq.com/example/notify.php");
            $input->SetTrade_type("JSAPI");
            $input->SetOpenid($openId);
            $order = \WxPayApi::unifiedOrder($input);
            if($order['result_code'] == 'FAIL'){
                $this->error($order['err_code'].$order['err_code_des']);
            }
            $jsApiParameters = $tools->GetJsApiParameters($order);

            //获取共享收货地址js函数参数
            $editAddress = $tools->GetEditAddressParameters();
            $this->assign([
                'jsApiParameters' => $jsApiParameters,
                'editAddress' => $editAddress,
                'price' => $price,
                'orders' => $orders,
                'goods' => $goods,
                'title' => '小惠猫旅行网-支付确认',
            ]);
            return view();
        }*/
    public function native(){
        dump(config('log.path'));
//        Vendor("WxpayAPI.lib.WxPay",'.Api.php');
        Vendor("WxpayAPI.example.WxPay",".NativePay.php");

        //模式一
        /**
         * 流程：
         * 1、组装包含支付信息的url，生成二维码
         * 2、用户扫描二维码，进行支付
         * 3、确定支付之后，微信服务器会回调预先配置的回调地址，在【微信开放平台-微信支付-支付配置】中进行配置
         * 4、在接到回调通知之后，用户进行统一下单支付，并返回支付信息以完成支付（见：native_notify.php）
         * 5、支付完成之后，微信服务器会通知支付成功
         * 6、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
         */
        $notify = new \NativePay();
        $url1 = $notify->GetPrePayUrl("51351496648815");

//        return $url1;
        //模式二
        /**
         * 流程：
         * 1、调用统一下单，取得code_url，生成二维码
         * 2、用户扫描二维码，进行支付
         * 3、支付完成之后，微信服务器会通知支付成功
         * 4、在支付成功通知中需要查单确认是否真正支付成功（见：notify.php）
         */
        $input = new \WxPayUnifiedOrder();
        $input->SetBody("北京");
        $input->SetAttach("test");
        $input->SetOut_trade_no($this->wConfig['mch_id'].date("YmdHis"));
        $input->SetTotal_fee("1");  // 金额
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 600));
        $input->SetGoods_tag("test");
        $input->SetNotify_url('http://wenwen.xhmlxw.com'.url('Wepay/notify'));
        $input->SetTrade_type("NATIVE");
        $input->SetProduct_id("123456789");
        $result = $notify->GetPayUrl($input);
        dump($input->GetMch_id());
        $url2 = $result["code_url"];
        echo "<img src='".url('Wepay/qrcode')."?data=".urlencode($url1)."' />";
        echo "<img src='".url('Wepay/qrcode')."?data=".urlencode($url2)."' />";
    }

}