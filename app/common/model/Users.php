<?php
namespace app\common\model;

use app\common\model\Base;
use think\Db;
use think\Exception;
use think\Request;

class Users extends Base
{
    private $_user ;
    private $infos = [
        'nickname' => '该用户名存在',
        'phone' => '该手机号码已经注册',
        'email' => '该邮箱已经注册',
    ];
    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_user = $this;
        $this->_base = $this;
    }
    /**
     * 验证用户登录情况
     * @param string $cookie_id 记录的id值
     * @param string $cookie_secret 记录的密码值
     * @return mixed 用户存在就返回用户信息，不存在返回false
     */
    public function check_login($cookie_id,$cookie_secret){
        if(empty($cookie_id) || empty($cookie_secret)){
            return false;
        }
        // unread 不可访问
        // read 可访问
        $key = get_cache('config.basic')['encrypt_key'];
        $id = authcode($cookie_id,$key,'D');
        $passwd = authcode($cookie_secret,$key,'D');
        $user = $this->where('id',$id)->find();
        if(empty($user) || strcmp($passwd,$user['passwd']) !== 0){
            $this->error = 'unlogin';
            return false;
        }
        return $user;
    }
    /**
     *
     */

    /**
     * 用户登录操作
     */
    public function sign($data){
        if(!captcha_check($data['check_code'])){
            $this->error = '图形验证码不正确';
            return false;
        }
        if(empty($data['account'])){
            $this->error = '账号不能为空';
            return false;
        }
        $where = [];
        if(preg_match('/^[a-zA-Z0-9.!#$%&\'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/',$data['account'])){
            $where = ['email'=>$data['account']];
        }elseif(preg_match('/^1[0-9]{10}$/',$data['account'])){
            $where = ['phone'=>$data['account']];
        }else{
            $where = ['nickname'=>$data['account']];
        }
        $user = $this->where($where)->find();
        if(empty($user)){
            $this->error = '用户不存在';
            return false;
        }
        $passwd = md5($data['passwd']);
        if(strcmp($passwd,$user['passwd']) !== 0){
            $this->error = '密码不正确';
            return false;
        }
        return $user;
    }

    /**
     * 用户注册操作
     * @param mixed $data 用户提交注册数据
     * @return boolean
     */
    public function register($data){
        if(!captcha_check($data['check_code'])){
            $this->error = '图形验证码不正确';
            return false;
        }
        if($data['reg_type'] == 'phone'){
            if(!sendsms_check($data['sms_code'])){
                $this->error = '短信验证码不正确';
                return false;
            }
        }
        try{
            $user = $this->where($data['reg_type'],$data[$data['reg_type']])->find();
        }catch (Exception $e){
            $this->error = '请求出错';
            return false;
        }
        if(!empty($user)){
            $this->error = $this->infos[$data['reg_type']];
            return false;
        }
        if(strcmp($data['passwd'],$data['passwd_verify']) !== 0){
            $this->error = '您输入的密码不一致';
            return false;
        }
        $map=[
            $data['reg_type'] => $data[ $data['reg_type'] ],
            'passwd' => $data['passwd'],
            'regip' => $data['regip'],
            'regdate' => time(),
            'status' => 1, // 状态为正常状态
        ];
        $save = $this->validate('Users.'.$data['reg_type'])->save($map);
        if($save === false){
            $this->error = $this->getError();
            return false;
        }
        if($data['reg_type'] == 'email'){
            $result = $this->body($data['email'],$data['passwd'],$data['domain']);
            if($result['errorCode']){
                $this->error = '邮箱注册成功,赶紧去邮箱验证吧...';
                return true;
            }else{
                $this->error = '服务器繁忙，邮件发送失败，请稍后再试...';
                return false;

            }
        }
        return true;

    }
    // 邮箱注册时发送邮件
    private function body($email,$passwd,$domain){
        $mall_name = get_cache('config.mall')['mall_name'];

        $key = get_cache('config.basic')['encrypt_key'];
        $passwd_en = md5($passwd);
        $code = $email . '!_!' . $passwd_en;
        $checkcode = authcode($code,$key,'E',48*60*60);
        $url = $domain . url('restrict/Index/mailprove') . '?checkcode='.urlencode($checkcode);
        $body = "<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为{$mall_name}。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"{$url}\" target=\"_blank\">{$url}</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"{$domain}\"> {$domain}</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; {$mall_name}项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">{$mall_name}</span></span><br><span class=\"genEmailTail\"></span></div>";
        $result = send_mail($email,$email,$mall_name.'-注册认证',$body);
        return $result;
    }
    /**
     * 自动加密密码
     */
    public function setPasswdAttr($value){
        return md5($value);
    }
}