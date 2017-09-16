<?php
namespace app\common\model ;

use app\common\model\Base;

class AskTemp extends Base
{
    private $_ask_temp ;
    protected function initialize()
    {
        parent::initialize();
        $this->_ask_temp = $this;
        $this->_base = $this;
    }
    // 获取问价模板
    public function getTemps($where=[]){
        $temps = $this->_ask_temp->where($where)->field(['id','tid','temp'])->select();
        $ts = [];
        foreach ($temps as $temp){
            $ts[$temp['tid']][] = $temp;
        }
        return $ts ;
    }
    // 获取问价模板表单
    public function getInput($input){
        $inputs = json_decode($input,true);
        $html = ['html'=>'','js'=>''];
        foreach ($inputs as $i => $input){
            $temp = $this->switch_input($input,$i);
            $html['html'] .= $temp['html'];
            $html['js'] .= $temp['js'];
        }
        return $html;
    }
    // 表单模板类型设置
    public function switch_input($input,$i = 0){
        $html = ['html'=>'','js'=>''];
        switch ($input['type']){
            case 'text':default:
                $html['html'] .= '<li><label class="formName">'.$input['desc'].'：</label><input type="text" class="explain" data-id="'.$i.'"  placeholder="'.$input['explain'].'" /></li>';
                break;
            case 'number':
                $html['html'] .= '<li><label class="formName">'.$input['desc'].'：</label><input type="number" pattern="[0-9]*" class="explain" data-id="'.$i.'"  placeholder="'.$input['explain'].'"/></li>';
                break;
            case 'date':
                $html['html'] .= '<li><label class="formName">'.$input['desc'].'：</label>
    <div style="width: 100%;border: none;padding: .25rem 0;outline: none; color: silver" id="date'.$i.'" >'.$input['explain'].'</div><input type="hidden" class="explain " id="dates'.$i.'"  style="margin-top: -5px;" readonly data-id="'.$i.'"  placeholder="'.$input['explain'].'"/></li>';
                $html['js'] .= '$.jeDate("#date'.$i.'",{format:"YYYY-MM-DD",isTime:false,minDate:$.nowDate({DD:0}),zIndex:999999,choosefun:function(elem, val, date) {$("#dates'.$i.'").val(val)},})';
                break;
        }
        return $html ;
    }
}