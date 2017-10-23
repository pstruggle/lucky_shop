<?php
namespace app\api\controller;
class Upload
{
    public function single_upload($action)
    {
        vendor("Uploader.UPcontroller",'.class.php');
        $con = new \UPcontroller($action);
        return $con->action();
    }
    public function handle(){
        error_reporting(E_ERROR);
        header('Content-Type: image/jpeg');
        $pic = urldecode( input('pic') );
        $width = input('w');
        $height = input('h');
        try{
            $image = \think\Image::open('.'.$pic);
            response($image->thumb($width,$height)->save(), 200);
        }catch (\think\Exception $e){}

        exit;
    }
    // 添加水印
    public function water_text(){
        error_reporting(E_ERROR);
        header('Content-Type: image/jpeg');
        $pic = urldecode( input('pic') );
        $text = '编号:'.input('txt');
        try{
            $image = \think\Image::open('.'.$pic);
            $width = $image->width() / 30 ;
            response($image->text($text,'./static/public/Bootstrap/fonts/songti.TTF',$width,'#000000',\think\Image::WATER_SOUTHEAST,-20)->save(), 200);
        }catch(\think\Exception $imageExeption){

        }
        exit;
    }
    public function crop_url(){
        error_reporting(E_ERROR);
        header('Content-Type: image/jpeg');
        $pic = urldecode( input('pic') );
        $text = '编号'.input('txt');
        try{
            $image = \think\Image::open('.'.$pic);
            response($image->text($text,'./static/public/Bootstrap/fonts/songti.TTF',100,'#555555',\think\Image::WATER_SOUTHEAST,-20)->save(), 200);
        }catch(\think\Exception $imageExeption){

        }
        exit;
    }
}
