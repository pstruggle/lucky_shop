<?php

namespace app\index\controller;

use app\index\controller\Base;
use think\Cookie;
use think\Db;

class User extends Base
{
    private $_user;
    private $_integralog;
    protected function _initialize(){
        parent::_initialize();
        $this->_user = model('userinfo');
        $this->_integralog = model('integralog');
    }
    // 用户个人中心
    public function user(){
        $this->assign([
            'title' => '个人中心',
        ]);
        return $this->template();
    }
    //设置
    public function user_set(){
        $this->assign([
            'title' => '账户管理',
        ]);

        return $this->template();
    }
    //注册
    public function register(){

        $this->assign([
            'title' => '用户注册',
        ]);

        return $this->template();
    }
    //个人资料
    public function profile(){
        $this->assign([
            'title' => '个人资料',
        ]);
        return $this->template();
    }
    //积分获得记录
    public function integrals(){
        $where = ['i.uid' => $this->userinfos['id']];
        $integras = $this->_integralog->getLog($where);
        $this->assign([
            'title' => '积分列表',
            'integras' => $integras,
        ]);
        return $this->template();}
    // 登录
    public function login(){
        Cookie::clear();
        $this->assign([
            'title' => '用户登录',
        ]);
        return $this->template();
    }
    //业务员的申请
    public function apply(){
        $where = ['uid' => $this->userinfos['id']];
        $act = 'add';
        $apply = Db::name('apply')->where($where)->find();
        if(!empty($apply)){
            $act = 'update';
            switch($apply['status']){
                case '1':
                    return '<h1>您已经提交申请，耐心等待审核...</h1>';
                    break;
                case '2':
                    $this->assign('status',2);
                    break;
                case '3':
                    $text = '<h1>您的资质审核不通过。</h1>';
                    $this->assign('text',$text);
                    break;
            }
        }
        $this->assign([
            'title' => '申请成为业务员',
            'apply' => $apply,
            'act' => $act
        ]);
        return $this->template();
    }
    // 业务员申请提交
    public function applyedit(){
//        echo input_str(input());
        $act = input('act');
        $salesman = Cookie::get('salesman');
        $puid = '0';
        if(!empty($salesman)){
            $puid = encrypt($salesman,'D');
            $user = $this->_user->where('id',$puid)->find();
            if (empty($user) || $user['type'] != 1 || $user['clerk'] != 1){
                $puid = 0 ;
            }
        }
        $map = [
            'uid'=> $this->userinfos['id'],
            'name'=> input('name')?input('name'):'',
            'phone'=> input('phone')?input('phone'):'',
            'industry'=> input('industry')?input('industry'):'',
            'unit'=> input('unit')?input('unit'):'',
            'idcard'=> input('idcard')?input('idcard'):'',
            'positive'=> input('positive')?input('positive'):'',
            'negative'=> input('negative')?input('negative'):'',
            'puid' => $puid,
            'status' => '1',
        ];
        if($act == 'add'){
            $map['addtime'] = time();
            $result = Db::name('apply')->insert($map);
        }elseif($act == 'update'){
            $result = Db::name('apply')->where(['uid'=>$this->userinfos['id']])->update($map);
        }else{
            $result = 0;
        }

        if($result){
            $this->success('编辑成功,等待审核...');
        }else{
            $this->error('编辑失败');
        }

    }
    // 门店信息上传页面
    public function store_apply(){
        $where = ['uid' => $this->userinfos['id']];
        $act = 'add';
        $apply = Db::name('store_apply')->where($where)->find();
        if(!empty($apply)){
            $act = 'update';
            switch($apply['status']){
                case '1':
                    return $this->success('您已经提交申请，耐心等待审核...','User/user');
                    break;
                case '2':
                    $this->assign('status',2);
                    break;
                case '3':
                    $text = '<h1>您的资质审核不通过。</h1>';
                    $this->assign('text',$text);
                    break;
            }
        }
        $this->assign([
            'title' => '申请成为业务员',
            'apply' => $apply,
            'act' => $act
        ]);
        return $this->template();
    }
    //门店信息上传操作
    public function storeedit(){
        $act = input('act');
        $salesman = Cookie::get('salesman');
        $puid = '0';
        if(!empty($salesman)){
            $puid = encrypt($salesman,'D');
            $user = $this->_user->where('id',$puid)->find();
            if (empty($user) || $user['type'] != 1 || $user['clerk'] != 1){
                $puid = 0 ;
            }
        }
        $map = [
            'uid'=> $this->userinfos['id'],
            'name'=> input('name')?input('name'):'',
            'phone'=> input('phone')?input('phone'):'',
            'store'=> input('store')?input('store'):'',
            'province'=> input('province')?input('province'):'',
            'city'=> input('city')?input('city'):'',
            'county'=> input('county')?input('county'):'',
            'address'=> input('address')?input('address'):'',
            'licence'=> input('licence')?input('licence'):'',
            'business'=> input('business')?input('business'):'',
            'status' => '1',
        ];
        if($act == 'add'){
            $map['addtime'] = time();
            $result = Db::name('store_apply')->insert($map);
        }elseif($act == 'update'){
            $result = Db::name('store_apply')->where(['uid'=>$this->userinfos['id']])->update($map);
        }else{
            $result = 0;
        }
        if($result){
            $this->success('编辑成功,等待审核...');
        }else{
            $this->error('编辑失败');
        }
    }
    //找回密码
    public function find_pwd(){

        $this->assign([
            'title' => '找回密码',
        ]);

        return $this->template();
    }
    //修改用户信息展示
    public function change(){
        $param = input('param');
        if(empty($param)){
            $this->error('没有信息');
        }
        $infos = [];
        switch ($param){
            case 'name':
                $infos['value'] = $this->userinfos['nickname'];
                $infos['placeholder'] = '设置用户名';
                $infos['act'] = 'nickname';
                break;
            case 'tel':
                $infos['value'] = $this->userinfos['phone'];
                $infos['placeholder'] = '设置电话号码';
                $infos['act'] = 'tel';
                break;
        }
        $this->assign([
            'title' => '修改用户信息',
            'infos'=>$infos,
        ]);
        return $this->template();
    }
    //修改手机号码
    public function change_tel(){

        $this->assign([
            'title' => '',
        ]);

        return $this->template();
    }

