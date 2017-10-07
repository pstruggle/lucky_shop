<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017\9\17 0017
 * Time: 9:48
 */

namespace app\admin\controller;


use think\Db;

class System extends Base
{
    /**
     * 系统配置首页视图
     */
    public function index(){
        // 缓存类型.缓存key = 缓存值 所有类型
        // 配置类型.配置分类 = 值
        // 短信模板缓存.使用场景 = 具体值
        $fetch = input('config');
        $config_groups = get_cache('config.config_group');
        $fetch = $fetch ?:key($config_groups);
        $config = get_cache('config.'.$fetch);
        $this->assign([
            'title' => '配置',
            'fetch' => $fetch,
            'config' => $config,
            'config_groups' => $config_groups
        ]);
        return $this->template($fetch);
    }

    /**
     * 编辑配置内容
     */
    public function edit_op(){
        if(!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $data = input('post.');
        $_config = model('config');
        $result = $_config->edit($data);
        return $this->last_redirect();
    }

    // 编辑短信模板的视图
    public function sms_temp(){
        $scene = input('scene');
        $sms_temp = Db::name('sms_temp')->where('scene',$scene)->find();
        $this->assign([
            'title' => '配置',
            'sms_temp' => $sms_temp,
        ]);
        return $this->template();
    }

    // 编辑配置内容操作
    public function sms_temp_edit(){
        if(!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $data = input('post.');
        $data['param'] = sms_temp_re($data['temp']);
        $_smsTemp = model('smsTemp');
        $result = $_smsTemp->edit($data);
        if($result){
            return $this->last_redirect();
        }else{
            return $this->error('编辑失败');
        }
    }
    /**
     * 邮件发送日志
     */
    public function mail_log(){
        $logs = Db::name('mail_log')->order('send_time','desc')->paginate(20);
        $page = $logs->render();
        $this->assign([
            'title' => '邮件发送日志',
            'logs' => $logs,
            'page' => $page,
        ]);
        return $this->template();

    }
    /**
     * 短信发送日志
     */
    public function sms_log(){
        $logs = Db::name('sms_log')->order('send_time','desc')->paginate(20);
        $page = $logs->render();
        $this->assign([
            'title' => '短信发送日志',
            'logs' => $logs,
            'page' => $page,
        ]);
        return $this->template();
    }
}