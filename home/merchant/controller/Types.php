<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;


class Types extends Base
{
    private $_types;
    private $_malltypes;
    protected function _initialize(){
        parent::_initialize();
        $this->_types = model('types');
        $this->_malltypes = model('malltypes');
    }
    /*
     * 异步根据门店获取分类
     * */
    public function ajax_store_types($store = 0, $fid = -1){
        $where = ['storeid'=>$store,'fid'=>$fid];
        $stores = $this->_types->getJsonType($where);
        return $stores;
    }
    /*
     * 异步获取商城子分类
     * */
    public function ajax_mall_types($fid = -1){
        $where = ['fid'=>$fid];
        $stores = $this->_malltypes->getJsonType($where);
        return $stores;
    }
}