<?php
namespace app\common\validate;

use think\Validate;

class Attrs extends Validate
{
    protected $rule = [
        'attr' => 'require',
    ];
    protected $msg = [
        'attr.require'   => '属性名称必须填写',
    ];
}