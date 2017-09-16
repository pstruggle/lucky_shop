<?php
namespace app\admin\controller;

use app\admin\controller\Base;


class Arder extends Base
{
    private $_goods;

    protected function _initialize()
    {
        parent::_initialize();
        $this->_goods = model('goods');
    }
    // 旅游休闲卡列表
    public function arder_list(){
        $where = [];
        if (input('tradename')){
            $where['tradename']= ['like','%'.input('tradename') .'%'];
        }
        if (input('id')){
            $where['a.id'] = input('id');
        }
        $arders = $this->_goods->getArders($where);
        $this->assign([
            'title' => '旅游休闲卡列表',
            'arders' => $arders
        ]);
        return $this->template();
    }
    // 休闲卡编辑
    public function arder_edit(){
        $id = input('id');
        $act = input('act');
        $map = [];
        switch ($act){
            case 'show_no':
                $where = ['id'=>$id];
                $map = ['is_show' => '0'];
                $result = $this->_goods->save($map,$where);
                break;
            case 'show_yes':
                $where = ['id'=>$id];
                $map = ['is_show' => '1'];
                $result = $this->_goods->save($map,$where);
                break;
            default:
                $this->error('未知操作！','Arder/arder_list');
                break;
        }
        if($result){
            $this->success('编辑成功！');
        }else{
            $this->error('编辑失败！');
        }
    }
    // 休闲卡查看详情
    public function arder_eye(){
        $id = input('id');
        $where = ['id' => $id];
        $arder = $this->_goods->where($where)->find();
        if($arder){
            $this->assign('arder',$arder);
        }else{
            $this->error('未找到该休闲卡');
        }
        $this->assign([
            'title' => '休闲卡详情',
        ]);
        return $this->template();
    }
}