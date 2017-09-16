<?php
namespace app\common\model;

use app\common\model\Base;

class ConfigKey extends Base
{
    private $_configKey;

    protected function initialize(){
        parent::initialize();
        $this->_configKey = $this;
        $this->_base = $this;
    }
}