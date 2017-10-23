<?php
namespace app\common\model;


use think\Db;

class Ad extends Base{
    protected $resultSetType = 'collection';
    protected function initialize(){
        parent::initialize(); // TODO: Change the autogenerated stub
    }
    // 缓存广告
    public function setCache(){
        $name = lcfirst($this->name);
        $positions = Db::name('ad_position')->select();
        $time = time();
        foreach ($positions as $position){
            $where = [
                'start_time' => ['<=',$time],
                'end_time' => ['>=',$time],
                'position'=>$position['id'],
                'is_show'=>1
            ];
            $ads = $this->where($where)->order('weight','desc')->select()->toArray();
            get_cache($name.'.'.$position['mark'],$ads);
        }
    }
    // 广告位置编辑页面
    public function position(){
        $id = input('id');
        $position = Db::name('ad_position')->where('id',$id)->find();
        $result = ['title' => '广告位置列表'];
        if (!empty($position)){
            $result['position'] = $position;
        }
        return $result;
    }
    // 广告位置编辑操作
    public function position_edit($data){
        $data['addtime'] = time();
        if(!empty($data['id'])){
            $where = ['id'=>$data['id']];
            $result = Db::name('ad_position')->where($where)->update($data);
        }else{
            $result = Db::name('ad_position')->insert($data);
        }
        return $result;
    }
    // 广告位列表
    public function position_list(){
        $positions = Db::name('ad_position')->paginate(10);
        $page = $positions->render();
        $result = [
            'title'=>'广告位置列表',
            'positions'=>$positions,
            'page'=>$page,
        ];
        return $result;
    }
    // 广告列表获取
    public function ad_list(){
        $position = input('position');
        $where = [];
        if (!empty($position)){
            $where['p.mark'] = $position;
        }
        $join = [
            ['ad_position p','p.id=a.position']
        ];
        $field = ['a.*','p.position_name'];
        $ads = $this->alias('a')->join($join)->where($where)->field($field)->paginate(20);
        $assign = [
            'ads' => $ads,
            'title' => '广告列表'
        ];
        return $assign;
    }
    // 广告编辑页面
    public function ad(){
        $position = input('position');
        $p = Db::name('ad_position')->where('mark',$position)->value('id');
        if(empty($p)){
            $this->error = '广告位置不存在';
            return false;
        }
        $assign = [
            'p' => $p,
            'title' => '广告列表'
        ];
        $id = input('id');
        $where = [];
        if (!empty($id)){
            $where['id'] = $id;
            $ad = $this->where($where)->find();
            $assign['ad'] = $ad;
        }
        return $assign;
    }
    // 广告编辑操作
    public function ad_edit($data){
        $data['addtime'] = time();
        $data['start_time'] = strtotime($data['start_time']);
        $data['end_time'] = strtotime($data['end_time']);
        $where = [];
        if(!empty($data['id'])){
            $where = ['id'=>$data['id']];
        }
        $result = $this->save($data,$where);
        $this->setCache();
        return $result;
    }

}