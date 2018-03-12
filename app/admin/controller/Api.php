<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/2/27 0027
 * Time: 12:03
 */

namespace app\admin\controller;


class Api extends Base
{
    public function menus(){
        $menus = get_cache('action.menus_'.$this->user['role_id']);
        $this->success('请求成功',null,$menus);
    }
}