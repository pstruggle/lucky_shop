/*
 *  Document   : category.js
 *  Author     : pixelcave
 *  Description: 商品分类交互配置js
 */

var Brand = function() {
    var p1change = function (pid,select) {
        var html = '';
        if(pid === ''){
            html += "<option value=''>请选择分类</option>";
            pid = 0;
        }
        var data = {pid:pid};
        $.ajaxSetup({async:false});
        $.get(category_url,data,function (result) {
            for( var i in result ){
                var sele = '';
                if(select == result[i].id){
                    sele = 'selected ="selected"';
                }
                html += "<option value='"+result[i].id+"' "+sele+">"+result[i].name+"</option>";
            }
        });
        return html;
    };
    // 编辑分类类目的值
    var category_layer = function () {
        var top_cat_id = $('#top_cat_id'),parent_cat_id = $('#parent_cat_id'),cat_id = $('#cat_id');
        var pid_1 = top_cat_id.data('val'),pid_2 = parent_cat_id.data('val'),pid_3 = cat_id.data('val');
        if(parent_cat_id.length <=0){
            return false;
        }

        var selP = function () {
            top_cat_id.html(p1change('',pid_1));
            selC();
        };
        var selC = function () {
            var id = top_cat_id.val();
            parent_cat_id.html(p1change(id,pid_2));
            selA();
        };
        var selA = function () {
            var id = parent_cat_id.val();
            cat_id.html(p1change(id,pid_3));
        };
        top_cat_id.on('change',selC);
        parent_cat_id.on('change',selA);
        selP();
    };

    // 编辑已有分类跳转
    var edit = function () {
        $('.edit').on('click',function () {
            var id = $(this).data('id');
            var edit_url = $('.edit_view').attr('href');
            location.href = edit_url + '?id=' + id;
        });
    };
    return {
        init: function() {
            edit(); // 编辑跳转
        },
        category : function () {
            category_layer(); // 分类层级的
        }
    };
}();