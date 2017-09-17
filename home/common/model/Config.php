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
    public function config_cache(){
        $keys = $this->_configKey->getList([],[],0);
        foreach ($keys as $key){
            $configs = $this->_config->getList(['key'=>$key['id']],[],0);
            $data = [];
            foreach ($configs as $config){
                $data[$config['name']] = $config['value'];
            }
            cache($key['key'],$data);
        }
        return true;
    }
    //  编辑配置内容
    public function edit($datas){

        foreach ($datas as $action=>$data){
            Db::name('config')
                ->where('action',$action)
                ->setField('value', $data);
        }
//        $this->_config->config_cache();
        return true;
    }
    //  单个配置修改
    public function onedit($array = []){
        foreach ($array as $name=>$v){
            $where['name'] = $name;
            $value['value'] = $v;
            $this->_config->save($value,$where);
        }
        $this->_config->config_cache();
    }
    /**
     * 根据配置分组action获取需要配置的值
     * @param string $action 分组key
     * @return array ['action'=>'value']
     */
    public function getConfig($action){
        $group_id = Db::name('config_group')->where(['action'=>$action])->value('id');
        $configs = $this->_config
            ->where(['group_id'=>$group_id])
            ->select();
        $data = [];
        foreach ($configs as $config){
            $data[$config['action']] = $config['value'];
        }
        return $data;
    }

}