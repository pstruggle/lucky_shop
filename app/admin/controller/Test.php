<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/5/22 0022
 * Time: 10:55
 */

namespace app\admin\controller;


class Test extends Base
{
    public function index(){
        dump(defaultUrl());
        return $this->template();
    }
}