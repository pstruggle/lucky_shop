<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/2/5 0005
 * Time: 18:57
 */

namespace app\admin\controller;


use think\Exception;

class Auth extends Base
{
    public function _initialize(){
        parent::_initialize();  // TODO: Change the autogenerated stub
    }
    // 赋予权限视图
    public function grant(){
        try{
            $_model = model('roles');
            if($this->request->isAjax()){
                $data = get_cache('action.actions');
                $this->success('获取成功',null,$data);
            }
            $result = $_model->grant();
            $this->assign($result);
            return $this->template();

        }catch (Exception $e){
            $this->error($e->getMessage());
        }
    }

    // 根据条件
    public function roles(){
        $id = input('group_id');
        if (!$id){
            $this->error('分组id不存在');
        }
        $roles = get_cache('roles.roles_'.$id);
        $this->success('获取成功',null,$roles);

    }
}