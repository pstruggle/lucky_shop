<?php
namespace app\common\model;

use app\common\model\Base;
use think\Db;

class Config extends Base
{
    private $_config;
    protected function initialize(){
        parent::initialize();
        $this->_config = $this;
        $this->_base = $this;
    }
    //将配置缓存
    public function setCache(){
        $name = lcfirst($this->name);
        $groups = Db::name('config_group')
            ->order('weight asc')
            ->column('title','action');

        get_cache($name.'.config_group',$groups); // 配置分组缓存

        foreach ($groups as $action => $group){
            $configs = $this->getConfig($action);
            get_cache($name.'.'.$action,$configs); // 配置具体缓存
        }
    }

    /**
     * 编辑配置内容
     * @param array $datas 以数组形式传递数据
     * @return bool
     */
    public function edit($datas){

        foreach ($datas as $action=>$data){
            Db::name('config')
                ->where('action',$action)
                ->setField('value', $data);
        }
        $this->setCache(); // 更新缓存
        return true;
    }

    /**
     * 根据配置分组action获取需要配置的值
     * @param string $action 分组key
     * @return array ['action'=>'value']
     */
    public function getConfig($action){
        $group_id = Db::name('config_group')->where(['action'=>$action])->value('id');
        if(empty($group_id)){
            return false ;
        }
        $configs = $this->_config
            ->where(['group_id'=>$group_id])
            ->column('value','action');
        return $configs;
    }
    public function test(){
        dump($this->class);
    }
}