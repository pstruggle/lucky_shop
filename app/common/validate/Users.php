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
        'email' => 'require|email|unique:users,email',
        'passwd' => 'require|min:6',
        'phone' => 'require|checkPhone:/^1[2-9]\d{9}$/|unique:users,phone',
        'nickname' => 'require|checkNickname:/^[0-9]+$//^[a-zA-Z0-9_\u4e00-\u9fa5]+$/|unique:users,nickname',
    ];
    protected $message = [
        'email.require'   => '邮箱必须填写',
        'email.email'   => '邮箱格式不正确',
        'email.unique'   => '该邮箱已存在',
        'passwd.require' => '密码一定要输入',
        'passwd.min' => '密码长度要大于6',
        'phone.require' => '手机号码必须填写',
        'phone.checkPhone' => '手机号码格式不正确',
        'phone.unique'   => '该号码已存在',
        'nickname.require' => '账号必须填写',
        'nickname.checkNickname' => '账号仅支持中英文、数字和下划线,且不能为纯数字',
        'nickname.checkChar' => '账号仅支持中英文、数字和下划线,且不能为纯数字',
        'nickname.unique'   => '该昵称已存在',
    ];
    protected $scene = [
        'email' => ['email','passwd'],
        'phone' => ['phone','passwd'],
        'nickname' => ['nickname','passwd'],
        'admin' => ['nickname','email','phone'],
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