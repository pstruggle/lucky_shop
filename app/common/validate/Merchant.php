<?php
namespace app\common\validate;

use think\Validate;

class Merchant extends Validate
{
    protected $rule = [
        'account'   => 'require|unique:merchant|max:25|min:6|alphaDash',
        'passwd'    => 'max:25|min:8|alphaDash',
        'name'      => 'require',
        'phone'     => 'require',
        'email'     => 'email',
    ];
    protected $msg = [
        'account.require'   => '账号必须',
        'account.unique'    => '账号已经注册',
        'account.max'       => '账号长不超过25',
        'account.min'       => '账号长必须大于6',
        'account.alphaDash' => '账号必须由字母，数字，下划线组成',
        'passwd.max'        => '密码长不超过25',
        'passwd.min'        => '密码长不小于6',
        'passwd.alphaDash'  => '密码必须由字母，数字，下划线组成',
        'name.require'      => '公司名称必须填写',
        'phone.require'     => '手机号码必须填写',
    ];
    protected $scene = [
        'mod' => ['passwd','name','phone','email','province','city','county']
    ];
}