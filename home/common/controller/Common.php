<?php
namespace app\common\controller;

use think\Controller;
use think\Cookie;
use think\Db;


class Common extends Controller
{
    protected $theme; // 主题控制
    protected $module; //当前请求模块
    protected $controller; //当前请求控制器
    protected $action; //当前请求方法
    protected $user; //当前请求方法
    protected function _initialize(){
        parent::_initialize();  // TODO: Change the autogenerated stub
        $this->theme = 'appui';
        $this->module = $this->request->module(); // 获取模块
        $this->controller = $this->request->controller(); // 获取控制器
        $this->action = $this->request->action(); // 获取方法
        $this->gain_user();
    }
    /**
     * 判断用户是否登录
     */
    protected function check_login(){
        if(empty($this->user)){
            return $this->error('请先登录...');
        }
        if(empty($this->user['nickname']) &&
            empty($this->user['phone']) &&
            !empty($this->user['email']) &&
            $this->user['mail_verify'] != 1){
            return '';
        }

//        $_auth = model('auth');
//        $_auth->setUser($this->user);
//        if(!$_auth->check($this->action())){
//            $url = '';
//            if(empty($this->user)){
//                $url = url('restrict/index/index');
//            }
//            return $this->error($_auth->getError(),$url);
//        }
    }
    protected function gain_user(){
        $cookie_id = Cookie::get('token');
        $cookie_secret = Cookie::get('secret');
        $key = get_cache('config.basic')['encrypt_key'];
        $id = authcode($cookie_id,$key,'D');
        $passwd = authcode($cookie_secret,$key,'D');
        $user = $this->user = Db::name('users')->where('id',$id)->find();
        if(empty($user) || strcmp($passwd,$user['passwd']) !== 0){
            return false;
        }
        $this->assign('user',$user);
        return true;
    }
    /**
     * 权限标识
     */
    protected function action(){
        return $this->module.'_'.strtolower($this->controller).'_'.$this->action;
    }
    /**
     * 用户信息储存
     * @return  null
     */
    protected function record_user(){
        $key = get_cache('config.basic')['encrypt_key'];
        if(!$this->user){
            return false;
        }
        $id = authcode($this->user['id'],$key);
        $secret = authcode($this->user['passwd'],$key);
        Cookie::set('token',$id);
        Cookie::set('secret',$secret);
    }

    /**
     * 设置用户信息
     */
    public function setUser($user){
        $this->user = $user;
    }
    /**
     * 渲染输出
     * @param string $fetch 显示模板
     */
    protected function template($fetch = ''){

        $temp = '';
        if($this->theme != ''){
            $temp .= $this->theme .'/';
        }
        if(!empty($this->module)){
            $temp .= $this->module .'/';
        }
        return $this->view->config('view_path',__DIR__.'/../view/'.$temp)->fetch($fetch);
    }
    /**
     * 获取跳转到当前页的地址
     */
    protected function last_url(){
        return $_SERVER["HTTP_REFERER"] ?:url('index/Index/index');
    }
    /**
     * 跳转到上一页
     */
    protected function last_redirect(){
        return $this->redirect($this->last_url());
    }



}