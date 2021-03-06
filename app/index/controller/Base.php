<?php
namespace app\index\controller;

use app\common\controller\Common;

class Base extends Common
{
    protected $type = 'json';
    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->assigns();
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
    // 传值
    public function assigns(){
        $pc_navs = get_cache('nav.pc_nav');
        $m_navs = get_cache('nav.m_nav');
        $cart_count = get_cache('cart.count_'.$this->user['id']);
        $this->assign([
            'pc_navs' => $pc_navs,
            'm_navs' => $m_navs,
            'cart_count' => $cart_count
        ]);
    }
}