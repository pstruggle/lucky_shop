<?php
namespace app\common\model;

use app\common\model\Base;
use think\Db;
use think\Request;

class Users extends Base
{
    private $_user ;
    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_user = $this;
        $this->_base = $this;
    }
    /**
     * 用户注册
     */
    public function register($data){
        $error = ['code'=>0,'info'=>'注册成功'];
        if(!captcha_check($data['check_code'])){
            $error['code'] = 1;
            $error['info'] = '验证码不正确';
            return $error;
        }
        $data['regdate'] = time();

        switch ($data['reg_type']){
            case 'email': // 邮箱注册
                $result = $this->email($data);

                break;
            case 'phone': // 手机号码注册
                break;
            case 'nickname': // 昵称注册
                break;
            default:
                break;
        }
        return $result;
    }

    /**
     * 邮箱注册
     */
    private function email($data){
        $error = ['code'=>1];
        $user = $this->where('email',$data['email'])->find();
        if(!empty($user)){
            $error['info'] = '该邮箱已经注册';
            return $error;
        }
        if(strcmp($data['passwd'],$data['passwd_verify']) !== 0){
            $error['info'] = '您输入的密码不一致';
            return $error;
        }
        $map=[
            'email' => $data['email'],
            'passwd' => $data['passwd'],
            'regip' => $data['regip'],
            'regdate' => $data['regdate'],
            'status' => 1, // 状态为正常状态
        ];
        $save = $this->validate('Users.mail')->save($map);
        if($save === false){
            $error['info'] = $this->getError();
            return $error;
        }
        $result = $this->body($data['email'],$data['passwd'],$data['domain']);
        if($result['errorCode']){
            $error['code'] = 0;
            $error['info']='邮箱注册成功,赶紧去邮箱验证吧...';
            return $error;
        }else{
            $error['info'] = '服务器繁忙，邮件发送失败，请稍后再试...';
            return $error;

        }
    }
    // 邮件内容字符串
    private function body($email,$passwd,$domain){
        $mall_name = get_cache('config.mall')['mall_name'];

        $key = get_cache('config.basic')['encrypt_key'];
        $code = $email . '!_!' . authcode($passwd,$key,'E');
        $checkcode = authcode($code,$key,'E',48*60*60);
        $url = $domain . url('restrict/Index/mailprove') . '?checkcode='.urlencode($checkcode);
        $body = "<div><span class=\"genEmailNicker\"></span><br><span class=\"genEmailContent\"><br>尊敬的用户 ：<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 您好！恭喜您注册成为{$mall_name}。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 这是一封注册认证邮件，请点击以下链接确认：<br>&nbsp;&nbsp; &nbsp; &nbsp; <a href=\"{$url}\" target=\"_blank\">{$url}</a> <br><br>&nbsp;&nbsp; &nbsp; &nbsp; 如果链接不能点击，请复制地址到浏览器，然后直接打开。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 上述链接48小时内有效。如果激活链接失效，请您登录网站<a target=\"_blank\" href=\"{$domain}\"> {$domain}</a>重新申请认证。<br><br>&nbsp;&nbsp; &nbsp; &nbsp; 感谢您注册%s！<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; {$mall_name}项目组<br><br>&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp; &nbsp; <span style=\"border-bottom:1px dashed #ccc;\" t=\"5\" times=\"\">{$mall_name}</span></span><br><span class=\"genEmailTail\"></span></div>";
        $result = send_mail($email,$email,'幸运商城-注册认证',$body);

        return $result;
    }
    /**
     * 自动加密密码
     */
    public function setPasswdAttr($value){
        return md5($value);
    }
    /*
     * 检验用户是否注册微信注册  根据openID
     * */
    public function getUserinfo($where){
        return $this->_user->where($where)->find();
    }
    /*
     * 微信注册用户
     * */
    public function addUser($map){
        return $this->_user->insert($map);
    }
    // 用户登录验证
    public function checkUser($map){
        $error = ['code'=>1];
        $where = ['phone'=>$map['phone']];
        $exis = $this->getUserinfo($where);
        if($exis === false){
            $error['code'] = 0;
            $error['info'] = '用户不存在';
            return $error;
        }
        $where['passwd'] = md5($map['passwd']);
        if (strcmp($exis['passwd'],$where['passwd']) !== 0){
            $error['code'] = 0;
            $error['info'] = '账号与密码不匹配！';
            return $error;
        }
        cookie('phone',$where['phone']);
        cookie('passwd',$where['passwd']);
        cookie('check','user');
        return $error;
    }
    // 申请业务员列表
    public function applys($where = [],$order = [],$page = 20){
        $join = [
            ['apply a','a.uid = u.id']
        ];
        $field = ['u.*','a.status','a.phone','a.name'];
        return $this->_user
            ->alias('u')
            ->join($join)
            ->field($field)
            ->where($where)
            ->order($order)
            ->paginate($page);
    }
    public function stores($where = [],$order = [],$page = 20){
        $join = [
            ['store_apply s','s.uid = u.id']
        ];
        $field = ['u.*','s.status','s.phone','s.name'];
        return $this->_user
            ->alias('u')
            ->join($join)
            ->field($field)
            ->where($where)
            ->order($order)
            ->paginate($page);
    }
    public function getSexs(){
        $sexs = [];
        $where = ['sex' => 1];
        $sexs[] = $this->_user->where($where)->count();
        $where = ['sex' => 2];
        $sexs[] = $this->_user->where($where)->count();
        $where = ['sex' => ['notin','1,2']];
        $sexs[] = $this->_user->where($where)->count();
        return $sexs;
    }
    //业务员申请待处理数
    public function user_num($where=[]){
        $where = array_merge($where,['status'=>'1']);
        return Db::name('apply')->where($where)->count('id');
    }

}