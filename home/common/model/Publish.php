<?php
namespace app\common\model;

use app\common\model\Base;

class Publish extends Base
{
    private $_publish;
    protected function initialize(){
        parent::initialize();
        $this->_publish = $this;
        $this->_base = $this;
    }
    // 获取消息列表
    public function getPublishs($where=[],$order=[],$page = 20){
        $join = [
            ['userinfo u' , 'u.id = p.uid'],
            ['ask_type te' , 'te.id = p.type_id'],
            ['ask_temp t' , 't.id = p.tid']
        ];
        $field = ['p.*','u.nickname','u.headimg','u.phone','te.temp_type','t.temp'];
        return $this->_publish
            ->alias('p')
            ->join($join)
            ->field($field)
            ->where($where)
            ->order($order)
            ->paginate($page);
    }
}