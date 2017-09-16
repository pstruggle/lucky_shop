<?php
namespace app\merchant\controller;

use app\merchant\controller\Base;
use think\Db;
use think\Log;


class Tourism extends Base
{
    private $_destination;
    private $_setout;
    private $_line;
    private $_trip;
    private $_offer;
    private $_shop;
    private $_safe;
    private $_contract;
    public function _initialize()
    {
        parent::_initialize(); // TODO: Change the autogenerated stub
        $this->_destination = model('destination');
        $this->_setout = model('setout');
        $this->_line = model('_line');
        $this->_trip = model('trip');
        $this->_offer = model('offer');
        $this->_shop = model('shop');
        $this->_safe = model('safe');
        $this->_contract = model('contract');
    }
    // 目的地列表
    public function destination()
    {
        $status = input('status');
        if(isset($status)){
            $where['d.mid'] = $this->merchant['id'];
            $where['d.status'] = $status;
            $dests = $this->_destination->getDestination($where);
            $this->assign([
                'dests'=> $dests,
                'page'=> ''
            ]);
        }else{
            $style = input('style');
            $where['d.status'] = empty($status)?'2':$status;
            $where['d.style'] = empty($style)?'1':$style;
            $order = ['d.style'=>'desc','addtime'=>'desc'];
            $destinations = $this->_destination->getFormatD($where,$order);
            $this->assign([
                'destinations'=> $destinations,
                'page'=> ''
            ]);
        }
        $this->assign([
            'title'=> '目的地列表',

        ]);
        return $this->template();
    }
    //目的地添加
    public function dest_edit()
    {
        $act = 'add';
        $where = ['d.status'=>'2'];
        $destinations = $this->_destination->getFormatD($where);
        $did = input('did');
        if(!empty($did)){
            $act = 'update';
            $d_where = ['status'=>'2','id'=>input('did')];
            $dest = $this->_destination->where($d_where)->find();
            $this->assign([
                'dest' => $dest,
            ]);
        }
        $this->assign([
            'title'=> '目的地的添加修改',
            'act' => $act,
            'destinations'=> $destinations,
        ]);
        return $this->template();
    }
    //出发地列表
    public function setout()
    {
        $status = input('status');
        $status = $status =='0' || !empty($status)?input('status'):'2';
        $where = ['s.status'=>$status];
        if($status == '0'){
            $where['mid'] = $this->merchant['id'];
        }
        if(input('setout')){
            $where['setout'] = ['like','%'.input('setout').'%'];
        }
        $setouts = $this->_setout->getSetout($where);
        $this->assign([
            'title'=> '出发地列表',
            'setouts'=> $setouts,
            'page'=> '',
        ]);
        return $this->template();
    }
    //出发地添加
    public function setout_edit(){
        $sid = input('sid');
        $act = 'add';
        if(!empty($sid)){
            $act = 'update';
            $where = ['id'=>$sid,'status'=>'0'];
            $setout = $this->_setout->where($where)->find();
            if(!$setout){
                $act = 'add';
            }else{
                $this->assign('setout',$setout);
            }
        }
        $this->assign([
            'title'=> '出发地添加',
            'act'=> $act,
        ]);
        return $this->template();
    }
    // 行程列表
    public function trip(){
        $where = ['t.mid'=>$this->merchant['id']];
        if(input('status')==='0' || input('status')){
            $where['t.status'] = input('status');
        }
        if(input('setout')){
            $where['t.set_id'] = input('setout');
        }
        if(input('destination')){
            $where['FIND_IN_SET('.input('destination').',l.desid)'] = ['notin',''];
        }
        if(input('title')){
            $where['t.title'] = ['like','%'.input('title').'%'];
        }
        if(input('m_name')){
            $where['t.supplier'] = ['like','%'.input('m_name').'%'];
        }
        if(input('valid')){
            if(input('valid') == '1'){
                $where['t.after_date'] = ['>=',date('Ymd')];
            }elseif(input('valid') == '2'){
                $where['t.after_date'] = ['<',date('Ymd')];
            }
        }
        $trips = $this->_trip->getTrips($where,['t.addtime'=>'desc','t.id'=>'desc']);
        $page = $trips->render();
        //出发地
        $s_where = ['status' => 2];
        $setouts = $this->_setout->where($s_where)->select();
        //目的地
        $d_where = ['d.status'=>'2'];
        $destinations = $this->_destination->getFormatD($d_where);
        $this->assign([
            'title'=> '行程列表',
            'trips'=> $trips,
            'page'=> $page,
            'destinations'=> $destinations,
            'setouts'=> $setouts,
            ]);
        return $this->template();
    }
    // 行程编辑
    public function trip_edit(){
        $tripid = input('trip');
        $act = 'add';
        if(!empty($tripid)){
            $act = 'update';
            $where = ['id'=>$tripid,'mid'=>$this->merchant['id']];
            $trip = $this->_trip->where($where)->find();
            $line_where = ['id'=>$trip['lid'],'mid'=>$this->merchant['id']];
            $line = $this->_line->where($line_where)->find();
            $this->assign([
                'trip'=>$trip,
                'line'=>$line,
                'tripid'=>$tripid
            ]);
        }
        $papers = Db::table('ly_paper')->select();
        $safe_where = [];
        $safes = $this->_safe->where($safe_where)->select();
        $setout_where = ['status'=>2];
        $setouts = $this->_setout->where($setout_where)->select();
        $this->assign([
            'title'=> '行程编辑',
            'safes'=>$safes,
            'act'=> $act,
            'setouts'=> $setouts,
            'papers'=> $papers,
        ]);
        return $this->template();
    }
    // 线路列表
    public function line(){
        $where = ['l.mid'=>$this->merchant['id']];
        if(input('name')){
            $where['l.name'] = ['like','%'.input('name').'%'];
        }
        if(input('destination')){
            $where['FIND_IN_SET('.input('destination').',l.desid)'] = ['notin',''];
        }

        $lines = $this->_line->getLines($where,['l.addtime'=>'desc','l.id'=>'desc']);
        $page = $lines->render();
        //目的地
        $d_where = ['d.status'=>'2'];
        $destinations = $this->_destination->getFormatD($d_where);
        $this->assign([
            'title'=> '线路列表',
            'lines'=> $lines,
            'page'=> $page,
            'destinations'=> $destinations,
        ]);
        return $this->template();
    }
    // 订单列表
    public function orders(){
        $where = ['s.pay_status'=>['>',0]];
        $pay_status = input('pay_status');
        $uid = input('uid');
        $confirm = input('confirm');
        $outstart = input('outstart');
        $outend = input('outend');
        $where['s.mid'] = $this->merchant['id'];
        if(!empty($pay_status)){
            $where['s.pay_status'] = $pay_status;
        }
        if(!empty($uid)){
            $where['s.uid'] = $uid;
        }
        if(!empty($confirm)){
            $where['s.confirm'] = $confirm;
        }
        if(!empty($outstart)){
            $where['outtime'][] = ['>=',strtotime($outstart)];
        }
        if(!empty($outend)){
            $where['outtime'][] = ['<=',strtotime($outend)];
        }
//        dump($where);
//        $shops = $this->_shop->getShops($where);
        $shops = $this->_shop->getShopOps($where);

        $page = $shops->render();
        $this->assign([
            'title'=> '旅游订单列表',
            'shops'=> $shops,
            'page'=> $page,
        ]);
        return $this->template();

    }
    // 订单查看
    public function eye_order(){
        $oid = input('oid');
        $where = ['s.id'=>$oid];
        $orders = $this->_shop->getShops($where);
        if(!empty($orders)){
            $order = $orders[0];
            $s_where = ['key'=>['in', $order['safes']]];
            $safes =  Db::table('ly_safe')->where($s_where)->select();
            $offer = json_decode($order['offer'],true);
            $where = [ ['id'=>['in',$order['people'] ] ],['style'=>['in',$order['papers'] ] ] ];
            $travels = model('people')->peoples($where);
//            dump($order['offer_type']);
            $this->assign([
                'order'=>$order,
                'safes'=>$safes,
                'travels' => $travels,
                'offer' => $offer
            ]);
        }else{
            $this->error('您的订单不存在');
        }
        $this->assign([
            'title'=> '旅游订单列表',
//            'shops'=> $shops,
//            'page'=> $page,
        ]);
        return $this->template();
    }
    //订单编辑
    public function editshop(){
        $id = input('id');
        $where = ['id'=>$id,'mid'=>$this->merchant['id']];
        $map = [];
        if(input('confirm')){
            $map['confirm'] = input('confirm');
        }
        $shop = Db::table('ly_shop')->where($where)->find();
        if($shop['pay_status'] != '2'){
            $this->error('该订单未支付，不能操作');
            return ;
        }
        $result = Db::table('ly_shop')->where($where)->update($map);
        if($result){
            $trip = Db::table('ly_trip')->where(['id'=>$shop['tid']])->find();
            if($trip){
                $aliyun = controller('api/Aliyun');
                $data = [];
                $infos = Db::table('ww_apply')->where('uid',$shop['uid'])->field(['name','phone'])->find();

                $data['recNum'] = $infos['phone'];
                if($map['confirm'] == '2'){
                    $data['temp'] = 'sms_refuse';
                    $data['param'] = [$infos['name'],$trip['title'],'已确认','供应商'];
//                    $get = model('get');
//                    $g_result = $get->upper($shop,'ly');
                    $send_result = $aliyun->ajax_send($data);
                    Log::write('send log :'.json_encode($send_result,JSON_UNESCAPED_UNICODE));
                }elseif($map['confirm'] == '3'){
                    $data['temp'] = 'sms_refuse';
                    $data['param'] = [$infos['name'],$trip['title'],'被拒绝,将在三天内退 款给您。','供应商'];
                    if($shop['payment'] == 3){
                        model('play')->addPlay($shop,$map['confirm']);
                        Db::table('ww_userinfo')->where('id',$shop['uid'])->setInc('balance',$shop['sumprice']);
                        model('bill')->add_bill($shop);
                    }else{
                        $wepay = controller('api/Wepay');
                        if(empty($shop['refund_on'])){
                            $refund_on = getCache('wechat')['mch_id'].date("YmdHis");
                            $r_map = ['refund_on'=>$refund_on,'refund_time'=>time()];
                            Db::table('ly_shop')->where($where)->update($r_map);
                        }else{
                            $refund_on = $shop['refund_on'];
                        }
                        $price = (int) ($shop['sumprice'] * 100);
                        $result_wepay = $wepay->refund('',$shop['onumber'],$price,$price,$refund_on);
                        if($result_wepay['return_code'] == 'SUCCESS' && $result_wepay['result_code'] == 'SUCCESS'){
                            model('bill')->add_bill($shop);
                        }else{
                            Log::write('send log :'.json_encode($result_wepay,JSON_UNESCAPED_UNICODE));
                        }
                    }

                    $send_result = $aliyun->ajax_send($data);
                    Log::write('send log :'.json_encode($send_result,JSON_UNESCAPED_UNICODE));

                }

            }

            $this->success('编辑成功');
        }else{
            $this->error('编辑失败');

        }
    }
    // 旅游保险
    public function safe(){
        $s_where = ['mid'=>$this->merchant['id']];
        $title = input('title');
        $key = input('key');
        if($title){
            $s_where['title'] = ['like','%'.$title.'%'];
        }
        if ($key){
            $s_where['key'] = ['like','%'.$key.'%'];
        }
        $safes = $this->_safe->getSafes($s_where);
        $page = $safes->render();
        $this->assign([
            'title'=> '旅游保险列表',
            'safes'=> $safes,
            'page'=> $page,
        ]);
        return $this->template();
    }
    // 旅游保险编辑页面
    public function safe_edit(){
        $id = input('id');
        $act = 'add';
        if(!empty($id)){
            $act = 'update';
            $s_where = ['id'=>$id,'mid'=>$this->merchant['id']];
            $safe = $this->_safe->where($s_where)->find();
            if(empty($safe)){
                $this->error('您要编辑的保险不存在！');
            }
            $this->assign([
                'safe'=> $safe,
            ]);
        }
        $this->assign([
            'title'=> '旅游保险列表',
            'act'=> $act,
        ]);
        return $this->template();
    }
    // 保险编辑操作
    public function safeedit(){
        $act = input('act');
        $map = [
            'key'=>input('key'),
            'desc'=>input('desc'),
            'title' => input('title'),
            'price' => input('price'),
            'mid'=> $this->merchant['id'],
            'must' => input('must')
        ];
        switch ($act){
            case 'add':
                $map['addtime'] = time();
                $result = $this->_safe->insert($map);
                break;
            case 'update':
                $c_where = ['id'=>input('id'),'mid'=>$this->merchant['id']];
                $result = $this->_safe->where($c_where)->update($map);
                break;
            default :
                return $this->error('未知操作');
                break;
        }
        if($result){
            $this->success('编辑成功',url('Tourism/safe'));
        }else{
            $this->error('编辑失败');
        }
    }

