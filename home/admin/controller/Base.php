<?php
namespace app\admin\controller;

use app\common\controller\Common;
use think\Cookie;
use think\Db;
use think\View;

class Base extends Common
{
    protected $admin;
    protected function _initialize(){
        parent::_initialize();  // TODO: Change the autogenerated stub
        $this->check_auth();
    }
    /**
     * 判断用户是否登录
     *
     */
    private function check_auth(){
        if(empty($this->user) || $this->user['is_admin'] != 1){
            return $this->error('您不是管理员',
                url('index/Index/index'));
        }
        $admin = $this->admin = Db::name('admin')
            ->where('uid',$this->user['id'])
            ->find();
        if(empty($admin)){
            return $this->error('您不是管理员',
                url('index/Index/index'));
        }
        if($admin['overdate'] != 0 && $admin['overdate'] < time()){
            return $this->error('您的管理员身份已经到期！',
                url('index/Index/index'));
        }
        

    }
    /*
     * 为模板赋必须值
     * */
    private function assigns(){
        $cache_config= getCache('basic');
        $trip_num = model('trip')->trip_num();
        $shop_num = model('shop')->shop_num();
        $user_num = model('userinfo')->user_num();
        $this->assign([
            'admininfo' => $this->admininfo,
            'cache_config' => $cache_config,
            'trip_num' => $trip_num,
            'shop_num' => $shop_num,
            'user_num' => $user_num,
        ]);
    }
}