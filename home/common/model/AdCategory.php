<?php
namespace app\common\model;

use app\common\model\Base;

class AdCategory extends Base{

    private $_adCategory;
    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_adCategory = $this;
        $this->_base = $this;
    }

}