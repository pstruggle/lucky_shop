<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/3/1 0001
 * Time: 14:26
 */

namespace app\common\model;


class Userinfo extends Base
{
    protected $type = ['lastdate'=>'datetime'];
    public function edit($data){
        $where = [];
        if(!empty($data['id'])){
            $where = ['id'=>$data['id']];
        }
        if (!empty($data['uid'])){
            $where = ['uid'=>$data['uid']];

        }
        $userinfo = $this->save($data,$where);
        if($userinfo){
            return $this->data['id'];
        }
        return false;
    }
    public function list_where()
    {
        $where = '';
        return $where;
    }

    public function listing()
    {
        $where = $this->list_where();
        $join = [
            ['users b','a.uid=b.id','right']
        ];
        $users = $this->alias('a')->join($join)->where($where)->paginate(20);
        $users->appends(input('get.'));

        $page = $users->render();
        $role_groups = get_cache('roleGroup');
        $role_name = "roles.role_";
        $assign = [
            'users'=>$users->toArray()['data'],
            'page'=>$page,
            'role_name'=>$role_name,
            'role_groups'=>$role_groups,
            'title'=>'管理员用户列表'
        ];
        return $assign;
    }
}