<?php
namespace app\common\model;

use app\common\model\Basely;
use think\Cookie;
use think\Db;

class Shop extends Basely
{
    private $_shop;

    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_shop = $this;
        $this->_base = $this;
    }
    public function getShops($where=[],$order=[],$page=20){

        $join = [
            [['ww_merchant'=> 'm'] , 's.mid = m.id'],
            [['ww_userinfo'=> 'u'] , 's.uid = u.id'],
            [['ly_trip'=> 't'] , 's.tid = t.id'],
        ];
        $field = ['s.*','m.name','m.phone','u.name uname','u.nickname','u.op','t.title','t.offer offers','t.papers'];
        return $this->_shop
            ->alias('s')
            ->join($join)
            ->field($field)
            ->where($where)->order($order)->paginate($page);
    }
    public function getShopOps($where=[],$order=[],$page = 20){
        $shops = $this->getShops($where,$order,$page);
        foreach ($shops as $k => $shop){
            $shops[$k]['opinfo'] = Db::table('ww_userinfo')->where('id',$shop['op'])->find();
        }
        return $shops;
    }
    //一周的订单
    public function weekOrder($where =[]){
        $times = get_week();
        $weeks = [];
        $where['pay_status'] = 2;
        foreach ($times as $i => $time){
            $where['addtime'] = [];
            if(!empty($times[$i+1])){
                $where['addtime'][] = ['>',$time];
                $where['addtime'][] = ['<=',$times[$i+1]];

            }else{
                if($time){
                    $where['addtime'] = ['>',$time];
                }else{
                    $where['addtime'] = ['<',$time];
                }
            }
            $price = $this->_shop->where($where)->sum('sumprice');
            $weeks[] = $price ? $price : 0;
        }
        return $weeks;
    }
    public function shop_num($where = []){
        $where = array_merge($where,['pay_status'=>'2','confirm'=>'1']);
        return $this->_shop->where($where)->count('id');
    }
}