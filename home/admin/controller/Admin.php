<?php
namespace app\admin\controller;

use app\admin\controller\Base;
class Admin extends Base
{
    private $_Admin;
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->_Admin = model('admin');
    }
}