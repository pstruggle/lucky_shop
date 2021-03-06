// JavaScript Document

//商品规格选择
$(function() {
    var spec_group_url = "/index/Goods/spec_group.html",
        spec_store_url = "/index/Goods/ajax_spec_store.html",
        buy_url = "/index/Auction/buy_now.html",
        cart_url = "/index/goods/cart.html" ;
    // 选中规格后获取价格
    var options = $("#theme ul"), //规格元素
        main = $('#main'), //主袁术
        text_box = $('#text_box');//数量元素
    var specs = {} , //商品对应规格
        specs_select = [],//用户选择规格
        error='',// 提示错误
        good_id = main.data('good-id'), // 商品id
        sum=text_box.val(),// 商品数量
        specs_group = 0; //用户选中规格组
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
    // 验证用户是否符合购买
    var validate_shop = function () {
        //当商品有规格选择时
        if(specs.length >0){
            var un_len = un_count(specs_select);
            if(un_len[0] != specs_select.length){
                error = '请选全规格';
                return false;
            }
            var param = {specs:specs_select,goods_id:good_id};
            var status = true;
            $.get(spec_store_url,param,function (data) {
                if(data.store_count <= 0){
                    status = false;
                }
            });
            if(status === false){
                error = '您下手慢了，该规格商品已经没有啦';
                return false;
            }
        }else { // 当商品没有规格选择时
            var param = {goods_id:good_id};
            var status = true;
            $.get(spec_store_url,param,function (data) {
                if(data.store_count <= 0){
                    status = false;
                }
            });
            if(status === false){
                error = '您下手慢了，该规格商品已经没有啦';
                return false;
            }
        }
        sum = text_box.val();
        if(sum<=0){
            error = '数量要大于等于1哦';
            return false;
        }

        return true;
    };
    // 用户点击购买
    $('#likbuy').on('click',function () {
        var validate = validate_shop();
        if (!validate){
            layer.msg(error);
            return false;
        }

        var param = {goods_id:good_id,specs_group:specs_group,sum:sum};
        PostForm.init(buy_url,param);
    });
    // 用户点击加入购物车
    $('#likbasket').on('click',function () {
        var validate = validate_shop();
        if (!validate){
            layer.msg(error);
            return false;
        }
        var param = {good_id:good_id,spec_group:specs_group,sum:sum};
        $.post(cart_url,param,function (data) {
            if(data.code == 0){
                var cart_num_e1 = $('.cart_num'),cart_num_e2 = $('#J_MiniCartNum');
                var num = parseInt(cart_num_e2.text())+1;
                cart_num_e1.text(num);
                cart_num_e2.text(num);
            }
            layer.msg(data.info);
        });

    });
});

//弹出规格选择
$(document).ready(function() {
    var $ww = $(window).width();
    if ($ww <1025) {
        $('.theme-login').click(function() {
            $(document.body).css("position", "fixed");
            $('.theme-popover-mask').show();
            $('.theme-popover').slideDown(200);

        });

        $('.theme-poptit .close,.btn-op .close').click(function() {
            $(document.body).css("position", "static");
            //					滚动条复位
            $('.theme-signin-left').scrollTop(0);

            $('.theme-popover-mask').hide();
            $('.theme-popover').slideUp(200);
        })

    }
})

//导航固定
$(document).ready(function() {
    var $ww = $(window).width();
    var dv = $('ul.am-tabs-nav.am-nav.am-nav-tabs'),
        st;

    if ($ww < 623) {

        var tp =$ww+363;
        $(window).scroll(function() {
            st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            if (st >= tp) {
                if (dv.css('position') != 'fixed') dv.css({
                    'position': 'fixed',
                    top: 53,
                    'z-index': 1000009
                });

            } else if (dv.css('position') != 'static') dv.css({
                'position': 'static'
            });
        });
        //滚动条复位（需要减去固定导航的高度）

        $('.introduceMain ul li').click(function() {
            sts = tp;
            $(document).scrollTop(sts);
        });
    } else {

        dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离
        var tp = parseInt(dv.attr('otop'))+36;
        $(window).scroll(function() {
            st = Math.max(document.body.scrollTop || document.documentElement.scrollTop);
            if (st >= tp) {

                if (dv.css('position') != 'fixed') dv.css({
                    'position': 'fixed',
                    top: 0,
                    'z-index': 998
                });

                //滚动条复位
                $('.introduceMain ul li').click(function() {
                    sts = tp-35;
                    $(document).scrollTop(sts);
                });

            } else if (dv.css('position') != 'static') dv.css({
                'position': 'static'
            });
        });



    }
});



$(document).ready(function() {
    //优惠券
    $(".hot span").click(function() {
        $(".shopPromotion.gold .coupon").toggle();
    });

    //获得文本框对象
    var t = $("#text_box");
    //初始化数量为1,并失效减
    $('#min').attr('disabled', true);
    //数量增加操作
    $("#add").click(function() {
        t.val(parseInt(t.val()) + 1)
        if (parseInt(t.val()) != 1) {
            $('#min').attr('disabled', false);
        }

    })
    //数量减少操作
    $("#min").click(function() {
        t.val(parseInt(t.val()) - 1);
        if (parseInt(t.val()) == 1) {
            $('#min').attr('disabled', true);
        }

    })

})