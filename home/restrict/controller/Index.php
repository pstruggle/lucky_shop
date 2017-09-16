<?php
namespace app\restrict\controller;

use app\common\controller\Base;

class Index extends Base {
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }
    /**
     * 用户登录模板
     */
    public function index(){
        $url = input('url');
        $this->assign([
            'url' => $url,
            'title' => '登录'
            ]);
        return $this->template();
    }
    /**
     * 用户注册模板
     */
    public function register(){
        $this->assign('title','注册新用户');
        return $this->template();
    }
    /**
     * 验证码验证
     * @return string
     **/
    public function checkcode(){
        $data = [];
        $code = input('code') ?: '';
        $error = ['code'=>0];
        $data['captcha'] = $code;
        $result = $this->validate($data,[
            'captcha|验证码'=>'require|captcha'
        ]);
        if($result !== true){
            $error['info'] = $result;
        }else{
            $error['code'] = $result;
        }
        return json_encode($error,JSON_UNESCAPED_UNICODE);
    }
    /**
     * 验证手机验证码
     */

}