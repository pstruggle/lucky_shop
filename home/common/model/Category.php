<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/9/25
 * Time: 15:58
 */

namespace app\common\model;


class Category extends Base
{
    protected function initialize()
    {
        parent::initialize(); // TODO: Change the autogenerated stub
    }
    // 编辑操作
    public function edit($data){
        $map = [
            'name' => $data['name'],
            'mobile_name' => $data['mobile_name'],
            'is_show' => $data['is_show'],
            'weight' => $data['weight'],
            'image' => !empty($data['image'])?$data['image']:'',
        ];
        $map['pid'] = !empty($data['pid_2']) ? $data['pid_2'] : $data['pid_1'];
        $where = [];
        if(!empty($data['id'])){
            $where = ['id'=>$data['id']];
        }else{
            $map['addtime'] = time();
        }
        return $this->save($map,$where);
    }
    // 获取列表
    public function listing(){
        $categorys = $this->getCategory();
        $view = $this->category_view($categorys);
        $list = [
            'title' => '商品分类',
            'view' => $view,
        ];
        return $list;
    }
    // 编辑视图控制
    public function edit_view(){
        $id = input('id');
        $where = ['id'=>$id];
        $category = $this->where($where)->find();
        $value = [];
        if(!empty($category)){
            if($category['pid'] != 0){
                $pid = $this->where('id',$category['pid'])->value('pid');
                if($pid != 0){
                    $pid_1 = $pid;
                    $pid_2 = $category['pid'];
                }else{
                    $pid_1 = $category['pid'];
                    $pid_2 = '';
                }
            }else{
                $pid_1 = $category['pid'];
                $pid_2 = '';
            }
            $value['pid_1'] = $pid_1;
            $value['pid_2'] = $pid_2;
        }
        $value['title'] = '分类编辑';
        $value['category'] = $category;
        return $value;
    }

    // 获取分类
    public function getCategory($where=[],$order=[]){
        return $this->where($where)->order($order)->select();
    }

    // 递归分类
    public function category($pid = 0,$layer = 1,$w = []){
        $result = [];
        $where = array_merge(['pid'=>$pid],$w);
        $categorys = $this->getCategory($where);
        foreach ($categorys as $k => $category){
            $result[$k][] = $category;
            $result[$k][] = $this->category($category['id'],$layer+1,$w);
        }
        return $result;
    }
    // 分类列表视图
    public function category_view($categorys,$pid = 0,$layer = 1){
        $html = '';
        foreach ($categorys as $category){
            $date = date('Y-m-d H:i:s',$category['addtime']);
            if($pid != $category['pid']){
                continue;
            }
            $hide = '';
            if($layer != 1){
                $hide = 'hide';
            }
            $indent = str_pad(' ',$layer*$layer*6,'&nbsp;');
            if($layer != 3){
                $indent .= "<i class=\"fa fa-plus sign\" data-id='{$category['id']}' data-layer='$layer' ></i>";
            }
            $html .= "<tr class='$hide parent_{$layer}_{$category['pid']}'>
                        <td>$indent</td>
                        <td>
                            <a href=\"javascript:void(0)\" data-id=\"{$category['id']}\" title=\"编辑分类\" class=\"btn btn-effect-ripple btn-xs btn-success edit\">
                                <i class=\"fa fa-pencil\">
                                </i>
                            </a>
                        </td>
                        <td class='text-center'>{$category['id']}</td>
                        <td>{$category['name']}</td>
                        <td>{$category['mobile_name']}</td>
                        <td>{$category['is_show']}</td>
                        <td>{$category['weight']}</td>
                        <td>{$date}</td>
                    </tr>";
            $html .= $this->category_view($categorys,$category['id'],$layer+1);
        }
        return $html;
    }
}