<?php
namespace app\merchant\controller;
use think\Controller;
use think\Db;
use think\Session;
use think\Validate;
use think\Cookie;
class Restrict extends Controller
{
    private $_merchant;
    private $theme;
    protected function _initialize(){
        parent::_initialize();
        $this->theme = 'helsinki';
        $this->_merchant = model('merchant');
    }
    private function template(){
        return $this->view->config('view_path',__DIR__.'/../view/'.$this->theme.'/')->fetch();
    }
    /*
     * 登录页面
     * */
    public function login($url = ''){
        $act = input('act');
        if($act == 'sign_out'){
            Cookie::clear();
        }

        $this->assign('url',$url);
        return $this->template();
    }
    // 合作方注册
    public function register(){

        return $this->template();
    }
    // 招商
    public function solicit(){

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
        $result = $this->_merchant->checkMerchant($map);
        if($result['code'] == 0){
            $this->error($result['info']);
        }
        $url = input('url')?input('url'):'Index/index';
        return redirect($url);
    }
    /*
     * 验证码验证
     * */
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
    //发送验证码
    public function send_sms(){
        $phone = input('phone');
        $where = ['phone'=>$phone];
        $error = ['code'=>0,'info'=>'发送成功'];
        $result = Db::name('merchant')->where($where)->value('id');
        if(!empty($result)){
            $error['code']= 1;
            $error['info']= '手机号码已经注册';
            return json_encode($error);
        }
        $aliyun = controller('api/Aliyun');
        $code = mt_rand(100000,999999);
        Session::set('smsCode',$code);
        Session::set('smsExpire',time()+600);
        $data = [];
        $data['recNum'] = $phone;
        $data['param'] = [$code,'小惠猫商家'];
        $data['temp'] = 'sms_mch_register';
        $result = $aliyun->ajax_send($data);
        if($result->Code == 'OK'){
            return json_encode($error);
        }else{
            $error['code'] = 1;
            $error['info'] = '发送失败';
            return json_encode($error);
        }
    }
    // 验证注册
    public function chackregister(){
        $code = input('CheckCode');
        $checkcode = json_decode($this->checkcode($code),true);
        if($checkcode['code'] == 0){
            $this->error($checkcode['info']);
        }
        $phone_code = input('phone_code');
        $expire = Session::get('smsExpire');
        $smsCode = Session::get('smsCode');
        if($expire < time()){
            $this->error('验证码过期');
        }
        if($smsCode != $phone_code){
            $this->error('验证码输入错误');
        }
        $passwd1 = input('password');
        $passwd2 = input('passwd');
        if($passwd1 != $passwd2){
            $this->error('两次密码不一致');
        }
        $map = [
            'account'=> input('username')?input('username'):'',
            'phone'=> input('phone')?input('phone'):'',
            'passwd' => $passwd1,
            'logo' => '/static/admin/img/logo.jpg',
            'name'=> input('name')?input('name'):'',
            'status'=>'0',
            'addtime'=>time(),
        ];
        $result = $this->_merchant->merchantAdd($map);
        if($result['code'] == 1){
            cookie('account',$map['account']);
            cookie('passwd',md5($map['passwd']));
            cookie('check','merchant');
            $this->success('注册成功',url('Index/index'));
        }else{
            $this->error($result['info']);
        }
    }

}