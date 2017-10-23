<?php
namespace app\common\model;


use think\Db;

class Brand extends Base
{

    protected function initialize(){
        parent::initialize();
    }
    public function setCache(){
        $name = lcfirst($this->name);

        $brands = $this->order('initial','asc')->select();
        get_cache($name,$brands);
    }
    // 商品品牌编辑
    public function edit($data){
        $map = [
            'name' => $data['name'],
            'url' => $data['url'],
            'is_hot' => $data['is_hot'],
            'sort' => $data['sort'],
            'logo' => !empty($data['logo'])?$data['logo']:'',
            'top_cat_id' => $data['top_cat_id'],
            'parent_cat_id' => $data['parent_cat_id'],
            'cat_id' => $data['cat_id'],
            'desc' => $data['desc'],
        ];
        if($map['cat_id']){
            $map['cat_name'] .= Db::name('category')->where('id',$map['cat_id'])->value('name');
        }elseif($map['parent_cat_id']){
            $map['cat_name'] .= Db::name('category')->where('id',$map['parent_cat_id'])->value('name');
        }elseif($map['top_cat_id']){
            $map['cat_name'] .= Db::name('category')->where('id',$map['top_cat_id'])->value('name');
        }

        $chinese = new \ChineseSpell();
        $map['initial'] = $chinese->getFirstCharter($map['name']);
        $where = [];
        if(!empty($data['id'])){
            $where = ['id'=>$data['id']];
        }
        $result = $this->save($map,$where);
        $this->setCache();
        return $result;
    }
    // 商品品牌列表
    public function listing(){
        $where = [];
        $brands = $this->where($where)->paginate(20);
        $page = $brands->render();
        $list = [
            'title' => '商品品牌列表',
            'brands' => $brands,
            'page' => $page,
        ];
        return $list;
    }
    // 编辑视图控制
    public function edit_view(){
        $id = input('id');
        $where = ['id'=>$id];
        $brand = $this->where($where)->find();
        $value = [
            'title' => '品牌编辑',
            'brand' => $brand,
        ];
        return $value;
    }
}