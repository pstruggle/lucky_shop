/**
 * 购物车页面操作 2017/10/18.
 */
$(function () {
    var carts = {}, // 保存单页的购物车数据
        shop_carts = {}, //保存所有查看的购物车数据
        specs = {}, // 规格组
        specs_select = [], // 选中规格
        specs_group=0, // 规格分组id
        cart_id = 0, // 选择修改购物车
        cart_elem = '',
        buy_url = '/index/auction/buy.html', // 购买确认页面
        move_favorite_url = '/index/goods/move_favorite.html', // 收藏夹
        mode_cart_url = '/index/goods/cart.html', // 修改购物车
        del_cart_url = '/index/goods/del_cart.html', // 删除购物车
        cart_url = '/index/goods/carts.html', // 获取购物车商品
        spec_url = '/index/goods/specs.html', // 商品规格
        spec_group_url = '/index/goods/spec_group.html';  // 商品规格组
    var img_url = function (img) {
        return '/index.php/api/upload/handle.html?pic='+img+'&w=80&h=80'
    };
    var specs_name = function (spec_name) {
        var html = '';
        var specs = spec_name.split(',');
        for (var s in specs){
            html += '<span class="sku-line">'+specs[s]+'</span>';
        }
        return html;
    };
    // 购物车视图
    var cart_html = function (cart) {
        cart = cart || {};
        var html = '<ul class="item-content clearfix" data-cart="'+cart.id+'" data-good="'+cart.goods_id+'">'+
            '<li class="td td-chk">'+
            '<div class="cart-checkbox ">'+
            '<input class="check" id="J_CheckBox_'+cart.id+'" name="items[]" value="'+cart.id+'" type="checkbox">'+
            '<label for="J_CheckBox_'+cart.id+'"></label>'+
            '</div>'+
            '</li>'+
            '<li class="td td-item">'+
            '<div class="item-pic">'+
            '<a href="/index/goods/details/id/'+cart.goods_id+'.html" target="_blank" data-title="'+cart.goods_name+'" class="J_MakePoint" data-point="tbcart.8.12">'+
            '<img src="'+img_url(cart.original_img)+'" class="itempic J_ItemImg"></a>'+
            '</div>'+
            '<div class="item-info">'+
            '<div class="item-basic-info">'+
            '<a href="/index/goods/details/id/'+cart.goods_id+'.html" target="_blank" title="'+cart.goods_name+'" class="item-title J_MakePoint" data-point="tbcart.8.11">'+cart.goods_name+'</a>'+
            '</div>'+
            '</div>'+
            '</li>'+
            '<li class="td td-info">'+
            '<div class="item-props item-props-can">';
        html += specs_name(cart.specs_name);
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
            '<em tabindex="0" class="J_ItemSum number">'+(parseFloat(cart.shop_price) * cart.sum)+'</em>'+
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
    var get_carts = function (cart_id) {
        var param = {};
        if(cart_id){
            param.cart_id = cart_id;
            param.limit = 9999;
            param.page = 1;
        }else{
            param.cart_id = cart_id;
            param.limit = 10;
            param.page = page++;
        }
        $.ajaxSetup({async:false});
        $.get(cart_url,param,function (cart) {
            if(cart == ''){
                $(document).unbind('scroll');
            }
            carts = cart;
            shop_carts = Object.assign(shop_carts,cart);
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
    // 获取商品的规格
    var get_specs = function (good_id) {
        var specs = {};
        var param = {good_id:good_id};
        $.ajaxSetup({async:false});
        $.get(spec_url,param,function (data) {
            specs = data;
        });
        return specs;
    };
    // 获取商品的规格组
    var get_spec_groups = function (good_id) {
        var spec_groups = {};
        $.ajaxSetup({async:false});
        $.get(spec_group_url,{good_id:good_id},function (data) {
            spec_groups = data;
        });
        return spec_groups;
    };
    // 规格视图
    var specs_view = function (specs) {
        var html = '';
        for (var x in specs){
            html += '<li class="theme-options">'+
                '<div class="cart-title">'+specs[x][0]+'</div>'+
                '<ul>';
            for (var y in specs[x][1]){
                html += '<li class="sku-line" data-spec="'+y+'">'+specs[x][1][y][0]+'<i></i></li>';
            }
            html += '</ul></li>';
        }
        return html;
    };
    var init_specs = function (good_id) {
        var options = $("#theme ul");
        var specs = get_spec_groups(good_id);
        specs_select = [];
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
                        $('.sys_item_price,.price-now').text(specs[x].shop_price);
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
        options.each(function() {
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
    };
    // 规格弹框操作
    var pop_spec = function () {
        cart_elem  = $(this).closest('ul.item-content');
        cart_id = cart_elem.data('cart');
        var specs = get_specs(shop_carts[cart_id].goods_id);
        var specs_html = specs_view(specs);

        $('#theme').html(specs_html);
        $('.img-info img').attr('src',shop_carts[cart_id].original_img);
        init_specs(shop_carts[cart_id].goods_id); // 初始化规格
        $('.theme-popover').find('.text_box').val(shop_carts[cart_id].sum);
        var $ww = $(window).width();
        // 禁止遮罩层下面的内容滚动
        // $(document.body).css("overflow","hidden");
        $(this).addClass("selected");
        $(this).parent().addClass("selected");
        var to = 0,th = 0,tl=0;
        if(!$(this).hasClass('item-props')){
            to=$(this).prev().offset().top+30;
            th=$(this).offset().top;
            tl=$(this).offset().left-200;
        }else {
            to=$(this).find('.sku-line').offset().top+30;
            th=$(this).offset().top;
            tl=$(this).offset().left;

        }
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
    };
    // 关闭规格弹框
    var close_spec = function () {
        // $(document.body).css("overflow","auto");
        // 滚动条复位
        $('.theme-signin-left').scrollTop(0);
        $('.theme-login').removeClass("selected");
        $('.item-props-can').removeClass("selected");
        $('.theme-span').hide();
        $('.theme-popover-mask').hide();
        $('.theme-popover').slideUp(200);
    };
    var confirm_spec = function (sum) {
        sum = ( !isNaN(sum) && sum ) || $('.theme-popover').find('.text_box').val();
        var param = {cart_id:cart_id,good_id:shop_carts[cart_id].goods_id,spec_group:specs_group,sum:sum};
        $.post(mode_cart_url,param,function (data) {
            if(data.code == 0){
                get_carts(cart_id);
                close_spec();
                var item_props = cart_elem.find('.item-props');
                item_props.find('.sku-line').remove();
                item_props.prepend(specs_name(shop_carts[cart_id].specs_name));
                cart_elem.find('.text_box').val(shop_carts[cart_id].sum);
                cart_elem.find('.td-inner .number').text(shop_carts[cart_id].sum * parseFloat(shop_carts[cart_id].shop_price));
            }
            layer.msg(data.info);
        });
    };
    // 选择所有的购物车
    var selectAll = function () {
        var check = $('.check');
        if($(this).is(':checked')){
            check.prop('checked',true);
        }else {
            check.prop('checked',false);
        }
        price_specs();
    };
    // 单个选中购物车
    var selectCheck = function () {
        var checked = $('.check:checked:not(".check-all")');
        var check = $('.check:not(".check-all")'),
            select_all = $('#J_SelectAllCbx2');
        var c_len = checked.length,
            nc_len = check.length;
        if(c_len == nc_len){
            select_all.prop('checked',true);
        }else {
            select_all.prop('checked',false);
        }
        price_specs();
    };
    // 算选中购物车价钱
    var price_specs = function () {
        var count_elem = $('#J_SelectedItemsCount');
        var checked = $('.check:checked:not(".check-all")');
        var price = 0;
        checked.each(function () {
            var item = $(this).val();
            price += parseFloat(shop_carts[item].shop_price) * shop_carts[item].sum;
        });
        $('#J_Total').text(price);
        count_elem.text(checked.length);
    };
    // 数量视图操作
    var sum_op = function (e) {
        cart_elem = e.closest('ul.item-content');
        cart_id = cart_elem.data('cart');
        specs_group = shop_carts[cart_id].spec_group;
        var sum = cart_elem.find('.text_box').val();
        confirm_spec(sum);
        price_specs();
    };
    // 增加数量没有视图操作
    var add = function (elem) {
        elem = elem.target? $(elem.target) : elem;
        var t = elem.parent().find('input[class*=text_box]');
        t.val(parseInt(t.val())+1);
    };
    //减少数量没有视图操作
    var min = function (elem) {
        elem = elem.target? $(elem.target) : elem;
        var t = elem.parent().find('input[class*=text_box]');
        t.val(parseInt(t.val())-1);
        if(parseInt(t.val())<1){
            t.val(1);
            return false;
        }
        return true;
    };
    // 添加数量
    var add_sum = function () {
        add($(this));
        sum_op($(this));
    };
    // 减少数量
    var min_sum = function () {
        if(!min($(this))){
            return false;
        }
        sum_op($(this))
    };
    // 移入到收藏夹
    var move_favorite = function (elem) {
        cart_elem = elem.target? $(elem.target).closest('ul.item-content') : elem.closest('ul.item-content');
        cart_id = cart_elem.data('cart');
        var patam = {cart_id:cart_id,goods_id:shop_carts[cart_id].goods_id};
        $.post(move_favorite_url,patam,function (data) {
            if(data.code == 0){
                del_cart(elem);
                price_specs();
            }
            layer.msg(data.info);
        });
    };
    // 删除当前购物车
    var del_cart = function (elem) {
        cart_elem = elem.target? $(elem.target).closest('ul.item-content') : elem.closest('ul.item-content');
        cart_id = cart_elem.data('cart');
        var param = {cart_id:cart_id};
        $.post(del_cart_url,param,function (data) {
            if(data.code == 0){
                cart_elem.remove();
                price_specs();
            }
            layer.msg(data.info);
        });
    };
    // 移入选中购物车到收藏夹
    var move_check_favorite = function () {
        $('.check:checked:not(".check-all")').each(function (e,a) {
            move_favorite($(a));
        });
    };
    // 删除选中购物车
    var del_check_cart = function () {
        $('.check:checked:not(".check-all")').each(function (e,a) {
            del_cart($(a));
        });
    };
    // 结算账单
    var submit_go = function () {
        var checks = $('.check:checked:not(".check-all")');
        if(checks.length<=0){
            layer.msg('请选择结算商品');
            return false;
        }
        var checked_cart = [];
        checks.each(function (e) {
            checked_cart[e] = $(this).val();
        });
        var param = {carts:checked_cart};
        PostForm.init(buy_url,param);
        console.log(checked_cart);
    };
    // 事件绑定集合方法
    var events = function () {
        cart_view();
        var cart_table = $('#cartTable');
        // 滚动
        $(document).on('scroll',cart_scroll);
        // 增加数量
        cart_table.on('click',".add",add_sum);
        cart_table.on('click',".min",min_sum);
        $('.theme-popover .add').on('click',add);
        $('.theme-popover .min').on('click',min);
        // 修改商品规格
        cart_table.on('click','.theme-login , .item-props',pop_spec);
        // 关闭修改购物车
        $('.theme-poptit .close,.btn-op .close').on('click',close_spec);
        // 确认修改购物车
        $('.btn-op .confirm').on('click',confirm_spec);
        // 全选购物车
        $('#J_SelectAllCbx2').on('click',selectAll);
        // 单选购物车
        cart_table.on('click','.check:not(".check-all")',selectCheck);
        // 删除当前购物车
        cart_table.on('click','.delete',del_cart);
        // 移入当前购物车到收藏夹
        cart_table.on('click','.btn-fav',move_favorite);
        // 移入选中购物车到收藏夹
        $('.J_BatchFav').on('click',move_check_favorite);
        // 删除选中购物车
        $('.deleteAll').on('click',del_check_cart);
        // 结算商品
        $('#J_Go').on('click',submit_go);
    };
    events();
});