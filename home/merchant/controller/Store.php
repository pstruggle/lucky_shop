<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;


class Store extends Base
{
    private $_store;
    private $_types;
    protected function _initialize(){
        parent::_initialize();
        $this->_store = model('store');
        $this->_types = model('types');
    }
    /*
     * 店铺列表
     * */
    public function storelist(){
        $where = ['mid'=>$this->merchant['id']];
        if(input('store')){
            $where['store'] = ['like','%'.input('store').'%'];
        }
        if(input('id')){
            $where['id'] = input('id');
        }
        $oreder = ['weight'=>'desc','addtime'=>'desc'];
        $stores = $this->_store->getList($where,$oreder);
        $page = $stores->render();
        $this->assign([
            'title' => '店铺管理',
            'stores' => $stores,
            'page' => $page
        ]);
        return $this->template();
    }
    /*
     * 店铺信息修改
     * */
    public function storeedit(){
        $act = input('act');
        $sid = input('sid');
        if(!empty($act)){
            $errors = ['code'=>1];
            if(strcmp($act,'add') === 0){
                $result = $this->_store->storeAdd($this->merchant['id']);
                if($result['code'] == 0){
                    $this->error('添加失败');
                }
                $errors['info'] = '添加成功';
                $this->success($errors['info'],url('Store/storelist'));
            }elseif(strcmp($act,'update') === 0){
                $result = $this->_store->storeMod($sid);
                if($result['code'] == 0){
                    $this->error($result['info']);
                }
                $errors['info'] = '修改成功';
                $this->success($errors['info'],url('Store/storelist'));
            }else{
                $this->error('操作错误！');
            }
        }else{
            $act = 'add';
        }
        if(!empty($sid)){
            $act = 'update';
            $where = ['id'=>$sid];
            $store = $this->_store->where($where)->find();
            $this->assign([
                'store'=>$store,
            ]);
        }

        $this->assign([
            'title' => '店铺添加（修改）',
            'act'   => $act,
            'sid'   => $sid,
        ]);
        return $this->template();
    }
    /*
     * 店铺分类
     * */
    public function types($sid = -1,$fid = 0){
        $where = ['storeid' => $sid,'fid'=>$fid];
        $order = ['weight'=>'desc'];
        $types = $this->_types->getList($where,$order);
        $page = $types->render();
        $this->assign([
            'title' => '店铺分类',
            'types' => $types,
            'page'  => $page
        ]);
        return $this->template();
    }
    /*
     * 店铺的分来添加
     * */
    public function typesedit(){
        $act = input('act');
        $id  = input('id');
        if(!empty($act)){
            $errors = ['code'=>1];
            if(strcmp($act,'add') === 0){
                $result = $this->_types->typesAdd($this->merchant['id']);
                if($result['code'] == 0){
                    $this->error($result['info']);
                }
                $errors['info'] = '添加成功';
                $this->success($errors['info']);
            }elseif(strcmp($act,'update') === 0){
                $result = $this->_types->typesMod();
                if($result['code'] == 0){
                    $this->error($result['info']);
                }
                $errors['info'] = '修改成功';
                $this->success($errors['info']);
            }else{
                $this->error('操作错误！');
            }
        }else{
            $act = 'add';
        }
        if(!empty($id)){
            $act = 'update';
            $where = ['id'=>$id];
            $type = $this->_types->getList($where);
            $this->assign([
                'type'=>$type[0],
            ]);
        }
        $this->assign([
            'title' => '店铺分类添加（修改）',
            'act'   => $act,
            'id'   => $id,
        ]);
        return $this->template();
    }
    // 删除店铺
    public function store_del(){
        $id = input('id');
        $where = ['id'=>$id];
        $result = $this->_store->where($where)->delete();
        if($result){
            $this->success('删除成功');
        }else{
            $this->error('删除失败');
        }
    }
    /*
     * 地图控件加载
     * */
    public function map(){
        return $this->template();
    }
    
}