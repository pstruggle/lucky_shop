<?php
namespace app\common\model;

use app\common\model\Base;
use think\Db;

class Address extends Base
{
    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_base = $this;
    }
    //添加商品进入购物车
    public function edit($data){
        $where = [];
        if(!empty($data['id'])){
            $where['id'] = $data['id'];
        }
        $area = get_cache('area');
        $data['province_area'] = $area[$data['province']][0];
        $data['city_area'] = $area[$data['province']][1][$data['city']][0];
        $data['county_area'] = $area[$data['province']][1][$data['city']][1][$data['county']][0];
        $addr = $this->where(['uid'=>$data['uid'],'is_default'=>'1'])->find();
        if(empty($addr)){
            $data['is_default'] = 1;
        }
        $data['addtime'] = time();
        return $this->save($data,$where);
    }
    // 获取用户收货地址
    public function get_address($where=[],$order=[],$page=20){
        $address = $this->where($where)->order($order)->paginate($page);
        return $address;
    }
    // 用户修改用户地址
    public function modify($data){
        if(!empty($data['is_default'])){
            $this->where(['uid'=>$data['uid'],'is_default'=>1])->update(['is_default'=>0]);
            return $this->where(['uid'=>$data['uid'],'id'=>$data['id']])->update($data);
        }
    }
}