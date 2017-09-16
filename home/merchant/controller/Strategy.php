<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;


class Strategy extends Base
{
    private $_strategy;

    protected function _initialize()
    {
        parent::_initialize();
        $this->_strategy = model('strategy');
    }
    // 旅游攻略列表
    public function strategy_list(){
        $where = ['mid'=>$this->merchant['id']];
        if (input('title')){
            $where['s.title']= ['like','%'.input('title') .'%'];
        }
        if (input('id')){
            $where['s.id'] = input('id');
        }
        $strategys = $this->_strategy->getStrategys($where);
        $this->assign([
            'title' => '旅游攻略列表',
            'strategys' => $strategys
        ]);
        return $this->template();
    }
    // 攻略编辑
    public function strategy_edit(){
        $act = 'add';
        $id = input('id');
        $where = ['id'=>$id];
        $strategy = $this->_strategy->where($where)->find();
        if( !empty( $strategy ) ){
            $act = 'update';
        }

        $this->assign([
            'title' => '旅游攻略列表',
            'strategy' => $strategy,
            'act' => $act,
            'id' => $id
        ]);
        return $this->template();
    }
    // 攻略编辑操作
    public function strategyedit(){
        $act = input('act');
        $id = input('id');
        $map = [
            'mid' => $this->merchant['id'],
            'title'=> input('title')?input('title'):'',
            'content'=> input('content')?input('content'):'',
            'pic'=> input('pic')?input('pic'):'',
        ];
        $destination = input('destination/a')?input('destination/a'):'';
        $desttext = input('desttext/a')?input('desttext/a'):'';
        $map['dest_id'] = implode(',',$destination);
        $map['dest'] = implode(',',$desttext);
        switch ($act){
            case 'add':
                $map['addtime'] = time();
                $result = $this->_strategy->save($map);
                break;
            case 'update':
                $where = ['id'=>$id];
                $result = $this->_strategy->save($map,$where);
                break ;
            default :
                $this->error('未知操作');
                break;
        }
        if($result){
            $this->success('编辑成功','Strategy/strategy_list');
        }else{
            $this->error('编辑失败');
        }
    }
    //删除攻略操作
    public function strategy_del(){
        $id = input('id');
        $where = ['id'=>$id];
        $result = $this->_strategy->where($where)->delete($where);
        if($result){
            $this->success('编辑成功','Strategy/strategy_list');
        }else{
            $this->error('编辑失败');
        }
    }
}