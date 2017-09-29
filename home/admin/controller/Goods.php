<?php
namespace app\admin\controller;

use app\admin\controller\Base;
use think\Db;
use think\Exception;
use think\exception\ClassNotFoundException;

class Goods extends Base
{
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }

    // 库存列表
    public function stock_list(){
        $this->assign([
            'title' => '商品列表',
        ]);
        return $this->template();
    }

    // 列表控制器
    public function listing(){
        $action = input('action');
        try{
            $_model = model($action);
            $result = $_model->listing();

        }catch (Exception $e){
            dump($e->getMessage());
            return $this->error('操作错误');
        }catch (ClassNotFoundException $c){
            return $this->error('操作错误');
        }
        $this->assign($result);
        return $this->template($action.'_list');
    }

    // 编辑视图控制器
    public function edit_view(){
        $action = input('action');
        try{
            $_model = model($action);
            $result = $_model->edit_view();

        }catch (Exception $e){
            dump($e->getMessage());

//            return $this->error('操作错误');
        }catch (ClassNotFoundException $c){
            dump($c->getMessage());

//            return $this->error('操作错误');
        }
        $this->assign($result);
        return $this->template($action.'_edit');
    }

    // 各种编辑操作
    public function edit(){
        if (!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $action = input('action');
        $data = input('post.');
        try{
            $_model = model($action);
            $result = $_model->edit($data);

        }catch (Exception $e){
            dump($e->getMessage());
//            return $this->error('操作错误');
        }catch (ClassNotFoundException $c){
            dump($c->getMessage());

            return $this->error('操作错误');
        }
        if (!$result){
//            return $this->error($_model->getError());
        }
//        return $this->redirect('admin/Goods/listing',['action'=>$action]);
    }
    // 异步返回产品分类
    public function ajax_category(){
        $where = ['pid'=>input('get.pid')];
        $_category = model('category');
        $categorys = $_category->getCategory($where);
        return json($categorys);
    }
    // 异步返回品牌
    public function ajax_brand(){
        return json(get_cache('brand'));
    }
    // 异步物流模板
    public function ajax_logistics(){
        return json(get_cache('logistics'));
    }
    // 异步返回商品
    public function ajax_spec(){
        $goods_id = input('goods_id');
        $_goods = model('goods');
        $spec = $_goods->get_specs($goods_id);
        $spec_group = $_goods->get_spec_groups($goods_id);
        $result = [
            'spec'=>$spec,
            'spec_group' => $spec_group
        ];
        return json($result);
    }
}