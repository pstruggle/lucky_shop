<?php
namespace app\common\model;

use app\common\model\Basely;

class Contract extends Basely
{
    private $_contract;
    protected function initialize(){
        parent::initialize();
        $this->_contract = $this;
        $this->_base = $this;
    }
//获取目的地
    public function getContracts($where=[],$order = []){
        $join = [
            [['ww_merchant'=> 'm'] , 'c.mid = m.id'],
        ];
        $field = ['c.*','m.name','m.phone'];
        $safes = $this->_contract
            ->alias('c')
            ->join($join)
            ->field($field)
            ->where($where)->order($order)->paginate();
        return $safes;
    }
}