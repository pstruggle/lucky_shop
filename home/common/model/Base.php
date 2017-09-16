<?php
namespace app\common\model;

use think\Db;
use think\Model;

class Base extends Model
{
    protected $_base;
    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
        Db::commit();
    }
    /*
     * 获取各列表
     * */
    public function getList($condition=[],$order=['id'=>'desc'],$page = 20){
        return $this->_base->where($condition)->order($order)->paginate($page);
    }
    // 按条件删除数据
    public function del($where = []){
        return $this->_base->where($where)->delete();

    }

}