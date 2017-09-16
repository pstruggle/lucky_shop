<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;


class Arder extends Base
{
    private $_goods;
    private $_order;

    protected function _initialize()
    {
        parent::_initialize();
        $this->_goods = model('goods');
        $this->_order = model('orders');
    }
    // 旅游休闲卡列表
    public function arder_list(){
        $where = ['mid'=>$this->merchant['id']];
        if (input('tradename')){
            $where['tradename']= ['like','%'.input('tradename') .'%'];
        }
        if (input('id')){
            $where['a.id'] = input('id');
        }
        $arders = $this->_goods->getArders($where);
        $this->assign([
            'title' => '旅游休闲卡列表',
            'arders' => $arders
        ]);
        return $this->template();
    }
    // 休闲卡编辑
    public function arder_edit(){
        $act = 'add';
        $id = input('id');
        $where = ['type'=>'1','id'=>$id];
        $arder = $this->_goods->where($where)->find();
        if( !empty( $arder ) ){
            $act = 'update';
        }
        $this->assign([
            'title' => '旅游休闲卡列表',
            'arder' => $arder,
            'act' => $act,
            'id' => $id
        ]);
        return $this->template();
    }
    // 休闲卡编辑操作
    public function arderedit(){
        $act = input('act');
        $id = input('id');
        $map = [
            'mid' => $this->merchant['id'],
            'tradename'=> input('title')?input('title'):'',
            'oriprice'=> input('original_price')?input('original_price'):'',
            'ingprice'=> input('ruling_price')?input('ruling_price'):'',
            'tradecode'=> input('tradecode')?input('tradecode'):'',
            'details'=> input('details')?input('details'):'',
            'status' => input('status')?input('status'):'',
            'unit' => '张',
            'type' => '1',
            'stock'=> input('stock')?input('stock'):'',
        ];
        $pics = input('pics/a');
        if (empty($pics)){
            $this->error('请上传休闲卡图片！');
        }
        $map['pic'] = $pics[0];
        $map['navpic'] = implode(',', $pics);
        switch ($act){
            case 'add':
                $map['addtime'] = time();
                $result = model('goods')->save($map);
                break;
            case 'update':
                $where = ['id'=>$id];
                $result = model('goods')->save($map,$where);
                break ;
            default :
                $this->error('未知操作');
                break;
        }
        if($result){
            $this->success('编辑成功','Arder/arder_list');
        }else{
            $this->error('编辑失败');
        }
    }
    //删除攻略操作
    public function arder_del(){
        $id = input('id');
        $where = ['type'=>'1','id'=>$id];
        $result = $this->_goods->where($where)->delete();
        if($result){
            $this->success('编辑成功');
        }else{
            $this->error('编辑失败');
        }
    }
    // 订单列表
    public function Arder_orders(){
        $where = ['mid'=>$this->merchant['id'],'sid'=>0];
        $order = ['addtime'=>'desc'];
        if(!empty($_GET['status'])){
            $where['status'] = $_GET['status'];
        }
        if(!empty($_GET['refund'])){
            $where['refund_status'] = $_GET['refund'];
        }
        if(!empty($_GET['delivery'])){
            $where['delivery_status'] = $_GET['delivery'];
        }
        if(!empty($_GET['onumber'])){
            $where['onumber'] = ['like','%'.$_GET['onumber'].'%'];
        }
        $orderslists = $this->_order->getList($where,$order,20);
        $page = $orderslists->render();
        $this->assign([
            'title' => '订单列表',
            'orderslists' => $orderslists,
            'page' => $page,
        ]);
        return $this->template();
    }
}