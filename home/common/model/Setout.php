<?php
namespace app\common\model;

use app\common\model\Basely;

class Setout extends Basely
{
    private $_setout;
    protected function initialize(){
        parent::initialize();
        $this->_setout = $this;
        $this->_base = $this;
    }
    //获取目的地
    public function getSetout($where=[],$order = []){
        $join = [
            [['ww_merchant'=> 'm'] , 's.mid = m.id'],
        ];
        $field = ['s.*','m.name','m.phone'];
        $setouts = $this->_setout
            ->alias('s')
            ->join($join)
            ->field($field)
            ->where($where)->order($order)->select();
        return $setouts;
    }
}