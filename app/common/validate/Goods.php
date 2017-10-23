<?php
namespace app\common\validate;

use think\Validate;

class Goods extends Validate
{
    protected $rule = [
        'tradename' => 'require',
        'tradecode' => 'require|alphaDash',
        'unit'      => 'require',
        'types'     => 'require',
        'oriprice'  => 'require',
        'ingprice'  => 'require',
        'status'    => 'require',
    ];
    protected $msg = [
        'tradename.require'   => '商品名称必须',
        'tradecode.require'   => '商品编码必须',
        'tradecode.alphaDash' => '商品编码必须由字母，数字，下划线组成',
        'unit.require'        => '单位必须填写',
        'types.require'       => '类型必须选择',
        'status.require'      => '状态必须选择',
        'oriprice.require'    => '原价必须填写',
        'ingprice.require'    => '现价必须填写',
    ];
    protected $scene = [
        'mod' => ['passwd','name','phone','email','province','city','county']
    ];
}