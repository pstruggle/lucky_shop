<?php
namespace app\merchant\controller;

use think\Db;
use think\Log;

class Ticket extends Base
{
    private $_ticket;
    private $_ticketType;
    private $_ticketOrder;
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->_ticket = model('ticket');
        $this->_ticketType = model('ticketType');
        $this->_ticketOrder = model('ticketOrder');
    }
    //门票列表
    public function piao_list(){
        $where = ['mid'=>$this->merchant['id']];
        if(input('title')){
            $where['title'] = ['like', '%'.input('title').'%'];
        }
        if (input('status')){
            $where['status'] = input('status');
        }
        $tickets = $this->_ticket->getTickets($where);
        $page = $tickets->render($where);
        $this->assign([
            'title' => '门票列表',
            'tickets' => $tickets,
            'page' => $page
        ]);
        return $this->template();
    }
    // 门票编辑页面
    public function piao_edit(){
        $act = 'add';
        $piao = input('piao');
        if(!empty($piao)){
            $c_where = [ 'id'=>$piao, 'mid'=>$this->merchant['id'] ];
            $ticket = $this->_ticket->where($c_where)->find();
            $ticket_type = Db::table('ly_ticket_type')->where('tid',$ticket['id'])->select();
            $ticket['ticket_type'] = json_encode($ticket_type);
            if(!empty($ticket)){
                $act = 'update';
                $this->assign('ticket',$ticket);
            }
        }
        $this->assign([
            'title' => '门票编辑',
            'act' => $act
        ]);
        return $this->template();
    }
    public function piaoedit(){
//        dump(input());exit;
        $act = input('act');
        $ticket = input('ticket');
        $map = [
            'mid'=> $this->merchant['id'],
            'title'=> input('title')?input('title'):'',
            'address'=> input('address')?input('address'):'',
            'open_time'=> input('open_time')?input('open_time'):'',
            'grade'=> input('grade')?input('grade'):'',
            'desc'=> input('desc')?input('desc'):'',
            'notice'=> input('notice')?input('notice'):'',
            'traffic'=> input('traffic')?input('traffic'):'',
        ];
        $pics = input('pics/a');
        if (empty($pics)){
            $this->error('请上传图片！');
        }
        $map['pic'] = $pics[0];
        $map['pics'] = implode(',',$pics);
        $piao = input('piao/a');
        if(empty($piao)){
            $this->error('请添加票种！');
        }
        $o_prices = [-1,-1];
        $piaos = [];
        $addtime = time();
        foreach ($piao as $k => $value){
            $prices = [-1,-1];
            $mprice = [-1,-1];
            $offers = json_decode($value['offer'],true);
            foreach ($offers as $offer){
                $prices = min_max($prices,$offer['discount']);
                $mprice = min_max($mprice,$offer['market']);
            }
            if(!empty($value['id'])){
                $piaos[$k]['id'] = $value['id'];
            }
            $piaos[$k]['title'] = $value['title'];
            $piaos[$k]['offer'] = $value['offer'];
            $piaos[$k]['desc'] = $value['desc'];
            $piaos[$k]['dmin'] = $prices[0];
            $piaos[$k]['dmax'] = $prices[1];
            $piaos[$k]['mmin'] = $mprice[0];
            $piaos[$k]['mmax'] = $mprice[1];
            $piaos[$k]['addtime'] = $addtime;
            $o_prices = min_max($o_prices,$mprice[0]);
            $o_prices = min_max($o_prices,$mprice[1]);
        }
        $map['minprice'] = $o_prices[0];
        $map['maxprice'] = $o_prices[1];
//        $map['ticket_type'] = json_encode($piao,JSON_UNESCAPED_UNICODE);
        switch ($act){
            case 'add':
                $map['status'] = 1;
                $map['addtime'] = $addtime;
                $result = $this->_ticket->save($map);
                array_walk($piaos,'addKey',['key'=>'tid','val'=>$this->_ticket->id]);
                Db::table('ly_ticket_type')->insertAll($piaos);
                break;
            case 'update' :
                $c_where = [ 'id'=>$ticket, 'mid'=>$this->merchant['id'] ];
                $result = $this->_ticket->save($map,$c_where);
                $d_where = ['tid'=>$ticket];
                $this->_ticketType->where($d_where)->delete();
                array_walk($piaos,'addKey',['key'=>'tid','val'=>$ticket]);
                Db::table('ly_ticket_type')->insertAll($piaos);
                break;
            default :
                return $this->error('未知操作');
                break;
        }
        if($result){
            $this->success('编辑成功',url('Ticket/piao_list'));
        }else{
            $this->error('编辑失败');
        }
    }
    //删除门票信息
    public function piao_del(){
        $piao = input('piao');
        $where = ['id'=>$piao,'mid'=>$this->merchant['id']];
        $result = $this->_ticket->where($where)->delete();
        if($result){
            $this->success('编辑成功',url('Ticket/piao_list'));
        }else{
            $this->error('编辑失败');
        }
    }
    // 门票订单
    public function piao_order(){
        $where = ['o.mid'=>$this->merchant['id']];
        $pay_status = input('pay_status');
        $uid = input('uid');
        $confirm = input('confirm');
        $where['o.mid'] = $this->merchant['id'];
        if(!empty($pay_status)){
            $where['o.pay_status'] = $pay_status;
        }
        if(!empty($uid)){
            $where['o.uid'] = $uid;
        }
        if(!empty($confirm)){
            $where['o.confirm'] = $confirm;
        }
        $orders = $this->_ticketOrder->getOrders($where);
        $page = $orders->render($where);
        $this->assign([
            'title' => '门票订单列表',
            'orders' => $orders,
            'page' => $page

        ]);
        return $this->template();
    }
    // 查看订单
    public function eye_order(){
        $oid = input('oid');
        $where = ['o.id'=>$oid];
        $orders = $this->_ticketOrder->getOrders($where,[],1);
        if(!empty($orders[0])){
            $order = $orders[0];
            $offer = json_decode($order['offer'],true);
            $this->assign([
                'order'=>$order,
                'offer' => $offer
            ]);
        }else{
            $this->error('您的订单不存在');
        }
        $this->assign([
            'title'=> '订单详情',
//            'shops'=> $shops,
//            'page'=> $page,
        ]);
        return $this->template();
    }
    // 编辑订单
    public function editorder(){
        $id = input('id');
        $where = ['id'=>$id,'mid'=>$this->merchant['id']];
        $map = [];
        if(input('confirm')){
            $map['confirm'] = input('confirm');
        }
        $shop = Db::table('ly_ticket_order')->where($where)->find();
        if($shop['pay_status'] != '2'){
            $this->error('该订单未支付，不能操作');
            return ;
        }
        $result = Db::table('ly_ticket_order')->where($where)->update($map);
        if($result){
            $trip = Db::table('ly_ticket')->where(['id'=>$shop['ticket']])->find();
            if($trip){
                $aliyun = controller('api/Aliyun');
                $data = [];
                $data['recNum'] = $shop['contact_phone'];
                if($map['confirm'] == '2'){
                    $data['temp'] = 'sms_order';
                    $data['param'] = [$shop['contact_name'],'订单：'.$shop['onumber'],'已确认','我们'];
                    $get = model('get');
                    $g_result = $get->upper($shop,'mp');
                    $send_result = $aliyun->ajax_send($data);
                    Log::write('send log :'.json_encode($send_result,JSON_UNESCAPED_UNICODE));
                }elseif($map['confirm'] == '3'){
                    $data['temp'] = 'sms_refuse';
                    $data['param'] = [$shop['contact_name'],'订单：'.$shop['onumber'],'被拒绝,将在三天内退 款给您。','我们'];
                    $wepay = controller('api/Wepay');
                    if(empty($shop['refund_on'])){
                        $refund_on = getCache('wechat')['mch_id'].date("YmdHis");
                        $r_map = ['refund_on'=>$refund_on,'refund_time'=>time()];
                        Db::table('ly_ticket_order')->where($where)->update($r_map);
                    }else{
                        $refund_on = $shop['refund_on'];
                    }
                    $price = (int) ($shop['discount'] * 100);
                    $result_wepay = $wepay->refund('',$shop['onumber'],$price,$price,$refund_on);
                    if($result_wepay['return_code'] == 'SUCCESS' && $result_wepay['result_code'] == 'SUCCESS'){
                        model('bill')->mp_add_bill($shop);
                    }
                    $send_result = $aliyun->ajax_send($data);
                    Log::write('send log :'.json_encode($send_result,JSON_UNESCAPED_UNICODE));
                }

            }

            $this->success('编辑成功');
        }else{
            $this->error('编辑失败');

        }
    }
}