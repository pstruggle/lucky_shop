<?php
namespace app\common\model;

use app\common\model\Basely;

class Destination extends Basely
{
    private $_destination;
    protected function initialize(){
        parent::initialize();
        $this->_destination = $this;
        $this->_base = $this;
    }
    //获取目的地列表
    public function getDestination($where=[],$order = []){
        $join = [
            [['ww_merchant'=> 'm'] , 'd.mid = m.id'],
        ];
        $field = ['d.*','m.name','m.phone'];
        $destinations = $this->_destination
                            ->alias('d')
                            ->join($join)
                            ->field($field)
                            ->where($where)->order($order)->select();
        return $destinations;
    }
    //获取目的地格式化列表
    public function getFormatD($where=[],$order = []){
        $destinations = $this->getDestination($where,$order);
        $cdests = $this->callbackDes($destinations,0);
        return $cdests;

    }
    //回调目的地
    private function callbackDes($destinations,$pid=0){
        $rnav = array();
        foreach ($destinations as $destination){
            if($destination['pid'] == $pid){
                $rnav[$destination['id']] = $destination;
                $rnav[$destination['id']]['des'] = $this->callbackDes($destinations,$destination['id']);
            }
        }
        return $rnav;
    }
    private function callbackDest($destinations,$laval = 0){
        $rnav = array();
        $laval ++;
        foreach ($destinations as $destination){
            $destination['laval'] = $laval ;
            $rnav[] = $destination;
            $rnav = array_merge($rnav,$this->callbackDest($destination['des'],$laval));
        }
        return $rnav;
    }







    // 获取所有子集的id
    public function getDestIndex($where=[]){
        $index = $this->_destination->where($where)->select();
        $dests = $this->_destination->select();
        $Dids = $this->getDids($index);
        $ids = [];
        foreach ($Dids as $Did){
            $ids[] = $Did;
            $ids = array_merge($ids,$this->getDestId($dests,$Did));
        }
        return $ids;
    }
    // 获取id
    public function getDestId($index,$pid=0){
        $ids = [];
        foreach ($index as $inde){
            if($inde['pid'] == $pid){
                $ids[] = $inde['id'];
                $ids = array_merge($ids,$this->getDestId($index,$inde['id']));
            }
        }
        return $ids;
    }
    public function getDids($index){
        $ids = [];
        foreach ($index as $inde){
            $ids = array_merge($ids,$this->getDid($inde));
        }
        return $ids;
    }
    public function getDid($index){
        $ids = [];
        if($index['pid'] == 0) {
            return $this->_destination->where('pid',$index['id'])->column('id');
        }else{
            $index = $this->_destination->where('id',$index['pid'])->find();
            $ids = array_merge($ids,$this->getDid($index));
        }
        return $ids;
    }


}