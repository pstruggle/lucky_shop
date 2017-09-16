<?php
namespace app\admin\controller;
use think\Cookie;
use app\common\controller\Base;

class Restrict extends Base
{
    protected function _initialize(){
        parent::_initialize();
    }
    /*
     * 登录页面
     * */
    public function login($url = ''){
        $this->assign('url',$url);
        return $this->template();
    }

    /*
     * 验证登录
     * */
    public function chacklogin(){
        $code = input('CheckCode');
        $checkcode = json_decode($this->checkcode($code),true);
        if($checkcode['code'] == 0){
            $this->error($checkcode['info']);
        }
        $map = [];
        $map['account'] = input('UserName');
        $map['passwd']  = input('password');
        $result = $this->_admin->checkAdmin($map);
        if($result['code'] == 0){
            $this->error($result['info']);
        }
        $url = input('url')?input('url'):url('Index/index');
        return redirect($url);
    }
    /*
     * 验证码验证
     * */
    public function checkcode($code=''){
        $data = [];
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
    //退出登录
    public function log_out(){
        Cookie::clear();
        return redirect(url('Restrict/login'));
    }
}