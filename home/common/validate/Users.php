<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017\9\22 0022
 * Time: 7:10
 */

namespace app\common\validate;


use think\Validate;

class Users extends Validate
{
    protected $rule = [
        'email' => 'require|email',
        'passwd' => 'require|min:6',
    ];
    protected $msg = [
        'email.require'   => '邮箱必须填写',
        'email.email'   => '邮箱格式不正确',
        'passwd.require' => '密码一定要输入',
        'passwd.min' => '密码长度要大于6'
    ];
    protected $scene = [
        'mail' => ['email','passwd']
    ];
}