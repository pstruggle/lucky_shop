<?php
namespace app\admin\controller;

use app\common\controller\Common;
use think\Db;
use think\Exception;
use think\exception\ClassNotFoundException;

class Base extends Common
{
    protected $admin;
    protected function _initialize(){
        parent::_initialize();  // TODO: Change the autogenerated stub
        $this->check_auth();
    }
    // 列表控制器
    public function listing(){
        $action = input('action');
        try{
            $_model = model($action);
            $result = $_model->listing();
            $this->assign($result);
            return $this->template($action.'_list');
        }catch (Exception $e){
            return $this->error('操作错误');
        }catch (ClassNotFoundException $c){
            return $this->error('操作错误');
        }
    }
    // 编辑视图控制器
    public function edit_view(){
        $action = input('action');
        try{
            $_model = model($action);
            $result = $_model->edit_view();
            $this->assign($result);
            return $this->template($action.'_edit');
        }catch (Exception $e){
            return $this->error('操作错误');
        }catch (ClassNotFoundException $c){
            return $this->error('操作错误');
        }
    }
    // 各种编辑操作
    public function edit(){
        if (!$this->request->isPost()){
            return $this->error('请求出错');
        }
        $action = input('action');
        $data = input('post.');
        try{
            $_model = model($action);
            $result = $_model->edit($data);
            if (!$result){
                return $this->error($_model->getError());
            }
            return $this->redirect('listing',['action'=>$action]);
        }catch (Exception $e){
            return $this->error('操作错误');
        }catch (ClassNotFoundException $c){
            return $this->error('操作错误');
        }
    }
    /**
     * 判断用户是否登录
     *
     */
    private function check_auth(){
        $this->check_login(); // 验证登录
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