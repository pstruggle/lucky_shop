<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/28
 * Time: 10:03
 */

namespace app\api\controller;


use think\Controller;

class Index extends Controller
{
    // 地区接口
    public function area(){
        return json(get_cache('area'));
    }
}