<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;
use think\Cookie;
use think\Db;

class Enroll extends Base
{
    protected function _initialize(){
        parent::_initialize();
    }
    // 资质申请
    public function aptitude(){
        $act = 'add';
        $where = ['mid'=>$this->merchant['id']];
        $aptitude = Db::name('aptitude')->where($where)->find();
        if($aptitude){
            $act = 'update';
            $this->assign('aptitude',$aptitude);
        }
        $this->assign([
            'title' => '商户招商平台',
            'act' => $act
        ]);
        return $this->template();
    }
    public function wait_for(){
        return '<h1>请等待审核</h1>';
    }
    // 资质申请
    public function aptitudeedit(){
        $act = input("act");
        $mid = input("mid");
        $map = [
            "mid" => $this->merchant['id'],
            "identity" => input("identity")?input("identity"):'',
            "company_name" => input("company_name")?input("company_name"):'',
            "company_product" => input("company_product")?input("company_product"):'',
            "company_province" => input("company_province")?input("company_province"):'',
            "company_city" => input("company_city")?input("company_city"):'',
            "company_county" => input("company_county")?input("company_county"):'',
            "company_address" => input("company_address")?input("company_address"):'',
            "company_tel" => input("company_tel")?input("company_tel"):'',
            "contacts_name" => input("contacts_name")?input("contacts_name"):'',
            "contacts_phone" => input("contacts_phone")?input("contacts_phone"):'',
            "contacts_email" => input("contacts_email")?input("contacts_email"):'',
            "contacts_qq" => input("contacts_qq")?input("contacts_qq"):'',
            "isbranch" => input("isbranch")?input("isbranch"):'',
            "business_licence_type" => input("business_licence_type")?input("business_licence_type"):'',
            "business_licence_no" => input("business_licence_no")?input("business_licence_no"):'',
            "business_licence_file" => input("business_licence_file")?input("business_licence_file"):'',
            "business_licence_start" => input("business_licence_start")?input("business_licence_start"):'',
            "business_licence_end" => input("business_licence_end")?input("business_licence_end"):'',
            "business_certificate_no" => input("business_certificate_no")?input("business_certificate_no"):'',
            "business_certificate_file" => input("business_certificate_file")?input("business_certificate_file"):'',
            "tax_no" => input("tax_no")?input("tax_no"):'',
            "tax_file" => input("tax_file")?input("tax_file"):'',
            "put_no" => input("put_no")?input("put_no"):'',
            "put_file" => input("put_file")?input("put_file"):'',
            "policy_no" => input("policy_no")?input("policy_no"):'',
            "policy_file" => input("policy_file")?input("policy_file"):'',
            "policy_start" => input("policy_start")?input("policy_start"):'',
            "policy_end" => input("policy_end")?input("policy_end"):'',
            "operator_no" => input("operator_no")?input("operator_no"):'',
            "operator_just" => input("operator_just")?input("operator_just"):'',
            "operator_back" => input("operator_back")?input("operator_back"):'',
            "explain" => input("explain")?input("explain"):'',
            "open_bank" => input("open_bank")?input("open_bank"):'',
            "open_adderss" => input("open_adderss")?input("open_adderss"):'',
            "open_no" => input("open_no")?input("open_no"):'',
            "house_name" => input("house_name")?input("house_name"):'',
            "house_no" => input("house_no")?input("house_no"):'',
            "tax_type" => input("tax_type")?input("tax_type"):'',
            "tax_register" => input("tax_register")?input("tax_register"):'',
            "tax_name" => input("tax_name")?input("tax_name"):'',
            "tax_address" => input("tax_address")?input("tax_address"):'',
            "tax_tel" => input("tax_tel")?input("tax_tel"):'',
        ];
        $manage = input('manage/a');
        if(!empty($manage)){
            $map["manage"] = implode(',',$manage);
        }
        $map['business_licence_start'] = strtotime($map['business_licence_start']);
        $map['business_licence_end'] = strtotime($map['business_licence_end']);
        $map['policy_start'] = strtotime($map['policy_start']);
        $map['policy_end'] = strtotime($map['policy_end']);
        $result = '0';
        if($act == 'add'){
            $map['modtime'] = time();
            $map['addtime'] = $map['modtime'];
            $result = Db::table('ww_aptitude')->insert($map);
        }elseif($act == 'update'){
            $map['modtime'] = time();
            $where = ['mid'=>$this->merchant['id']];
            $result = Db::table('ww_aptitude')->where($where)->update($map);
        }else{
            $this->error('未知操作');
        }
        if($result == 0){
            $this->error('编辑失败');
        }else{
            $m_where = ['id'=>$this->merchant['id']];
            Db::name('merchant')->where($m_where)->update(['status'=>'1']);
            $this->success('请等待审核',url('Enroll/wait_for'));
        }
    }
}