/*
 *  Document   : category.js
 *  Author     : pixelcave
 *  Description: 商品分类交互配置js
 */

var Brand = function() {
    var p1change = function (id) {
        var html = "<option value=''>请选择分类</option>";

        var pid = id != 0 ? id :'';
        var data = {pid:pid};
        $.get(category_url,data,function (result) {
            for(var i in result ){
                html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
            }
            $('#pid_2').html(html);
        });
    };
    // 编辑分类类目的值
    var category_layer = function () {
        var html = "<option value='0'>请选择分类</option>";
        var data = {pid:0};
        var pid_1 = $('#pid_1');
        if(pid_1.length <=0){
            return false;
        }
        $.ajaxSetup({
            async:false
        });
        $.get(category_url,data,function (result) {
            if(!result){
                return false ;
            }
            for(var i in result ){
                html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
            }
            pid_1.html(html);
        });
        pid_1.on('change',function () {
            var id = $(this).val();
            p1change(id);
        })
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
            $('#pid_1').val(pid_1?pid_1:0);

            if(pid_1 != '0' && pid_1 != '' ){
                p1change(pid_1);
                if(pid_2 != 0){
                    $('#pid_2').val(pid_2);
                }
            }
        }
    };
}();