<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/1/28 0028
 * Time: 18:41
 */

namespace app\common\validate;


use think\Validate;

class Action extends Validate
{
    protected $rule = [
        'controller' => 'require',
        'model' => 'require',
        'action' => 'require',
        'title' => 'require',
    ];
    protected $message = [
        'controller.require'   => '控制器必须填写',
        'model.require' => '模块必须填写',
        'action.require' => '功能方法必须填写',
        'title.require' => '功能名称必须填写',
    ];
}