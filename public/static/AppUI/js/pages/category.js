/*
 *  Document   : category.js
 *  Author     : pixelcave
 *  Description: 商品分类交互配置js
 */

var Category = function() {
    var category_layer = function () {
        $('#pid_1').on('change',function () {
            var html = "<option value=''>请选择商品分类</option>";
            var pid = $(this).val();
            pid = pid != 0?pid:'';
            var data = {pid:pid};
            $.get(category_url,data,function (result) {
                if(!result){
                    return false ;
                }
                var datas = eval('('+result+')');
                console.log(datas);
                html += "<option value=''>请选择商品分类</option>";
            });
        });
    };
    return {
        init: function() {
            var html = "<option value='0'>顶级分类</option>";
            var data = {pid:0};
            $.get(category_url,data,function (result) {
                if(!result){
                    return false ;
                }
                console.log(result);

                html += "<option value=''>请选择商品分类</option>";
            });

        }
    };
}();