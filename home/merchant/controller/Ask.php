<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;
use think\Cookie;
use think\Db;

class Ask extends Base
{
    private $_ask_temp;
    private $_ask_type;
    private $_publish;
    private $_message;


    protected function _initialize()
    {
        parent::_initialize();
        $this->_ask_type = model('askType');
        $this->_ask_temp = model('askTemp');
        $this->_publish = model('publish');
        $this->_message = model('message');
    }
    // 问价列表
    public function publish_list()
    {
        $order = ['p.addtime'=>'desc'];
        $publishs = $this->_publish->getPublishs([],$order);
        $page = $publishs->render();
        //联系过的用户
        $where = ['mid'=>$this->merchant['id']];
        $messages = $this->_message->getMessageList($where,'uid');
        $m_page = $messages->render();
        $merchan = [
            'id' => $this->merchant['id'],
            'logo' => $this->merchant['logo'],
            'name' => $this->merchant['name'],
            'phone' => $this->merchant['phone'],
        ];
        $this->assign([
            'title'=>'发布列表',
            'merchan'=>$merchan,
            'publishs' => $publishs,
            'page' => $page,
            'messages' => $messages,
            'm_page' => $m_page
        ]);
        return $this->template();
    }
    // 获取用户信息
    public function ajax_user(){
        $uid = input('uid');
        $where = ['id'=>$uid];
        $field = ['id','nickname','headimg'];
        $user = Db::name('userinfo')->where($where)->field($field)->find();
        if(empty($user)){
            return json_encode(['code'=>1,'info'=>'用户不存在']);
        }
        return json_encode($user);
    }
    // 异步获取聊天信息
    public function ajax_messages(){
        $uid = input('uid');
        $mid = input('mid');
        $where =  ['uid'=>$uid,'mid'=>$mid];
        $messages = $this->_message->getMessages($where,['addtime'=>'desc']);
        $temp = json_encode($messages);
        $messages = json_decode($temp,true);
        $messages = array_reverse($messages['data']);
        return json_encode($messages);
    }


}