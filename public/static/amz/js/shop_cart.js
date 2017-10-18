/**
 * 购物车页面操作 2017/10/18.
 */
$(function () {
    var carts = {}, // 保存单页的购物车数据
        shop_carts = {}, //保存所有查看的购物车数据
        cart_url = '/index/goods/carts.html';
    var img_url = function (img) {
        return '/index.php/api/upload/handle.html?pic='+img+'&w=80&h=80'
    };

    // 购物车视图
    var cart_html = function (cart) {
        cart = cart || {};
        var html = '<ul class="item-content clearfix">'+
            '<li class="td td-chk">'+
            '<div class="cart-checkbox ">'+
            '<input class="check" id="J_CheckBox_'+cart.id+'" name="items[]" value="'+cart.id+'" type="checkbox">'+
            '<label for="J_CheckBox_'+cart.id+'"></label>'+
            '</div>'+
            '</li>'+
            '<li class="td td-item">'+
            '<div class="item-pic">'+
            '<a href="/index/goods/details/id/'+cart.id+'.html" target="_blank" data-title="'+cart.goods_name+'" class="J_MakePoint" data-point="tbcart.8.12">'+
            '<img src="'+img_url(cart.original_img)+'" class="itempic J_ItemImg"></a>'+
            '</div>'+
            '<div class="item-info">'+
            '<div class="item-basic-info">'+
            '<a href="/index/goods/details/id/'+cart.id+'.html" target="_blank" title="'+cart.goods_name+'" class="item-title J_MakePoint" data-point="tbcart.8.11">'+cart.goods_name+'</a>'+
            '</div>'+
            '</div>'+
            '</li>'+
            '<li class="td td-info">'+
            '<div class="item-props item-props-can">';
        var specs = cart.specs_name.split(',');
        for (var s in specs){
            html += '<span class="sku-line">'+specs[s]+'</span>';
        }
        html+= '<span tabindex="0" class="btn-edit-sku theme-login">修改</span>'+
            '<i class="theme-login am-icon-sort-desc"></i>'+
            '</div>'+
            '</li>'+
            '<li class="td td-price">'+
            '<div class="item-price price-promo-promo">'+
            '<div class="price-content">'+
            '<div class="price-line">'+
            '<em class="price-original">'+cart.market_price+'</em>'+
            '</div>'+
            '<div class="price-line">'+
            '<em class="J_Price price-now" tabindex="0">'+cart.shop_price+'</em>'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</li>'+
            '<li class="td td-amount">'+
            '<div class="amount-wrapper ">'+
            '<div class="item-amount ">'+
            '<div class="sl">'+
            '<input class="min am-btn" name="" type="button" value="-" />'+
            '<input class="text_box" name="" type="text" value="'+cart.sum+'" style="width:30px;" />'+
            '<input class="add am-btn" name="" type="button" value="+" />'+
            '</div>'+
            '</div>'+
            '</div>'+
            '</li>'+
            '<li class="td td-sum">'+
            '<div class="td-inner">'+
            '<em tabindex="0" class="J_ItemSum number">'+(cart.shop_price * cart.sum)+'</em>'+
            '</div>'+
            '</li>'+
            '<li class="td td-op">'+
            '<div class="td-inner">'+
            '<a title="移入收藏夹" class="btn-fav" href="#">移入收藏夹</a>'+
            '<a href="javascript:;" data-point-url="#" class="delete">删除</a>'+
            '</div>'+
            '</li>'+
            '</ul>';
        return html;
    };
    var page = 1;
    // 获取购物车
    var get_carts = function () {
        var param = {page:page++};
        $.ajaxSetup({async:false});
        $.get(cart_url,param,function (cart) {
            carts = cart.data;
            shop_carts = Object.assign(shop_carts,cart.data);
        });
    };
    // 购物车视图加载
    var cart_view = function () {
        var html = '';
        get_carts();
        for(var x in carts){
            html += cart_html(carts[x]);
        }
        $('.bundle-main').append(html);
    };
    // 滚动到最底部
    var cart_scroll = function () {
        var win_height = window.screen.height;
        var scroll = $(document).scrollTop();
        var body_height = $('body').height();
        if(scroll >= body_height-win_height){
            cart_view();
        }
    };
    // 事件绑定集合方法
    var events = function () {
        cart_view();

        // 滚动
        $(document).on('scroll',cart_scroll);
        // 增加数量
        $(".add").click(function(){
            var t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())+1)
        });
        $(".min").click(function(){
            var t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())-1)
            if(parseInt(t.val())<1){
                t.val(1);
            }
        });
        $('#cartTable').on('click','.theme-login',function() {
            var $ww = $(window).width();
            // 禁止遮罩层下面的内容滚动
            $(document.body).css("overflow","hidden");

            $(this).addClass("selected");
            $(this).parent().addClass("selected");
            var to=$(this).prev().offset().top+30;
            var th=$(this).offset().top;
            var tl=$(this).offset().left-200;

            $('.theme-span').show();
            $('.theme-popover-mask').show();
            $('.theme-popover-mask').height($(document).height());
            $('.theme-popover').slideDown(200);

            if ($ww>640){
                $('.theme-popover').css("top",th);
                $('.theme-popover').css("left",tl);
                $('.theme-popover-mask').hide();
            }
            if ($ww>1024){
                $('.theme-popover').css("top",to);
                $('.theme-popover').css("left",tl);
                $('.theme-popover-mask').hide();
            }
        });
        $('.theme-poptit .close,.btn-op .close').click(function() {
            $(document.body).css("overflow","auto");
            // 滚动条复位
            $('.theme-signin-left').scrollTop(0);
            $('.theme-login').removeClass("selected");
            $('.item-props-can').removeClass("selected");
            $('.theme-span').hide();
            $('.theme-popover-mask').hide();
            $('.theme-popover').slideUp(200);
        });
        $(".theme-options").each(function(){
            var i=$(this);
            var p=i.find("ul>li");
            p.click(function(){
                if(!!$(this).hasClass("selected")){
                    $(this).removeClass("selected");

                }else{
                    $(this).addClass("selected").siblings("li").removeClass("selected");

                }

            })
        })
    }
    events();
});