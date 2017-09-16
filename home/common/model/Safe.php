<?php
namespace app\common\model;

use app\common\model\Basely;

class Safe extends Basely
{
    private $_safe;
    protected function initialize(){
        parent::initialize();
        $this->_safe = $this;
        $this->_base = $this;
    }
//获取目的地
    public function getSafes($where=[],$order = []){
        $join = [
            [['ww_merchant'=> 'm'] , 's.mid = m.id'],
        ];
        $field = ['s.*','m.name','m.phone'];
        $safes = $this->_safe
            ->alias('s')
            ->join($join)
            ->field($field)
            ->where($where)->order($order)->paginate();
        return $safes;
    }
}