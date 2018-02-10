<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/2/5 0005
 * Time: 19:03
 */

namespace app\common\model;


class RoleGroup extends Base
{
    protected $autoWriteTimestamp = true;

    public function setCache($pet_name = '')
    {
        $name = lcfirst($this->name);
        $roleGroup = $this->column('*','id');
        get_cache($name,$roleGroup);
    }

    // 列表检索条件
    public function list_where(){
        $where = '';
        return $where;
    }
    // 获取列表
    public function listing()
    {
        $where = $this->list_where();
        $role_groups = $this->where($where)->paginate(20);
        $role_groups->appends(input('get.'));
        $page = $role_groups->render();
        $res = [
            'role_groups'=>$role_groups->toArray()['data'],
            'page' => $page,
            'title'=>'用户分组列表'
        ];
        return $res;
    }
    // 编辑视图
    public function edit_view()
    {
        $id = input('id');
        $where = ['id'=>$id];
        $role_group = $this->where($where)->find();
        if($role_group){
            $role_group = $role_group->toArray();
        }
        $assigns = [
            'title' => '编辑角色分组',
            'role_group'=>$role_group,
        ];
        return $assigns;
    }
    // 编辑操作
    public function edit($data)
    {
        $where = [];
        if (!empty($data['id'])){
            $where = ['id'=>$data['id']];
        }
        $result = $this->save($data,$where);
        return $result;
    }
}