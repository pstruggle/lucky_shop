<?php
namespace app\common\model;

use think\Model;

class Openapi extends Model
{
    private $_openapi;
    protected function initialize()
    {
        parent::initialize();
        $this->_openapi = $this;
    }
    /*
     * 根据名称字段获取信息
     * */
    public function getContent($name){
//        dump($name);exit;
        $temps = $this->_openapi->where(['names'=>$name])->value('content');
        return $temps;
    }
    /*
     * 根据名称，更新内容
     * */
    public function upContent($name,$content){
        return $this->_openapi->where(['names'=>$name])->setField('content', $content);
    }
}