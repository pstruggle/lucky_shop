<?php
namespace app\common\model;

use app\common\model\Base;

class Specs extends Base
{
    private $_specs ;

    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_specs = $this;
        $this->_base = $this;
    }
    /*
     * 多条添加规格
     *
     * */
    public function specsAll($list){
        $specs = $this->_specs->saveAll($list);
        return $this->_specs->id;
    }
    /*
     * 单挑规格添加
     * */
    public function specsAdd($map){
        $this->_specs->save($map);
        return $this->_specs->id;
    }
    /*
     * 根据商品获取所有规格
     * */
    public function getSpecsAll($where=['"*"'=>'*']){
        return $this->_specs->where($where)->select();
    }
    /*
     * 规格化获取规格
     * */
    public function callSpecs($where=['"*"'=>'*']){
        $specs = $this->_specs->getSpecsAll($where);

        $specss = $this->callbackSpec($specs,0,2);
        return $specss;
    }
    /*
     * 回调获得导航列表
     * */
    private function callbackSpec($navs,$pid,$layer = 2){
        $rnav = array();
        if($layer < 1) return null;
        --$layer;
        foreach ($navs as $nav){
            if($nav['pid'] == $pid){
                $rnav[$nav['id']] = $nav;
                $rnav[$nav['id']]['specs'] = $this->callbackNav($navs,$nav['id'],$layer);
            }
        }
        return $rnav;
    }

}