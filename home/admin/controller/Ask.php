<?php
namespace app\admin\controller;

use app\admin\controller\Base ;

class Ask extends Base
{
    private $_ask_type;
    private $_ask_temp;
    // 初始化继承
    protected function _initialize(){
        parent::_initialize();
        $this->_ask_type = model('askType');
        $this->_ask_temp = model('askTemp');
    }

    // 问价模板类型列表
    public function temp_type(){
        $ask_types = $this->_ask_type->getList();
        $page = $ask_types->render();
        $this->assign([
            'title' => '问价模板类型列表',
            'ask_types' => $ask_types,
            'page' => $page
        ]);
        return $this->template();
    }
    // 问价模板类型编辑页面
    public function temp_type_edit(){
        $act = 'add';
        $aid = input('aid');
        $where = ['id'=>$aid];
        $ask_type = $this->_ask_type->where($where)->find();
        if(!empty($ask_type)){
            $act = 'update';
            $this->assign([
                'ask_type'=>$ask_type,
                'aid' => $aid
            ]);
        }
        $this->assign([
            'title'=>'问价模板类型列表',
            'act' => $act
        ]);
        return $this->template();
    }
    // 问价模板类型编辑操作方法
    public function temp_typeEdit(){
        $act = input('act');
        $map = [
            'temp_type' => input('temp_type'),
            'status' => input('status'),
            'weight' => input('weight'),
        ];
        switch ($act){
            case 'add':default:
                $map['addtime'] = time();
                $result = $this->_ask_type->save($map);
                break;
            case 'update':
                $aid = input('aid');
                $where = ['id' => $aid];
                $result = $this->_ask_type->save($map,$where);
                break;
            case 'del':
                $aid = input('aid');
                $where = ['id' => $aid];
                $result = $this->_ask_type->where($where)->delete();
                break;
        }
        if($result){
            $this->success('编辑成功');
        }else{
            $this->error('编辑失败');
        }
    }
    //问价模板列表
    public function temp(){
        $atid = input('atid');
        $where = ['tid' => $atid];
        $ask_temps = $this->_ask_temp->getList($where);
        $page = $ask_temps->render();
        $this->assign([
            'title'=>'问价模板列表',
            'ask_temps' => $ask_temps,
            'page' => $page
        ]);

        return $this->template();
    }
    //问价模板编辑页面
    public function temp_edit(){
        $act = 'add';
        $atid = input('atid'); // 模板分类id
        $tid = input('tid');
        $where = ['id'=>$atid];

        $ask_type = $this->_ask_type->where($where)->find();
        if(!empty($ask_type)){
            $t_where = ['id'=>$tid];
            $ask_temp = $this->_ask_temp->where($t_where)->find();
            if(!empty($ask_temp)){
                $act = 'update';
                $this->assign([
                    'ask_temp'=>$ask_temp,
                    'atid' => $atid,
                    'tid' => $tid
                ]);
            }
        }else{
            $this->error('问价类型不存在');
        }
        $this->assign([
            'title'=>'编辑问价模板',
            'act' => $act
        ]);
        return $this->template();
    }
    //问价模板编辑操作方法
    public function tempEdit(){
        $act = input('act');
        $map = [
            'temp' => input('temp')?input('temp'):'',
            'tid' => input('atid'),
            'status' => input('status'),
            'weight' => input('weight'),
        ];
        $asks = input('ask/a');
        $map['input'] = json_encode($asks);
        switch ($act){
            case 'add':default:
            $map['addtime'] = time();
            $result = $this->_ask_temp->save($map);
            break;
            case 'update':
                $aid = input('aid');
                $where = ['id' => $aid];
                $result = $this->_ask_temp->save($map,$where);
                break;
            case 'del':
                $aid = input('aid');
                $where = ['id' => $aid];
                $result = $this->_ask_temp->where($where)->delete();
                break;
        }

        if($result){
            $this->success('编辑成功');
        }else{
            $this->error('编辑失败');
        }
    }

}