    // 旅游合同
    public function contract(){
        $c_where = ['mid'=>$this->merchant['id']];
        $title = input('title');
        $key = input('key');
        if($title){
            $c_where['title'] = ['like','%'.$title.'%'];
        }
        if ($key){
            $c_where['key'] = ['like','%'.$key.'%'];
        }
        $contracts = $this->_contract->getContracts($c_where);
        $page = $contracts->render();
        $this->assign([
            'title'=> '旅游保险列表',
            'contracts'=> $contracts,
            'page'=> $page,
        ]);
        return $this->template();
    }
    // 旅游合同添加
    public function contract_edit(){
        $id = input('id');
        $act = 'add';
        if(!empty($id)){
            $act = 'update';
            $c_where = ['id'=>$id,'mid'=>$this->merchant['id']];
            $contract = $this->_contract->where($c_where)->find();
            if(empty($contract)){
                $this->error('您要编辑的合同不存在！');
            }
            $this->assign([
                'contract'=> $contract,
            ]);
        }
        $this->assign([
            'title'=> '旅游保险列表',
            'act' => $act
        ]);
        return $this->template();
    }
    // 合同编辑操作
    public function contractedit(){
        $act = input('act');
        switch ($act){
            case 'add':
                $map = [
                    'key'=>input('key'),
                    'content'=>input('content'),
                    'title' => input('title'),
                    'mid'=> $this->merchant['id'],
                    'addtime'=>time()
                ];
                $result = $this->_contract->insert($map);
                break;
            case 'update':
                $map = [
                    'key'=>input('key'),
                    'content'=>input('content'),
                    'title' => input('title'),
                    'mid'=> $this->merchant['id'],
                ];
                $c_where = ['id'=>input('id'),'mid'=>$this->merchant['id']];
                $result = $this->_contract->where($c_where)->update($map);
                break;
            default :
                return $this->error('未知操作');
                break;
        }
        if($result){
            $this->success('编辑成功',url('Tourism/contract'));
        }else{
            $this->error('编辑成功');
        }
    }
    // 线路编辑
    public function line_edit(){
        $lineid = input('line');
        $destid = input('dest');
        $act = 'add';
        if(!empty($lineid)){
            $act = 'update';
            $where = ['id'=>$lineid,'mid'=>$this->merchant['id']];
            $line = $this->_line->where($where)->find();
            $this->assign([
                'line'=>$line,
                'lineid'=>$lineid
            ]);
        }else{
            if(!empty($destid)){
                $dest_where = ['id'=>$destid];
                $dest = $this->_destination->where($dest_where)->find();
                $this->assign('dest',$dest);
            }
        }
        $this->assign([
            'title'=> '线路添加（修改）',
            'act'=> $act,
        ]);
        return $this->template();
    }
    // 目的对添加操作
    public function destedit(){
        $act = input('act');
        $map = [
            'mid' => $this->merchant['id'],
            'destination'=>input('destination')?input('destination'):'',
            'pid'=>input('pid')?input('pid'):'0',
            'status'=>'2',
            'style'=>input('style'),
            'weight'=>0,
            'addtime'=>time()
        ];
        $map['letter'] = getFirstCharter($map['destination'])?getFirstCharter($map['destination']):'';
        $ok=new \ChineseSpell();
        $s1 = iconv('UTF-8', 'gb2312', $map['destination']);
        $map['pinyin'] = $ok->getChineseSpells($s1)?$ok->getChineseSpells($s1):'';
        if($act == 'add'){
            $value = $this->_destination->where('destination',$map['destination'])->value('id');
            if(!empty($value)){
                $this->error('该目的地已经存在。');
            }
            $result = $this->_destination->save($map);
        }else{
            $where = ['id'=>input('did')];
            $result = $this->_destination->save($map,$where);

        }

        if($result){
            $this->success('编辑成功。',url('Tourism/destination'));
        }
        $this->error('编辑失败');
    }
    // 出发地添加操作
    public function setoutedit(){
        $act = input('act');
        $map = [
            'mid' => $this->merchant['id'],
            'setout'=> input('setout'),
            'status'=> '2',
            'weight'=> 0,
            'addtime'=> time()
        ];
        if($act == 'add'){
            $value = $this->_setout->where('setout',$map['setout'])->value('id');
            if(!empty($value)){
                $this->error('该出发地已经存在。');
            }
            $result = $this->_setout->save($map);
        }else{
            $sid = input('sid');
            $where = ['id'=>$sid];
            $result = $this->_setout->save($map,$where);
        }

        if($result){
            $this->success('编辑成功，请等待审核！',url('Tourism/setout'));
        }
        $this->error('编辑失败');
    }
    // 线路操作
    public function lineedit(){
        $act = input('act') ? input('act'): 'add';
        $lineid = input('line');
        $map =[
            'mid' => $this->merchant['id'],
            'name' => input('line_name')?input('line_name'):'',
            'recommend' => input('recommend')?input('recommend'):'',
            'feature' => input('feature')?input('feature'):'',
            'src' => input('src')?input('src'):'',
            'contain' => input('contain')?input('contain'):'',
            'notcontain' => input('notcontain')?input('notcontain'):'',
            'notice' => input('notice')?input('notice'):'',
            'reminder' => input('reminder')?input('reminder'):'',
            'edittime' => time(),
            'type' => input('type')?input('type'):'0',
            'style' => input('exit_type')?input('exit_type'):'1',
            'visas' => input('visas')?input('visas'):'',
        ];
        if(empty($map['src'])){
            $this->error('您没有上传线路图片');
        }
        if ($map['type'] == '0'){
            $thread = input('trip/a');
            $map['days'] = count($thread);

//            $map['thread'] = htmlentities(json_encode($thread,JSON_UNESCAPED_UNICODE));
            $map['thread'] = json_encode($thread,JSON_UNESCAPED_UNICODE);
        }else{
            $map['simple'] = input('simple');
        }

        $desid = input('destination/a');
        $map['desid'] = implode(',',$desid);
        $destination = input('desttext/a');
        $map['destination'] = implode(',',$destination);
        $purchase = input('purchase/a');
        $purchase = empty($purchase) ? []: $purchase;
        $map['purchase'] = json_encode($purchase,JSON_UNESCAPED_UNICODE);
        if($act == 'add'){
            $map['addtime'] = time();
            $result = $this->_line->save($map);
        }else{
            $where = ['id'=> $lineid,'mid'=>$this->merchant['id']];
            $result = $this->_line->save($map,$where);
        }
        if($result){
            $this->success('编辑成功',url('Tourism/line'));
        }
        $this->error('编辑失败');
    }
    //线路删除
    public function linedel(){
        $lineid = input('line');
        $where = ['id'=>$lineid,'mid'=>$this->merchant['id']];
        $result = $this->_line->where($where)->delete();
        if($result){
            $this->success('编辑成功',url('Tourism/line'));
        }
        $this->error('编辑失败');
    }
    //行程操作
    public function tripedit(){
        $act = input('act');
        $tripid = input('trip');
        $prices = [-1,-1];
        $balance = [-1,-1];
        $map = [
            'mid'=>$this->merchant['id'],
            'title'=> input('title')?input('title'):'',
            'set_id'=> input('setout')?input('setout'):"",
            'desc'=> input('desc')?input('desc'):'',
            'tags'=>input('tags/a'),
            'theme' => input('theme/a'),
            'single' => input('single')?input('single'):'',
            'supplier_phone' => input('supplier_phone')?input('supplier_phone'):'',
            'supplier' => input('supplier')?input('supplier'):'',
            'poster' => input('poster')?input('poster'):'',
            'onum'=>input('onum')?input('onum'):"",
            'promotion' => input('promotion')?input('promotion'):'0',
            'minprice' => input('minprice')?input('minprice'):'0',
            'maxprice'=>input('maxprice')?input('maxprice'):'0',
            'offer_type'=>input('mode')?input('mode'):"1",
            'lid'=>input('lines')?input('lines'):"",
            'style'=>input('style')?input('style'):'1',
            'type'=>input('exit_type')?input('exit_type'):'1',
            'play' => input('play')?input('play'):'0',
            'contract' => input('contract')?input('contract'):'0',
            'flick_status' => 1,
            'flick' => 0,
            'apply_flick' => input('flick')?input('flick'):'0',
        ];
        $map['offer'] = $map['offer_type']=='2'?
            (input('dayspay_mode2')?input('dayspay_mode2'):""):
            (input('dayspay')?input('dayspay'):"");
        $offers = json_decode($map['offer'],true);
        if(empty($offers)){
            $this->error('请设置行程报价信息');
        }
        $dates = [-1, -1];
        foreach ($offers as $k => $v) {
            $dates = min_max($dates, $k);
            if ($map['offer_type'] == '2') {
                $prices = min_max($prices, $v[0]['market']);
                $balance = min_max($balance,$v[0]['balance']);
            } else {
                $prices = min_max($prices, $v['adult']);
                $balance = min_max($balance,$v['adult_balance']);
            }
        }
        $map['ago_date'] = $dates[0];
        $map['after_date'] = $dates[1];

        $map['minprice'] = $prices[0];
        $map['maxprice'] = $prices[1];
        $map['min_balance'] = $balance[0];
        $map['max_balance'] = $balance[1];
        $map['setout'] = Db::table('ly_setout')->where(['id'=>$map['set_id']])->value('setout');
        if(empty($map['title'])){
            $this->error('请输入行程标题');
        }
        if(empty($map['setout'])){
            $this->error('请选择行程出发地');
        }
        $papers = input('papers/a');
        if(empty($papers)){
            $this->error('请选择证件');
        }
        $map['papers'] = implode(',',$papers);
        $pics = input('pics/a');
        if(empty($pics)){
            $this->error('请上传线路图片');
        }
        $map['pic'] = $pics[0];
        $map['pics'] = implode(',',$pics);
        $safes = input('safe/a');
        if(empty($safes)){
            $map['safe'] = '';
        }else{
            $map['safe'] = implode(',',$safes);
        }
        if($map['safe']){
            $map['issafe'] = '1';
        }else{
            $map['issafe'] = '0';
        }

        if(is_array($map['tags'])){
            $map['tags'] = implode(',',$map['tags']);
        }else{
            $map['tags'] = '';
        }
        if(is_array($map['theme'])){
            $map['theme'] = implode(',',$map['theme']);
        }else{
            $map['theme'] = '';
        }
        if(empty($map['lid'])){
            $this->error('请为行程选择线路');
        }
        if($act == 'add'){
            $map['addtime'] = time();
            $map['status'] = '1';
            $result = $this->_trip->save($map);
            $tid = $this->_trip->id;
        }else{
            $tid = $tripid;
            $where = ['id'=> $tripid,'mid'=>$this->merchant['id']];
            $result = $this->_trip->save($map,$where);
        }
        if($result){
//            if(isset($map['status']) && $map['status'] == '1'){
//                $aliyun = controller('api/Aliyun');
//                $data = [];
//                $data['recNum'] = getCache('basic')['operator'];
//                $data['param'] = [];
//                $data['temp'] = 'sms_wait_auditor';
//                $result = $aliyun->ajax_send($data);
//            }
            $this->_offer->addOffer($offers,$tid);
            return $this->success('编辑成功',url('Tourism/trip'));
        }
         return $this->error('编辑失败');
    }
    //线路删除
    public function tripdel(){
        $tripid = input('trip');
        $where = ['id'=>$tripid,'mid'=>$this->merchant['id']];
        $result = $this->_trip->where($where)->delete();
        if($result){
            $this->success('编辑成功',url('Tourism/trip'));
        }
        $this->error('编辑失败');
    }

