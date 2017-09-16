<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;
use think\Cookie;
use think\Db;

class Merchant extends Base
{
    private $_bill;
    protected function _initialize(){
        parent::_initialize();
        $this->_bill = model('bill');
    }
    //用户信息
    public function info(){
        $this->assign([
            'title' => '个人资料'
        ]);
        return $this->template();
    }
    //编辑
    public function edit(){
        $map = [];
        $map['name'] = input('name')?input('name'):'';
        $map['phone'] = input('phone')?input('phone'):'';
        $map['email'] = input('email')?input('email'):'';
        $map['province'] = input('province')?input('province'):'';
        $map['city'] = input('city')?input('city'):'';
        $map['county'] = input('county')?input('county'):'';
        $passwd = input('passwd');
        if(!empty($passwd)){
            $map['passwd'] = $passwd;
        }
        $result = $this->_merchant->merchantMod($map,$this->merchant['id']);
        if($result['code'] == 0){
            $this->error($result['info']);
        }
        $errors['info'] = '修改成功';
        $this->success($errors['info']);
    }
    /*
    * 账单列表
    * */
    public function bill(){
        $mid = input('mid');
        $onumber = input('onumber');
        $where = ['mid'=>$this->merchant['id']];
        $order = ['addtime'=> 'desc'];
        if(!empty($onumber)){
            $where['onumber'] = ['like','%'.$onumber.'%'];
        }
        $m_where = ['status'=>2];
        $merchants = $this->_merchant->where($m_where)->select();
        $bills = $this->_bill->getBills($where,$order);
        $page = $bills->render();
        $this->assign([
            'title' => '账单列表',
            'bills' => $bills,
            'page' => $page,
            'merchants' => $merchants,
        ]);
        return $this->template();
    }
    //账单详情
    public function bill_desc(){
        $id = input('bill');
        $where = ['id'=>$id,'mid'=>$this->merchant['id']];
        $bill = $this->_bill->getBill($where);
        if(empty($bill['order'])){
            return '<h1>特殊订单</h1>';
        }
        $offer = json_decode($bill['order']['offer'],true);
        $this->assign([
            'title' => '账单详情',
            'bill' => $bill,
            'offer' => $offer,
        ]);
        return $this->template();

    }

}