<?php
namespace app\common\model;

use app\common\model\Base;
use think\Db;
use think\Loader;
use think\Model;

class Goods extends Base
{

    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_base = $this;
    }
    // 商品编辑
    public function edit($data){
        $good = $data;
        unset($good['spec_name'],$good['spec_attr'],$good['shop_prices'],$good['store_counts'],$good['goods_sns'],$good['market_prices']);
        if(empty($good['original_img'])){
            $this->error = '请上传商品缩略图';
            return false;
        }
        if(empty($good['goods_img'])){
            $this->error = '请上传商品相册';
            return false;
        }
        $good['last_update'] = time();
        $good['goods_img'] = implode(',',$good['goods_img']);
        $where = [];
        if(!empty($good['goods_id'])){
            $where = ['goods_id'=>$good['goods_id']];
        }
        $this->save($good,$where);
        $goods_id = $this->getLastInsID()?:$good['goods_id'];
        dump($this->specs_group($data,$goods_id));
    }
    // 商品列表
    public function listing(){
        $goods = $this->get_goods();
        $assign = [
            'title' => '商品列表',
            'goods' => $goods
        ];
        return $assign;
    }
    // 编辑商品
    public function edit_view(){
        $id = input('id');
        $assign = [];
        if(!empty($id)){
            $where = ['goods_id'=>$id];
            $good = $this->get_good($where);
            $assign = $good;
        }
        $assign['title'] = '商品编辑';
        return $assign;
    }
    // 规格，规格属性添加
    public function specs($spec_name,$spec_attr,$goods_id){
        $ids = [];
        Db::name('spec')->where('good_id',$goods_id)->delete();
        foreach ($spec_name as $k => $name){
            $map = [
                'good_id'=>$goods_id,
                'pid' =>0,
                'spec' => $name
            ];
            $names = Db::name('spec')->insert($map);
            $nid = Db::name('spec')->getLastInsID();
            $spec_attrs = explode(',',$spec_attr[$k]);
            foreach ($spec_attrs as $attr){
                $attrs = [
                    'good_id'=>$goods_id,
                    'pid' =>$nid,
                    'spec' => $attr
                ];
                $names = Db::name('spec')->insert($attrs);
                $ids[$k][] = Db::name('spec')->getLastInsID();
            }
        }
        return $ids;
    }
    // 规格，规格属性添加
    public function specs_group($data,$goods_id){
        $ids = $this->specs($data['spec_name'],$data['spec_attr'],$goods_id);
        Db::name('spec_group')->where('goods_id',$goods_id)->delete();
        $ids = spec($ids);
        foreach ($ids as $k => $id){
            $map =[
                'goods_id'=>$goods_id,
                'specs' => $id,
                'market_price' => $data['market_prices'][$k]?:'',
                'shop_price' => $data['shop_prices'][$k],
                'store_count' => $data['store_counts'][$k],
                'goods_sn' => $data['goods_sns'][$k],
            ];
            Db::name('spec_group')->insert($map);
        }
        return true;
    }
    // 规格信息
    public function get_specs($good_id,$pid=0){
        $where = ['good_id'=>$good_id,'pid'=>$pid];
        $specs = Db::name('spec')->where($where)->select();

        $specss = [];
        foreach ($specs as $spec){
            $specss[$spec['id']][] = $spec['spec'];
            $specss[$spec['id']][] = $this->get_specs($good_id,$spec['id']);
        }
        return $specss;
    }
    // 规格分组信息
    public function get_spec_groups($goods_id){
        return Db::name('spec_group')->where('goods_id',$goods_id)->select();
    }
    // 商品列表
    public function get_goods($where=[],$order=[],$page = 20){
        $join = [
            ['category c',"g.cat_id = c.id",'LEFT'],
        ];
        $field = ['g.*','c.name category'];
        $goods = $this->join($join)
            ->alias('g')
            ->where($where)
            ->field($field)
            ->order($order)
            ->paginate($page);
        return $goods;
    }
    // 获取单一商品
    public function get_good($where=[]){
        $good = $this->where($where)->find();
        if(empty($good)){
            // 商品不存在
            return false;
        }
        $cat_ids = $good['top_cat_id'].','.$good['pcat_id'].','.$good['cat_id'];
        //分类
        $categorys = Db::name('category')->where('id','in',$cat_ids)->column('name','id');
        // 品牌
        $brand = Db::name('brand')->where('id',$good['brand_id'])->column('name','id');
        // 物流
        $logistic = Db::name('logistics')->where('id',$good['shipping_area_ids'])->find();
        // 规格
        $specs = $this->get_specs($good['goods_id']);
//        dump($specs);
        // 规格分组
        $spec_groups = $this->get_spec_groups($good['goods_id']);
        $goods = [
            'good' => $good,
            'categorys' => $categorys,
            'brand' => $brand,
            'logistic' => $logistic,
            'specs' => $specs,
            'spec_groups' => $spec_groups
        ];
        return $goods;
    }
}
