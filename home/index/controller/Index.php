<?php
namespace app\index\controller;

class Index extends Base
{

    protected function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub

    }
    //首页
    public function index()
    {
        $categorys = get_cache('category');
        $pc_ads = get_cache('ad.pc_home');
        $home = model('category')->home();
        $this->assign([
            'title' => get_cache('config.mall')['store_title'],
            'categorys' => $categorys,
            'pc_ads' => $pc_ads,
            'home' => $home,
        ]);
        return $this->template();
    }

}

