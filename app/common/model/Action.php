<?php
/**
 * Created by PhpStorm.
 * User: cjphp
 * Date: 2018/1/28 0028
 * Time: 17:04
 */

namespace app\common\model;


use think\Cache;

class Action extends Base
{
    protected $autoWriteTimestamp = true;
    // 设置功能缓存
    public function setCache($pet_name=''){
        $name = lcfirst($this->name);
        $pet_names = explode('_',$pet_name);
        switch ($pet_names[0]){
            case 'menus':
                Cache::tag($name)->set($name.'.menus_'.$pet_names[1],$this->menus($pet_names[1]));
                break;
            case 'afterAction': // 获取后端所有功能
                $where = ['is_nose'=>0];
                Cache::tag($name)->set($name.'.afterAction',$this->actions_list($where));
                break;
            case 'beforeAction': // 获取前端所有功能
                $where = ['is_nose'=>1];
                Cache::tag($name)->set($name.'.beforeAction',$this->actions_list($where));
                break;
            case 'action': // 获取前端所有功能
                Cache::tag($name)->set($name.'.action',$this->column("*",'id'));
                break;
            case 'actions': // 获取前端所有功能
                Cache::tag($name)->set($name.'.actions',$this->actions_list());
                break;
            default:
                Cache::clear($name);

        }
    }
    // 包含方式获取功能控制器
    public function actions($where=[],$pid=0){
        $where['pid'] = $pid;
        $order = ['is_show'=>'desc','is_nose'=>'desc','weight'=>'desc'];
        $actions = $this->where($where)->order($order)->select()->toArray();
        foreach ($actions as $item => $action){
            $actions[$item]['children'] = $this->actions($where,$action['id']);
        }
        return $actions;
    }
    // 列表方式获取功能
    public function actions_list($where=[],$pid=0,$layer=0){
        $where['pid'] = $pid;
        $order = ['is_show'=>'desc','is_nose'=>'desc','weight'=>'desc'];
        $actions = $this->where($where)->order($order)->select()->toArray();
        $tree = ' ├─';
        $s = [];
        foreach ($actions as $item => $action){
            $action['tree'] = str_pad('',mb_strlen($tree)*$layer,$tree);
            $action['layer'] = $layer;
            $s[] = $action;
            $s = array_merge($s,$this->actions_list($where,$action['id'],$layer+1));
        }
        return $s;
    }
    // 获取后端菜单
    public function menus($role){
        $roles = $this->db()->name('roles')->where('id',$role)->value('auths');
        if(!$roles){
            return false;
        }
        $roles .= ",".get_cache('config.basic')['admin_index'];
        $where = ['pid'=>0,'is_show'=>'1','is_nose'=>'0','id'=>['in',$roles]];
        $menus = $this->actions($where);
        return $menus;
    }
    // 获取前端
    public function before_action(){
        $where = ['pid'=>0,'is_nose'=>'1'];
        $actions = $this->actions($where);
        return $actions;
    }
    // 获取后端
    public function after_action(){
        $where = ['pid'=>0,'is_nose'=>'0'];
        $actions = $this->actions($where);
        return $actions;
    }
    // 获取单个
    public function get_action($where){
        return $this->where($where)->find()->toArray();
    }

    public function listing(){
        $where = ['is_nose'=>'0'];
        $after_actions = $this->actions_list($where);
        $where = ['is_nose'=>'1'];
        $before_actions = $this->actions_list($where);
        $list = [
            'title' => '功能列表',
            'after_actions' => $after_actions,
            'before_actions' => $before_actions,
        ];
        return $list;
    }
    public function edit_view()
    {
        $id = input('id');
        $assign = [];
        if(!empty($id)){
            $where = ['id'=>$id];
            $action = $this->get_action($where);
            $assign['action'] = $action;
        }
        $assign['actions'] = $this->actions_list();
        $assign['title'] = '功能编辑';
        return $assign;
    }

    public function edit($data)
    {
        $where = [];
        if (!empty($data['id'])){
            $where['id']= $data['id'];
        }
        $save = $this->validate(true)->save($data,$where);
        $this->setCache();
        return $save;
    }
}