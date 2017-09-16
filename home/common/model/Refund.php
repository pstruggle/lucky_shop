<?php
namespace app\common\model;

use app\common\model\Base;

class Refund extends Base
{
    private $_refund;
    protected function initialize(){
        parent::initialize();
        $this->_refund = $this;
        $this->_base = $this;
    }
    public function add_refund($result){
        $map = [
            'refund_id' => empty($result['refund_id'])?'':$result['refund_id'],
            'return_code' => $result['return_code'],
            'result_code' => $result['result_code'],
            'infos' => json_encode($result),
            'addtime' => time()
        ];
        $this->_refund->insert($map);
    }
}