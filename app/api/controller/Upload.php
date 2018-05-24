<?php
namespace app\api\controller;
use app\common\model\Config;

class Upload extends Base
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
    //文件上传
    public function index()
    {
        $file = request()->file('file');
        $o_file = $file->getInfo();
        $config = Config::get("upload");
        $info = $file->move($config['path']);
        Config::set("default_return_type", "json");
        if ($info) {
            // 成功上传后 获取上传信息
            $ret = array(
                "real_name" => $o_file["name"],
                "extension" => $info->getExtension(),
                "url" => $config["url_path"] . $info->getSaveName(),
                "saveName" => $info->getSaveName(),
                "fileName" => $info->getFilename(),
            );
            $this->success("上传成功", null, $ret);
        } else {
            // 上传失败获取错误信息
            $this->error($file->getError());
        }
    }

}
