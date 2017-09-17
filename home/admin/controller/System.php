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
     * 系统配置首页页面展示
     */
    public function index(){
        // 表-字段-值 = 缓存值
        $fetch = input('config');
        $config_groups = Db::name('config_group')->order('weight asc')->select();
        $fetch = $fetch ?:$config_groups[0]['action'];
        $_config = model('config');
        $config = $_config->getConfig($fetch);
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
    public function edit(){
        if(!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $data = input('post.');
        $_config = model('config');
        $result = $_config->edit($data);
        return $this->last_redirect();
    }
}