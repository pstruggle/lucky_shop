<?php
namespace app\restrict\controller;

use app\common\controller\Common;
use think\Cache;
use think\Db;
use think\Exception;
use think\Session;

class Index extends Common {
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
    }
    /**
     * 用户登录模板
     */
    public function index(){
        $url = $this->last_url();
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
     * 图形验证码验证
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
     * 创建用户
     */
    public function create(){
        if(!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $data = input('post.');
        $_users = model('users');
        $data['regip'] = $this->request->ip();
        $data['domain'] = $this->request->domain();
        $result = $_users->register($data);
        if($result){
            $user = Db::name('users')->where($data['reg_type'],$data[$data["reg_type"]])->find();
            $this->user = $user;
            $this->record_user();
            $this->success($_users->getError(),
                url('index/Index/index'));
        }
        $this->error($_users->getError());
    }
    /**
     * 邮箱验证
     */
    public function mailprove(){
        $checkcode= input('get.checkcode');
        $key = get_cache('config.basic')['encrypt_key'];
        $decode = authcode($checkcode,$key,'D');
        if (!$decode){
            $this->error('验证错误');
        }
        $result = explode('!_!',$decode);
        $user = Db::name('users')->where('email',$result[0])->find();
        if(empty($user)){
            $this->error('该邮箱未注册',
                url('restrict/Index/register'));
        }
        if(strcmp($user['passwd'],$result[1]) === 0){
            $up = Db::name('users')
                ->where('id',$user['id'])
                ->update(['mail_verify'=>1]);
            if(!$up){
                $this->error('系统出错');
            }
            $this->record_user($user);
            $this->success('验证成功',
                url('index/Index/index'));
        }else{
            $this->error('验证失败,请登录后重新发送验证！',
                url('restrict/Index/register'));
        }
    }
    /**
     * 用户登录
     */
    public function sign(){
        if(!$this->request->isPost()){
            $this->error('请求出错');
        }
        $data = input('post.');
        $_users = model('users');
        $result = $_users->sign($data);
        if($result === false){
            $this->error($_users->getError());
        }
        $url = $data['url']?:url('index/index/index');
        $this->user = $result;
        $this->record_user();
        $this->success('登录成功',$url);

    }
    /**
     * 测试功能
     */
    public function test(){
//        Cache::clear();
        $areas = get_cache('area');
        $prov = array_column($areas,0);
        $prov_key = array_keys($areas);
        $prove = array_combine($prov_key,$prov);
        $city = array_values(array_column($areas,1));
        $city_key = array_keys($city);
        dump($city);
        dump($city_key);

        dump($prov_key);
        dump($prov);
        dump($prove);
    }
}