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
        'phone' => 'require|checkPhone:/^1[2-9]\d{9}$/',
        'nickname' => 'require|checkNickname:/^[0-9]+$//^[a-zA-Z0-9_\u4e00-\u9fa5]+$/',
    ];
    protected $message = [
        'email.require'   => '邮箱必须填写',
        'email.email'   => '邮箱格式不正确',
        'passwd.require' => '密码一定要输入',
        'passwd.min' => '密码长度要大于6',
        'phone.require' => '手机号码必须填写',
        'phone.checkPhone' => '手机号码格式不正确',
        'nickname.require' => '用户名必须填写',
        'nickname.checkNickname' => '用户名仅支持中英文、数字和下划线,且不能为纯数字',
        'nickname.checkChar' => '用户名仅支持中英文、数字和下划线,且不能为纯数字',
    ];
    protected $scene = [
        'email' => ['email','passwd'],
        'phone' => ['phone','passwd'],
        'nickname' => ['nickname','passwd'],
    ];
    // 验证手机号码格式
    protected function checkPhone($value,$rule,$data){
        return preg_match($rule,$value)?true:'手机号码格式不正确';
    }
    // 验证昵称格式
    protected function checkNickname($value,$rule,$data){
        $rules = explode('//',$rule);
        $status = true;
        if(!preg_match($rules[0].'/',$value)){
            if(preg_match('/'.$rule[1],$value)){
                $status = false;
            }
        }
        return $status?true:'用户名仅支持中英文、数字和下划线,且不能为纯数字';
    }

}