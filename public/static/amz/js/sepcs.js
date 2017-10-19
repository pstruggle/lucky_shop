/**
 * Created by Administrator on 2017/10/19.
 */

var Specs = function () {
    var spec_group_url = "/index/Goods/spec_group.html";
    var specs = {};
    $.ajaxSetup({async:false});
    $.get(spec_group_url,{good_id:good_id},function (data) {
        specs = data;
    });
    // 前端判断组合是否有库存
    var spec_selected = function () {
        options.each(function (e) {
            var _this = $(this);
            var select = _this.find('li.selected');
            specs_select[e] = select.data("spec");
        });
        var s_len = specs_select.length;
        var un_len = un_count(specs_select);
        for(var x in specs){
            var result = specs[x].specs.split(',');
            if(un_len[0] >= s_len-1){
                var bidui = array_x(specs_select,result);
                if(bidui[0] == s_len-1){
                    if(specs[x].store_count == 0){
                        $("li[data-spec='"+result[bidui[1][0]]+"']").addClass('disabled');
                    } else {
                        $("li[data-spec='"+result[bidui[1][0]]+"']").removeClass('disabled');
                    }
                }else if(bidui[0] == s_len) {
                    $('.sys_item_price').text(specs[x].shop_price);
                    $('.sys_item_mktprice').text(specs[x].market_price);
                    $('.stock').text(specs[x].store_count);
                    specs_group = specs[x].id;
                }
                if(un_len[0] == s_len-1){
                    for (var z in un_len[1]){
                        options.eq(un_len[1][z]).find('li').removeClass('disabled');
                    }
                }
            } else {
                options.find('li').removeClass('disabled');
            }
        }
    };
    // 判断数组相等个数，并不相等的索引值
    var array_x = function (a1,a2) {
        if (a1.length != a2.length){
            return false;
        }
        var count = 0, index = [], i = 0;
        for (var x in a1){
            if (a1[x] == a2[x]){
                count ++;
            }else {
                index[i++] = x;
            }
        }
        return [count,index];
    };
    // 判断数组有几个为空值
    var un_count = function (a) {
        var count = 0, index = [], i = 0;
        for (var x in a){
            if(a[x] != undefined){
                index[i++] = x;
                count ++ ;
            }
        }
        return [count,index];
    };
    // 初始化规格
    options.each(function(e) {
        var i = $(this);
        var p = i.find("li");
        p.click(function() {
            if($(this).hasClass('disabled')){
                return;
            }
            if (!$(this).hasClass("selected")) {
                $(this).addClass("selected").siblings("li").removeClass("selected");
            }else {
                $(this).removeClass("selected");
            }
            spec_selected();
        });
        if(options.length == 1){
            spec_selected();
            i.find('li:not(".disabled")').eq(0).addClass("selected");
            spec_selected();
        }else {
            i.find('li:not(".disabled")').eq(0).addClass("selected");
            spec_selected();
        }
    });

}();