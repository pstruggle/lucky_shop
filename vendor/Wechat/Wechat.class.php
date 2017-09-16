<?php
/*
 * user:pmy
 * Date:2017-04-28
 * Time:上午10:30
 * 微信接口调用类
 * * */

class Wechat
{
    private $appid;
    private $secret;
    private $access;
    /* 构造方法
     *
     * @access public
     * @param String $appid 微信第三方用户唯一凭证
     * @param String $secret 微信第三方用户唯一凭证密钥，即appsecret
     * */
    public function __construct($appid='',$secret='',$access='')
    {
        $this->appid = $appid;
        $this->secret = $secret;
        $this->access = $access;
    }
    /*
     * 获取access_token
     * @access public
     * */
    public function cgi_access()
    {
        $url = 'https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid='.$this->appid.'&secret='.$this->secret;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 调用自定义菜单接口
     *
     * @access public
     * @param Array $datas 菜单数组
     * */
    public function cgi_meumCreate($datas){
        $datas =json_encode($datas,JSON_UNESCAPED_UNICODE);
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/create?access_token='.$this->access;
        return json_decode($this->weCurl($url,$datas,'POST'),true);
    }
    /*
     * 获取自定义菜单
     *
     * @access public
     * */
    public function cgi_menuGet(){
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/get?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 删除自定义菜单
     *
     * @access public
     * */
    public function cgi_menuDel(){
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/delete?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 创建个性化菜单
     *
     * @access public
     * */
    public function cgi_menuAddconditional(){
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/addconditional?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 删除个性化菜单
     *
     * @access public
     * */
    public function cgi_menuDelconditional(){
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/delconditional?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 测试个性化菜单匹配结果
     *
     * @access public
     * */
    public function cgi_menuTrymatch($datas){
        $datas = json_encode($datas,JSON_UNESCAPED_UNICODE);
        $url = 'https://api.weixin.qq.com/cgi-bin/menu/trymatch?access_token='.$this->access;
        return json_decode($this->weCurl($url,$datas,'POST'),true);
    }
    /*
     * 获取自定义菜单配置
     *
     * @access public
     * */
    public function cgi_getMenuInfo(){
        $url = 'https://api.weixin.qq.com/cgi-bin/get_current_selfmenu_info?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 用户同意授权，获取code
     * @access public
     * @param boolean $scope 是否获取用户信息
     * @param String $state 回调所带参数
     * */
    public function oauth2_authorize($call_url,$scope=true,$state=''){
        $call_url = urlencode($call_url);
        $str_scope = '';
        if($scope){
            $str_scope = 'snsapi_userinfo';
        }else{
            $str_scope = 'snsapi_base';
        }
        $url = 'https://open.weixin.qq.com/connect/oauth2/authorize?appid='.$this->appid.'&redirect_uri='.$call_url.'&response_type=code&scope='.$str_scope.'&state='.$state.'#wechat_redirect';

        return $url;
    }
    /*
     * 通过code换取网页授权access_token
     *
     * @access public
     * */
    public function oauth2_access(){
        $url = 'https://api.weixin.qq.com/sns/oauth2/access_token?appid='.$this->appid.'&secret='.$this->secret.'&code='.(empty($_GET['code'])?'':$_GET['code']).'&grant_type=authorization_code';
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 刷新access_token（如果需要）
     *
     * @access public
     * @param String $refresh 为用户刷新access_token
     * */
    public function oauth2_refresh($refresh){
        $url = 'https://api.weixin.qq.com/sns/oauth2/refresh_token?appid='.$this->appid.'&grant_type=refresh_token&refresh_token='.$refresh;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 拉取用户信息(需scope为 snsapi_userinfo)
     *
     * @access public
     * @param String $access 用户特殊的access_token
     * @param String $openid 用户的唯一标识
     * */
    public function oauth2_userinfo($access,$openid){
        $url = 'https://api.weixin.qq.com/sns/userinfo?access_token='.$access.'&openid='.$openid.'&lang=zh_CN';
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 检验授权凭证（access_token）是否有效
     * @access public
     * @param String $access 用户特殊的access_token
     * @param String $openid 用户的唯一标识
     * */
    public function oauth2_snsAccess($access,$openid){
        $url = 'https://api.weixin.qq.com/sns/auth?access_token='.$access.'&openid='.$openid;
        return json_decode($this->weCurl($url),true);
    }
    /*
     * 模板消息设置所属行业
     *
     * @access public
     * @param mix $data  {"industry_id1":"1","industry_id2":"4"}
     * */
    public function temp_setIndustry($data){
        $data = json_encode($data,JSON_UNESCAPED_UNICODE);
        $url = 'https://api.weixin.qq.com/cgi-bin/template/api_set_industry?access_token='.$this->access;
        return json_decode($this->weCurl($url,$data,'POST'),true);
    }
    /*
     * 模板消息获取设置的行业信息
     *
     * @access public
     * */
    public function temp_getIndustry(){
        $url = 'https://api.weixin.qq.com/cgi-bin/template/get_industry?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
    * 模板消息获得模板ID
    *
    * @access public
    * @param mix $data  {"template_id_short":"TM00015"}
    * */
    public function temp_addTemp($data){
        $data = json_encode($data,JSON_UNESCAPED_UNICODE);
        $url = 'https://api.weixin.qq.com/cgi-bin/template/api_add_template?access_token='.$this->access;
        return json_decode($this->weCurl($url,$data,'POST'),true);
    }
    /*
     * 模板消息获取模板列表
     *
     * @access public
     * */
    public function temp_allPrivateTemp(){
        $url = 'https://api.weixin.qq.com/cgi-bin/template/get_all_private_template?access_token='.$this->access;
        return json_decode($this->weCurl($url),true);
    }
    /*
    * 模板消息删除模板
    *
    * @access public
    * @param mix $data  {“template_id”=”Dyvp3-Ff0cnail_CDSzk1fIc6-9lOkxsQE7exTJbwUE”}
    * */
    public function temp_delPrivateTemp($data){
        $data = json_encode($data,JSON_UNESCAPED_UNICODE);
        $url = 'https://api,weixin.qq.com/cgi-bin/template/del_private_template?access_token='.$this->access;
        return json_decode($this->weCurl($url,$data,'POST'),true);
    }
    /*
     * 模板消息发送模板消息
     *
     * @access public
     * @param mix $data
     * {
           "touser":"OPENID",
           "template_id":"ngqIpbwh8bUfcSsECmogfXcV14J0tQlEpBO27izEYtY",
           "url":"http://weixin.qq.com/download",
           "data":{
                   "first": {
                       "value":"恭喜你购买成功！",
                       "color":"#173177"
                   },
                   "keynote1":{
                       "value":"巧克力",
                       "color":"#173177"
                   },
                   "keynote2": {
                       "value":"39.8元",
                       "color":"#173177"
                   },
                   "keynote3": {
                       "value":"2014年9月22日",
                       "color":"#173177"
                   },
                   "remark":{
                       "value":"欢迎再次购买！",
                       "color":"#173177"
                   }
           }
       }
    * */
    public function temp_send($data){
        $data = json_encode($data,JSON_UNESCAPED_UNICODE);
        $url = 'https://api.weixin.qq.com/cgi-bin/message/template/send?access_token='.$this->access;
        return json_decode($this->weCurl($url,$data,'POST'),true);
    }
    /*
     * 获取用户基本信息(UnionID机制)
     * */
    public function cgi_userInfo($openid){
        $url = 'https://api.weixin.qq.com/cgi-bin/user/info?access_token='.$this->access.'&openid='.$openid.'&lang=zh_CN';
        return json_decode($this->weCurl($url),true);
    }
    /*
         * 自定义curl方法
         *
         * @access private
         * @url String $url 链接
         * @param String $datas 链接数据
         * @param String $type=['POST','GET']
         * */
    private function weCurl($url,$datas='',$type = 'GET'){
        $ch = curl_init();
        $type = strtoupper($type);

        curl_setopt($ch,CURLOPT_URL,$url);
        curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
        if($type == 'POST'){
            curl_setopt($ch,CURLOPT_POST,true);
            curl_setopt($ch,CURLOPT_POSTFIELDS,$datas);
        }

        //设置超时
//		curl_setopt($ch, CURLOPT_TIMEOUT, $this->curl_timeout);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER,FALSE);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST,FALSE);
        curl_setopt($ch, CURLOPT_HEADER, FALSE);

        //运行curl，结果以jason形式返回
        $result = curl_exec($ch);
        curl_close($ch);
        return $result;
    }


}