    //异步获取的目的地
    public function ajax_dest(){
        $where = ['d.status'=>'2'];
        $exit = input('exit');
        if(!empty($exit)){
            $where['style'] = $exit;
        }
        $dests = $this->_destination->getFormatD($where);
        return json_encode($dests,JSON_UNESCAPED_UNICODE);
    }
    // 异步获取线路
    public function ajax_line(){
        $where = ['l.mid'=>$this->merchant['id']];
        $exit = input('exit');
        if(!empty($exit)){
            $where['l.style'] = $exit;
        }
        $lines = $this->_line->getLines($where,['l.addtime'=>'desc'],20);
        return json_encode($lines,JSON_UNESCAPED_UNICODE);
    }
    // 申请特价甩尾
    public function flick(){
        $tid = input('trip');
        $where = ['id'=>$tid,'mid'=>$this->merchant['id']];
        $trip = $this->_trip->where($where)->find();
        if(empty($trip)){
            return $this->error('行程不存在');
        }
        $f_where = ['tid'=>$tid];
        $flick = Db::table('ly_trip_flick')->where($f_where)->find();

        $this->assign([
            'title'=> '特价甩尾申请',
            'trip'=> $trip,
            'flick' => $flick
        ]);
        return $this->template();
    }
    // 特价甩尾申请
    public function flickedit(){
        dump(input());
        $trip = input('trip');
        $where = ['tid'=>$trip];
        $time = time();
        $flick = Db::table('ly_trip_flick')->where($where)->find();
        $map = [
            'tid'=>$trip,
            'sale'=>input('sale')?input('sale'):'',
            'desc' => input('desc')?input('desc'):'',
            'modtime' => $time,
            'status' => '1',
        ];
        if(empty($flick)){
            $map['second'] = 1;
            $map['addtime'] = $time;
            $result = Db::table('ly_trip_flick')->insert($map);
        }else{
            $map['second'] = $flick['second'] + 1 ;
            $result = Db::table('ly_trip_flick')->where($where)->update($map);
        }
        if($result){
            return $this->success('编辑成功');
        }else{
            return $this->error('编辑失败');
        }

    }
}