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
        'title' => 'require',
    ];
    protected $message = [
        'title.require' => '功能名称必须填写',
    ];
}