<?php
namespace app\index\controller;

class Arder extends Base
{
    private $_goods;
    private $_cart;

    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->_goods = model('goods');
        $this->_cart = model('cart');
    }
    // 休闲卡列表
    public function arder_list(){
        $url = current_url();
        $url_info = parse_url($url);
        $where = '';
        if(!empty($url_info['query'])){
            $where = $url_info['query'];
        }
        $this->assign([
            'title' => '休闲卡列表',
            'where' => $where
        ]);
        return $this->template();
    }
    //异步获取攻略列表信息
    public function ajax_arder(){
        $where = $this->_goods->getWhere();
        $arders = $this->_goods->getArders($where);
        $this->assign('arders',$arders);
        return $this->template();
    }
    // 门票详情
    public function details(){
        $arder = $this->_goods->getArder();
        if(empty($arder)){
            $this->error('休闲卡不存在',url('Index/index'));
        }
        $this->assign([
            'title' => !empty($arder['title'])?$arder['title']:'小惠猫-旅游攻略',
            'arder' => $arder,
        ]);
        return $this->template();
    }
    //购买休闲卡
    public function order(){
        $id = input('pid');
        $map = [
            'gid'   => $id,
            'uid'   => $this->userinfos['id'],
            'oid'   => '0',
            'sum'   => 1,
            'spec'  => '',
            'status' => '1',
            'addtime' => time(),
        ];
        $result = $this->_cart->addCart($map);
    }

}