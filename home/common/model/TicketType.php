<?php
namespace app\common\model;

use app\common\model\Basely;
use think\Cookie;
use think\Db;

class TicketType extends Basely
{
    private $_ticketType;

    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_ticketType = $this;
        $this->_base = $this;
    }
    // 门票类型
}