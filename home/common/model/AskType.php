<?php
namespace app\common\model ;

use app\common\model\Base;

class AskType extends Base
{
    private $_ask_type ;
    protected function initialize()
    {
        parent::initialize();
        $this->_ask_type = $this;
        $this->_base = $this;
    }

    //
}