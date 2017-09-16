<?php
namespace app\index\controller;
use app\index\controller\Base;
use think\Cookie;
use think\Db;

class Upload extends Base
{
    protected function _initialize(){
        parent::_initialize();
    }
    public function admin(){
        dump(input());

        \think\Image::open();

    }
    public function image(){
        dump(input());
//        header('Content-type: application/image');
        $image = \think\Image::open('.'.input('img'));
//        echo '<img src="'.$image.'"/>';
        return response($image->save(), 200)->contentType("image/jpg");
//        return $image->save();
    }
}