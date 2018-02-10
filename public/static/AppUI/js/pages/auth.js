/**
 * 权限管理js auth.js
 *
 *
 *
 */

var Auth = function () {
    var href = "/admin/auth/grant.html";
    // 列表处打开权限设置
    var grant = function () {
        var id = $(this).data('id');
        var href_item = href+'?id='+id;
        //iframe窗
        layer.open({
            type: 2,
            title: '赋予权限',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['80%', '60%'],
            content: href_item,
            cancel: function(){
                //右上角关闭回调
                return true; // 开启该代码可禁止点击该按钮关闭
            }
        });
    };
    // 权限视图
    var grant_view = function () {
        var id = $('input[name="id"]').val();
        var data = {id:id};
        var ul = $('ul.task-list');
        var li = $("<li></li>"),
            label = $("<label class='checkbox-inline'></label>"),
            input = $('<input type="checkbox" class="checks" />'),
            hint = $('<span class="label"></span>');
        var is_show = [
            {styles:'label-danger',txt:'隐藏'},
            {styles:'label-success',txt:'显示'}
            ];
        var auth_elem = $('#auths'),
        auths = auth_elem.val().split(',');
        $.post(href,data,function (results) {
            if (results.code==0){
                layer.msg(results.msg);
                return false;
            }
            var datas = results.data;
            for (var x in datas){
                var li_item =  li.clone(),
                    label_item = label.clone(),
                    input_item = input.clone(),
                    hint_item = hint.clone(),
                    in_x = '';
                var data = datas[x];
                input_item.data('id',data.id);
                if($.inArray(''+data.id,auths) != -1){
                    input_item.attr('checked',true);
                }
                label_item.append(input_item);
                label_item.append(data.title);
                if(data.layer !=0){
                    in_x = "in-"+data.layer+"x";
                }
                hint_item.addClass(is_show[data.is_show].styles);
                hint_item.text(is_show[data.is_show].txt);
                label_item.append(hint_item);
                li_item.addClass(in_x);
                li_item.append(label_item);
                ul.append(li_item)
            }
        });
        ul.on('change','.checks',function () {
            var ids = [];
            $('.checks:checked').each(function () {
                ids.push($(this).data('id'));
            });
            auth_elem.val(ids.join(','));
        });

    };
    // 显示用户角色选项
    var roles_select = function (id) {
        var data = {'group_id':id},
            href = '/admin/auth/roles',
            options = '';
        $.get(href,data,function (result) {
            options += "<option>请选择角色</option>";
            if (result.code == 1) {
                var data = result.data;
                for (var i in data) {
                    options += "<option value='" + data[i].id + "'>" + data[i].role_name + "</option>"
                }
            }else {
                layer.msg(result.msg);
            }
            $('#role_id').html(options)

        });
    };
    // 修改用户组的选项
    var groups_select = function () {
        var _this = $(this);
        var id = _this.val();
        roles_select(id);
        return true;
    };
    // 时间选择
    var jeDate_edit = function () {
        $.jeDate('#firstdate',{
        });
    };
    return {
        init:function () {
            $('.auths').on('click',grant);
        },
        grant_view:grant_view, // 权限选择视图
        admin_edit:function () {
            $('#group_id').on('change',groups_select);
            jeDate_edit()
        }
    }
}();