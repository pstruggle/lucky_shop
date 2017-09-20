<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006-2015 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: yunwuxin <448901948@qq.com>
// +----------------------------------------------------------------------

namespace think\sendsms;

use think\Config;
use think\Exception;
use think\Log;
use think\Session;

class Sendsms
{
    protected $config = [
        'terrace'    => 'aliyun',
        // 发送短信平台 可选值 aliyun | alidayu
        'seKey'    => 'ThinkPHP.CN',
        // 验证码加密密钥
        'codeSet'  => '0123456789',
        // 验证码字符集合
        'expire'   => 1800,
        // 验证码过期时间（s）
        'length'   => 5,
        // 验证码位数
        'reset'    => false,
        // 验证成功后是否重置
        'accessKeyId' => 'LTAI3zVfvEg9cdBW',
        // 短信验证key
        'secret' => 'uNDDVOZX0lF6jAjnn9pk24gtsoD9M6',
        // 短信验证key对应secret

    ];
    private $smsObj; // 短信发送对象
    /**
     * 架构方法 设置参数
     * @access public
     * @param  array $config 配置参数
     */
    public function __construct()
    {
        $this->config = array_merge($this->config, (array)Config::get('sms'));
        $this->getobj();
    }
    /**
     * 使用 $this->name 获取配置
     * @access public
     * @param  string $name 配置名称
     * @return mixed    配置值
     */
    public function __get($name)
    {
        return $this->config[$name];
    }

    /**
     * 设置验证码配置
     * @access public
     * @param  string $name  配置名称
     * @param  string $value 配置值
     * @return void
     */
    public function __set($name, $value)
    {
        if (isset($this->config[$name])) {
            $this->config[$name] = $value;
        }
    }

    /**
     * 检查配置
     * @access public
     * @param  string $name 配置名称
     * @return bool
     */
    public function __isset($name)
    {
        return isset($this->config[$name]);
    }
    /**
     * 获取发送短信对象
     */
    public function getSmsObj(){
        return $this->smsObj;
    }
    /**
     * 验证验证码是否正确
     * @access public
     * @param string $code 用户验证码
     * @param string $id   验证码标识
     * @return bool 用户验证码是否正确
     */
    public function check($code, $id = '')
    {
        $key = $this->authcode($this->seKey) . $id;
        // 验证码不能为空
        $secode = Session::get($key, '');
        if (empty($code) || empty($secode)) {
            return false;
        }
        // session 过期
        if (time() - $secode['verify_time'] > $this->expire) {
            Session::delete($key, '');
            return false;
        }

        if ($this->authcode(strtoupper($code)) == $secode['verify_code']) {
            $this->reset && Session::delete($key, '');
            return true;
        }

        return false;
    }

    /**
     * 生成验证码并将值保存的session中
     * 验证码保存到session的格式为： array('verify_code' => '验证码值', 'verify_time' => '验证码创建时间');
     * @access public
     * @param string $id 要生成验证码的标识
     * @return string
     */
    public function entry($id = '')
    {
        // 获得验证码
        $code   = []; // 验证码
        for ($i = 0; $i < $this->length; $i++) {
            $code[$i] = $this->codeSet[mt_rand(0, strlen($this->codeSet) - 1)];
        }
        $temp_code = strtoupper(implode('', $code));
        // 保存验证码
        $key                   = $this->authcode($this->seKey);
        $code                  = $this->authcode($temp_code);
        $secode                = [];
        $secode['verify_code'] = $code; // 把校验码保存到session
        $secode['verify_time'] = time(); // 验证码创建时间
        Session::set($key . $id, $secode, '');
        return $temp_code;
    }
    /**
     * 确定发送短信对象
     * @return null
     */
    private function getobj(){
        switch ($this->config['terrace']){
            case 'aliyun':default:
            require_once (__DIR__.'/sms/aliyun/Aliyun.php');
            $this->smsObj = new \aliyun\Aliyun($this->config);
            break;
            case 'alidayu':
                break;
        }
    }
    public function handle_data($param_key,$param_value){
        $param = [];
        foreach ($param_key as $item => $value){
            if($value == ''){
                continue ;
            }
            $param[$value] = $param_value[$item];
        }
        return $param;
    }
    /**
     * 发送短信
     * @param array $data 发送短信数据
     * 参数格式 [
     *  'recNum' => 15879221657,
     *  'signName' => '小惠猫',
     *  'temp' => 'SMS_73920020',
     *  'param' => '{"code":"123456","product":"123456"}',
     *  'outId' => ''
     *  ]
     */
    public function send($data){
        $result = $this->smsObj->send($data);
        sms_log($data,$result);
        Log::write('短信发送日志:'.json_encode($result));
        return $result;
    }
    /* 加密验证码 */
    private function authcode($str)
    {
        $key = substr(md5($this->seKey), 5, 8);
        $str = substr(md5($str), 8, 10);
        return md5($key . $str);
    }
}
