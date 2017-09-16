<?php
namespace app\common\validate;

use think\Validate;

class Specs extends Validate
{
    protected $rule = [
        'specs' => 'require',
    ];
    protected $msg = [
        'specs.require'   => '规格名称必须填写',
    ];
}