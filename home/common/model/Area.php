<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/28
 * Time: 9:24
 */

namespace app\common\model;



class Area extends Base
{
    // 设置地区缓存
    public function setCache(){
        $name = lcfirst($this->name);
//        $areas = $this->select();
        $pcas = $this->pcas();
        get_cache($name,$pcas); // 配置分组缓存
    }
    public function pcas($pid = 0){
        $as = [];
        $areas = $this->where('pid',$pid)->select();
        foreach ($areas as $area){
            if($area['pid'] == $pid){
                $as[$area['id']][] = $area['area'];
                $as[$area['id']][] = $this->pcas($area['id']);
            }
        }
        return $as;
    }
}