    //修改用户昵称
    public function change_name(){

        $this->assign([
            'title' => '',
        ]);

        return $this->template();
    }
    //修改密码
    public function change_pwd(){

        $this->assign([
            'title' => '',
        ]);

        return $this->template();
    }
    //文章模块
    public function article(){

        $this->assign([
            'title' => '',
        ]);

        return $this->template();
    }
    // 业务员收入日志
    public function gets(){
        $get = model('get');
        $where = ['g.puid'=>$this->userinfos['id']];
        $gets = $get->getGets($where,[]);
        $this->assign([
            'title' => '业务员获得奖励',
            'gets' => $gets
        ]);
        return $this->template();
    }

    //验证登录
    public function chacklogin(){
        $code = input('CheckCode');
        $checkcode = json_decode($this->checkcode($code),true);
        if($checkcode['code'] == 0){
            $this->error($checkcode['info']);
        }
        $map = [];
        $map['phone'] = input('phone');
        $map['passwd']  = input('passwd');
        $result = $this->_user->checkUser($map);
        if($result['code'] == 0){
            $this->error($result['info']);
        }

        $url = input('url')?input('url'):'Index/index';
        return redirect($url);
    }
    // 验证码验证
    public function checkcode($code){
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
    // 修改用户信息
    public function info_mod(){
        $act = input('act');
        $mod_val = input('mod_val');
        $where = ['id' => $this->userinfos['id']];
        switch ($act){
            case 'nickname':
                $map['nickname'] = $mod_val;
                break;
            case 'tel':
                $map['phone'] = $mod_val;
                $infos = $this->_user->getUserinfo($map);
                if(!empty($infos)){
                    $this->error('手机号码已经注册...');
                }
                break;
        }
        if($this->_user->save($map,$where)){
            return redirect('user/profile');
        }
        return $this->error('修改失败...');
    }
    // 修改用户信息
    public function mod_info(){
        $nickname = input('nickname');
        $tel = input('phone');
        $where = ['id' => $this->userinfos['id']];
        $map = [];
        if(!empty($nickname)){
            $map['nickname'] = $nickname;
        }
        if(!empty($tel)){
            $map['phone'] = $tel;
        }
        if($this->_user->save($map,$where)){
            if(!empty($tel)){
                Cookie::set('phone',$tel);
            }
            return redirect('user/profile');
        }
        return $this->error('修改失败...');
    }
    //密码修改
    public function passwd(){
        //user_set
        $oldpasswd = input('oldpasswd');
        $passwd1 = input('passwd1');
        $passwd2 = input('passwd2');
        $oldpasswd = md5($oldpasswd);
        if($oldpasswd != $this->userinfos['passwd']){
            $this->error('输入的密码错误！');
        }
        if($passwd1 != $passwd2){
            $this->error('输入的两次密码不一致！');
        }
        $where = ['id'=>$this->userinfos['id']];
        $map = ['passwd'=>md5($passwd1)];
        if($this->_user->save($map,$where)){
            return redirect('user/user_set');
        }
        return $this->error('修改失败...');
    }
    // 注册用户
    public function add_user(){
        $map = [];
        $map['phone']   = input('tel');
        $map['passwd']  = input('passwd1');
        $map['province'] = input('province');
        $map['city']    = input('city');
        $map['country']  = input('county');
        $map['nickname']  = input('nickname');
        $map['sex']  = 1;
        $map['headimg']  = '/static/index/images/icon/DefaultAvatar.jpg';
        $map['addtime']  = time();
        if($this->_user->where('phone',$map['phone'])->value('id')){
            return $this->error('手机号码已经注册...');
        }
        $passwd = input('passwd2');
        if(strcmp($passwd,$map['passwd']) != 0){
            $this->error('两次密码不一致');
        }
        $map['passwd'] = md5($map['passwd']);
        if($this->_user->save($map)){
            Cookie::set('id',$this->_user->id);
            Cookie::set('passwd',$map['passwd']);
            Cookie::set('phone',$map['phone']);
            Cookie::set('check','user');
            return redirect('user/user');
        }
        return $this->error('注册失败...');
    }
}