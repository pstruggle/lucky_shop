<?php
namespace app\common\model;

use app\common\model\Basely;
use think\Db;
use think\Loader;
use think\Model;

class TripFlick extends Basely
{
    private $_flick;

    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
        $this->_flick = $this;
        $this->_base = $this;
    }

    public function getFlicks($where = [], $order = [], $page = 20)
    {
        $join = [
            [['ly_trip'=>'t'], 't.id=f.tid'],
        ];
        $field = ['f.*', 't.title'];
        return $this->_flick
            ->alias('f')
            ->join($join)
            ->field($field)
            ->where($where)
            ->order($order)
            ->paginate($page);
    }
}