<?php
namespace app\api\controller;
class Code
{
    public function qrcode($data = '')
    {
//        vendor('phpqrcode.phpqrcode','.php');
        $qrcode_path_new = $this->Catalog();
        $errorCorrectionLevel = 'M';
        $matrixPointSize = 10;
        $matrixMarginSize = 2;
        \QRcode::png($data,$qrcode_path_new, $errorCorrectionLevel, $matrixPointSize, $matrixMarginSize);
        return '/'.$qrcode_path_new;
    }
    // 我的
    public function qrpng(){
        error_reporting(E_ERROR);
        $data = input('data');
        $url = urldecode($data);
        return \QRcode::png($url);
    }
    private function Catalog(){
        $path = 'upload/qrcode/'.date('Ymd',time());
        if(!file_exists ($path) && !mkdir($path,0777,true)){
            return array('code'=>0,'info'=>'文件夹创建失败！');
        }
        $path .= '/'.time().rand(100000,999999).'.png';
        return $path;
    }
}