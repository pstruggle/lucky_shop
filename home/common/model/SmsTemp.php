<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017\9\18 0018
 * Time: 22:30
 */

namespace app\common\model;


use think\exception\DbException;

class SmsTemp extends Base
{
    private $_smsTemp;
    protected function initialize(){
        parent::initialize();
        $this->_smsTemp = $this;
        $this->_base = $this;
    }
    // 将短信模板缓存
    public function setCache(){
        $name = lcfirst($this->name);
        $temps = $this->_smsTemp->select();
        $datas = [];
        foreach ($temps as $temp){
            $datas[$temp['scene']] = $temp;
        }
        get_cache($name,$datas);
    }

    /**
     * 编辑短信模板
     * @param array $datas 以数组形式传递数据
     * @return bool
     */
    public function edit($datas){
        $where = ['scene'=>$datas['scene']];
        $temp = $this->_smsTemp->where($where)->find();
        if(empty($temp)){
            $where = [];
        }
        try{
            $result = $this->_smsTemp->save($datas,$where);
        }catch (DbException $e){
            $e->getMessage();
            return false;
        }
        $this->setCache();
        return $result;

    }

}