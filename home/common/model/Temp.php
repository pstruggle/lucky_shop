<?php
namespace app\common\model;

use think\Model;

class Temp extends Model
{
    private $_temp;
    protected function initialize()
    {
        parent::initialize();
        $this->_temp = $this;
    }

    public function getTempList(){
        $temps = $this->_temp->select();

        return $temps;
    }
}