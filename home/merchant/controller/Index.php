<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;
use think\Cookie;
use think\Db;

class Index extends Base
{
    protected function _initialize(){
        parent::_initialize();
    }
    public function index()
    {
        $bill_model = model('bill');
        $sum_where = ['mid'=>$this->merchant['id']];
        //待处理金额
        $cl_price = model('drawing')->where(['mid'=>$this->merchant['id'],'status'=>1])->sum('price');
        $ye_bill = $bill_model->where($sum_where)->sum('mer_give');
        $this->assign([
            'ye_bill' => $ye_bill,
            'cl_price' => $cl_price
        ]);
        //总进账
        $sum_where['otype'] = ['neq',9];
        $bill = $bill_model->where($sum_where)->sum('mer_give');
        $weekBill = $bill_model->getWeekBill($sum_where,'mer_give');
        $this->assign([
            'weekBill'=>$weekBill,
            'bill' => $bill
        ]);
        //商城进账
        $sum_where['otype'] = 2;
        $shop_price = $bill_model->getWeekBill($sum_where,'mer_give');
        $shop_bill = $bill_model->where($sum_where)->sum('mer_give');
        $this->assign([
            'shop_price'=>$shop_price,
            'shop_bill' => $shop_bill
        ]);
        //旅游进账
        $sum_where['otype'] = 1;
        $ly_price = $bill_model->getWeekBill($sum_where,'mer_give');
        $ly_bill = $bill_model->where($sum_where)->sum('mer_give');
        $this->assign([
            'ly_price'=>$ly_price,
            'ly_bill' => $ly_bill
        ]);
        //门票进账
//        $sum_where['otype'] = 3;
//        $k_price = $bill_model->getWeekBill($sum_where,'mer_give');
//        $k_bill = $bill_model->where($sum_where)->sum('mer_give');
//        $this->assign([
//            'k_price'=> $k_price,
//            'k_bill' => $k_bill
//        ]);
        //门票进账
        $sum_where['otype'] = 3;
        $mp_price = $bill_model->getWeekBill($sum_where,'mer_give');
        $mp_bill = $bill_model->where($sum_where)->sum('mer_give');
        $this->assign([
            'mp_price'=> $mp_price,
            'mp_bill' => $mp_bill
        ]);
        //签证进账
        $sum_where['otype'] = 4;
        $qz_price = $bill_model->getWeekBill($sum_where,'mer_give');
        $qz_bill = $bill_model->where($sum_where)->sum('mer_give');
        $this->assign([
            'qz_price'=> $qz_price,
            'qz_bill' => $qz_bill
        ]);

        $this->assign([
            'title' => '商户首页'
        ]);
        return $this->template();
    }
    // 商户提成申请
    public function drawing(){
        $bill_model = model('bill');
        $drawing_model = model('drawing');
        $price = input('price');
        $sum_where = ['mid'=>$this->merchant['id']];
        $ye_bill = $bill_model->where($sum_where)->sum('mer_give');
        if($price > $ye_bill){
            return $this->error('提款金额大于您的余额！');
        }
        $b_result = $bill_model->tk_add_bill($this->merchant['id'],$price);
        $bid = $bill_model->getLastInsID();
        $map = [
            'mid'=>$this->merchant['id'],
            'bid'=>$bid,
            'price' => $price,
            'status' => '1',
            'addtime' => time()
        ];
        $result = $drawing_model->save($map);
        if($b_result && $result){
            return $this->success('申请成功！');
        }
        return $this->error('申请失败');

    }

}