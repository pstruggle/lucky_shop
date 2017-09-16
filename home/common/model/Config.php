<?php
namespace app\common\model;

use app\common\model\Base;
use think\Db;

class Config extends Base
{
    private $_config;
    private $_configKey;
    protected function initialize(){
        parent::initialize();
        $this->_config = $this;
        $this->_configKey = model('configKey');
        $this->_base = $this;
    }
    //将配置缓存
    public function config_cache(){
        $keys = $this->_configKey->getList([],[],0);
        foreach ($keys as $key){
            $configs = $this->_config->getList(['key'=>$key['id']],[],0);
            $data = [];
            foreach ($configs as $config){
                $data[$config['name']] = $config['value'];
            }
            cache($key['key'],$data);
        }
        return true;
    }
    //  编辑配置内容
    public function edit($key){

        $configs = $this->_config->getNeedConfig($key);
        $inputs = input();
        $prefix = config('database.prefix');
        foreach ($configs as $config){
            $where['name'] = $config['name'];
            $value['value'] = $inputs[$prefix.$config['name']];
            Db::name('config')->where($where)->update($value);
        }
        $this->_config->config_cache();
        return true;
    }
    //  单个配置修改
    public function onedit($array = []){
        foreach ($array as $name=>$v){
            $where['name'] = $name;
            $value['value'] = $v;
            $this->_config->save($value,$where);
        }
        $this->_config->config_cache();
    }
    //获取需要配置的值
    public function getNeedConfig($key){
        $keyid = Db::name('config_key')->where(['key'=>$key])->value('id');
        $configs = $this->_config->getList(['key'=>$keyid],['weight'=>'desc'],0);
        return $configs;
    }
    // 表单字符串
    public function input_html($key){
        $html = ['html'=>'','js'=>''];
        $configs = $this->_config->getNeedConfig($key);
        foreach ($configs as $config){
            $input_dic  = $this->input_dic($config);
            $html['html'] .= $input_dic['html'];
            $html['js'] .= $input_dic['js'];
        }
        return $html;
    }
    // 表单字典
    private function input_dic($config){
        $input = json_decode($config['input'],true);
        $prefix = config('database.prefix');
        $config['value'] = htmlspecialchars($config['value']);
        $html = ['html'=>'','js'=>''];
        $html['html'] .= '<div class="form-group"><label class="col-sm-3 control-label">'.$config['info'];

        if($input['required']){
            $html['html'] .= '<span class="required">*</span>';
        }
        $html['html'] .= '</label><div class="col-sm-6">';

        switch ($input['type']){
            case 'text': default:
            $html['html'] .= '<input type="text" id="'.$prefix.(empty($config['name'])?'':$config['name']).'" name="'.$prefix.(empty($config['name'])?'':$config['name']).'" placeholder="'.(empty($config['desc'])?'':$config['desc']).'" class="form-control" '.(empty($input['attr'])?'':$input['attr']).' value="'.(empty($config['value'])?'':$config['value']).'" />';
            break;

            case 'select':
                $html['html'] .= '<select class="form-control" '.(empty($input['attr'])?'':$input['attr']).' name="'.$prefix.(empty($config['name'])?'':$config['name']).'" id="'.$prefix.(empty($config['name'])?'':$config['name']).'">';
                    if(is_array($input['value']))
                    foreach ($input['value'] as $value){
                        $html['html'] .= '<option value="'.(!isset($value[0])?'':$value[0]).'">'.(empty($value[1])?'':$value[1]).'</option>';
                    }
                $html['html'] .='</select>';
                $html['js'] .= '$("#'.$prefix.(empty($config['name'])?'':$config['name']).'").val('.(empty($config['value'])?'':$config['value']).')';
                break;

            case 'file':
                $html['html'] .= '<input type="file" name="'.$prefix.(empty($config['name'])?'':$config['name']).'" id="'.$prefix.(empty($config['name'])?'':$config['name']).'"  />';
                $html['js'] .= 'var up = new Upload("'.$prefix.(empty($config['name'])?'':$config['name']).'", {}, "'.(empty($config['value'])?'':$config['value']).'");';
                break;
        }
        $html['html'] .= '</div></div>';
        return $html;
    }

}