<?php
namespace app\admin\controller;

use app\admin\controller\Base;


class Strategy extends Base
{
    private $_strategy;

    protected function _initialize()
    {
        parent::_initialize();
        $this->_strategy = model('strategy');
    }

    // 旅游攻略列表
    public function strategy_list()
    {
        $where = [];
        if (input('title')) {
            $where['title'] = ['like', '%' . input('title') . '%'];
        }
        if (input('id')) {
            $where['id'] = input('id');
        }
        $strategys = $this->_strategy->getStrategys($where);
        $this->assign([
            'title' => '旅游攻略列表',
            'strategys' => $strategys
        ]);
        return $this->template();
    }
    // 查看攻略内容
    public function strategy_eye(){
        $id = input('id');
        $where = ['id' => $id];
        $strategy = $this->_strategy->where($where)->find();
        if($strategy){
            $this->assign('strategy',$strategy);
        }else{
            $this->error('未找到该攻略');
        }
        $this->assign([
            'title' => '攻略详情',
        ]);
        return $this->template();
    }
    // 攻略编辑
    public function strategy_edit(){
        $id = input('id');
        $act = input('act');
        $map = [];
        switch ($act){
            case 'show_no':
                $where = ['id'=>$id];
                $map = ['is_show' => '0'];
                $result = $this->_strategy->save($map,$where);
                break;
            case 'show_yes':
                $where = ['id'=>$id];
                $map = ['is_show' => '1'];
                $result = $this->_strategy->save($map,$where);
                break;
            default:
                $this->error('编辑未知操作！','Strategy/strategy_list');
                break;
        }
        if(!empty($result)){
            $this->success('编辑成功！','Strategy/strategy_list');
        }else{
            $this->error('编辑失败！','Strategy/strategy_list');
        }
    }

}