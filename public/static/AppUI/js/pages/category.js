/*
 *  Document   : category.js
 *  Author     : pixelcave
 *  Description: 商品分类交互配置js
 */

var Category = function() {
    var category_layer = function () {
        var html = "<option value='0'>顶级分类</option>";
        var data = {pid:0};
        var pid_1 = $('#pid_1');
        if(pid_1.length <=0){
            return false;
        }
        $.get(category_url,data,function (result) {
            if(!result){
                return false ;
            }
            for(var i in result ){
                html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
            }
            pid_1.html(html)
                .on('change',function () {
                var html = "<option value=''>请选择商品分类</option>";
                var pid = $(this).val();
                pid = pid != 0?pid:'';
                var data = {pid:pid};
                $.get(category_url,data,function (result) {
                    for(var i in result ){
                        html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
                    }
                    $('#pid_2').html(html);
                });
            });
        });
    };
    var fold = function () {
        $('.sign').on('click',function () {
            var _this = $(this),pid = _this.data('id'),layer=_this.data('layer');
            layer += 1;
            if(_this.hasClass('fa-plus')){
                $('.parent_'+layer +'_'+pid).removeClass('hide');
                _this.addClass('fa-minus').removeClass('fa-plus');
            }else{
                _this.addClass('fa-plus').removeClass('fa-minus');

                $('.parent_'+layer +'_'+pid).addClass('hide')
                    .each(function () {
                        var sign = $(this).find('.sign');
                        var pid = sign.data('id'),layer=sign.data('layer');
                        layer +=1;
                        $('.parent_'+layer +'_'+pid).addClass('hide').removeClass('fa-minus');
                        sign.addClass('fa-plus').removeClass('fa-minus');
                    });

            }
        });
    };
    return {
        init: function() {
            fold();
        },
        category : function () {
            category_layer();
        }
    };
}();