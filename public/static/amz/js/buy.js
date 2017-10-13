/**
 * Created by Administrator on 2017/10/12.
 */

var Buy = function () {
    var address_info = {};
    var create_addr_view = function (addr) {
        addr = addr || {};
        var html = '<div class="theme-popover">'+
            '<div class="am-u-md-12">'+
            '<form class="am-form am-form-horizontal" target="create_address" action="/index/Member/create_addr.html" method="post" id="add_form">'+
            '<div class="am-form-group">'+
            '<label for="full_name" class="am-form-label">收货人</label>'+
            '<div class="am-form-content">'+
            '<input type="text" id="full_name" name="full_name" placeholder="收货人" value="'+(addr.full_name||'')+'" />'+
            '<input type="hidden" id="id" name="id" placeholder="编辑id" value="'+(addr.id||'')+'" />'+
            '</div>'+
            '</div>'+
            '<div class="am-form-group">'+
            '<label for="mobile" class="am-form-label">手机号码</label>'+
            '<div class="am-form-content">'+
            '<input id="mobile" name="mobile" placeholder="手机号必填" type="text" value="'+(addr.mobile||'')+'" />'+
            '</div>'+
            '</div>'+
            '<div class="am-form-group">'+
            '<label for="province" class="am-form-label">所在地</label>'+
            '<div class="am-form-content address">'+
            '<select id="province" name="province" data-val="'+(addr.province||'')+'">'+
            '</select>'+
            '<select id="city" name="city" data-val="'+(addr.city||'')+'">'+
            '</select>'+
            '<select id="county" name="county" data-val="'+(addr.county||'')+'">'+
            '</select>'+
            '</div>'+
            '</div>'+
            '<div class="am-form-group">'+
            '<label for="address" class="am-form-label">详细地址</label>'+
            '<div class="am-form-content">'+
            '<textarea name="address" rows="3" id="address" placeholder="输入详细地址">'+(addr.address||'')+'</textarea>'+
            '<small>100字以内写出你的详细地址...</small>'+
            '</div>'+
            '</div>'+
            '</form>'+
            '<iframe id="create_address" name="create_address" class="hidden"></iframe>'+
            '</div>'+
            '</div>';
        return html;
    };
    // 验证用户输入
    var validate_input = function () {
        var error_info = $('<span class="am-form-error"></span>');
        var full_name_e = $('#full_name');
        var full_name = full_name_e.val();
        full_name_e.closest('.am-form-content').find('.am-form-error').remove();
        if(full_name == ''){
            error_info.text('请输入收货人');
            full_name_e.after(error_info);
            return false;
        }
        var mobile_e = $('#mobile');
        var mobile = mobile_e.val();
        mobile_e.closest('.am-form-content').find('.am-form-error').remove();
        if(mobile == ''){
            error_info.text('请输入手机号码');
            mobile_e.after(error_info);
            return false;
        }else if(!(/^1\d{10}$/.test(mobile))){
            error_info.text('请输入正确的手机号码');
            mobile_e.after(error_info);
            return false;
        }
        var province_e = $('#province');
        var province = province_e.val();
        province_e.closest('.am-form-content').find('.am-form-error').remove();
        if(province == ''){
            error_info.text('请选择所在省份');
            province_e.after(error_info);
            return false;
        }
        var address_e = $('#address');
        var address = address_e.val();
        address_e.closest('.am-form-content').find('.am-form-error').remove();
        if(address == ''){
            error_info.text('请输入详细地址');
            address_e.after(error_info);
            return false;
        }
        return true;
    };
    // 用户地址弹窗
    var addr = function (title,address) {
        layer.open({
            title:title,
            btn:['保存','取消'],
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            // area: ['50%', '50%'], //宽高
            content: create_addr_view(address),

            yes:function (index,layero) {
                var status = validate_input();
                if(!status){
                    return false;
                }
                $('#add_form').submit();
                $('#create_address').on('load',function () {
                    var result = $('#create_address').contents().text();
                    result = eval('('+result+')');
                    if(result.code != 0){
                        layer.msg(result.info);
                        return false;
                    }
                    page = 1;
                    rendering_1();
                    layer.close(index);
                    return true;
                });
            },
            btn2:function () {
                return true;
            }
        });
        new PCAS('province','city','county',(address.province || ''),(address.city || ''),(address.county || ''));
    };
    // 获取用户地址
    var page = 1;
    var get_address = function (id) {
        id = id || '';
        var param = {page:page++,id:id};
        $.ajaxSetup({async:false});
        $.get('/index/member/address.html',param,function (data) {
            address_info = data.data;
        });
        return address_info;
    };
    // 循环出视图
    var rendering_1 = function () {
        get_address();
        var html = '';
        for (var x in address_info){
            html += address_view1(address_info[x],x);
        }
        $('.address ul').html(html);
        pay_address();
    };
    // 信息
    var pay_address = function () {
        var index = $('li.user-addresslist.defaultAddr').data('index');
        var address = address_info[index];
        var pay_address = $('.pay-address');
        pay_address.find('.province').text(address.province_area);
        pay_address.find('.city').text(address.city_area);
        pay_address.find('.dist').text(address.county_area);
        pay_address.find('.street').text(address.address);
        pay_address.find('.buy-user').text(address.full_name);
        pay_address.find('.buy-phone').text(address.mobile);
    };
    // 地址列表视图
    var address_view1 = function (addr,index) {
        var html = (addr.is_default ? '<div class="per-border"></div>':'')+
            '<li class="user-addresslist '+(addr.is_default == 1 ? 'defaultAddr':'')+'" data-addr="'+addr.id+'" data-index="'+index+'">'+
            '<div class="address-left">'+
            '<div class="user DefaultAddr">'+
            '<span class="buy-address-detail">'+
            '<span class="buy-user">'+addr.full_name+'</span>'+
            '<span class="buy-phone">'+addr.mobile+'</span>'+
            '</span>'+
            '</div>'+
            '<div class="default-address DefaultAddr">'+
            '<span class="buy-line-title buy-line-title-type">收货地址：</span>'+
            '<span class="buy--address-detail">'+
            '<span class="province">'+addr.province_area+'</span>'+
            '<span class="city">'+addr.city_area+'</span>'+
            '<span class="dist">'+addr.county_area+'</span>'+
            '<span class="street">'+addr.address+'</span>'+
            '</span>'+
            '</div>'+
            (addr.is_default==1 ? '<ins class="deftip ">默认地址</ins>':'')+
            '</div>'+
            '<div class="address-right">'+
            (addr.is_default ? '<a href="__AMZ__person/address.html">':'')+
            '<span class="am-icon-angle-right am-icon-lg"></span>'+
            (addr.is_default ? '</a>' : '')+
            '</div>'+
            '<div class="clear"></div>'+
            '<div class="new-addr-btn">'+
            '<a href="javascript:void(0)" class="set_default '+(addr.is_default==1 ? 'hidden':'')+'">设为默认</a>'+
            '<span class="new-addr-bar '+(addr.is_default==1 ? 'hidden':'')+'">|</span>'+
            '<a href="javascript:void (0);" class="edit_addr">编辑</a>'+
            '<span class="new-addr-bar">|</span>'+
            '<a href="javascript:void(0);" onclick="delClick(this);">删除</a>'+
            '</div>'+
            '</li>'+
            (addr.is_default ? '<div class="per-border"></div>':'');
        return html;
    };
    // 计算价格商品价格
    var price_view = function () {
        var price_now = $('.price-now').text(); //单价
        var freprice = $('.sys_item_freprice').text();
        var sum = $('.text_box').val();
        var price = parseFloat(price_now) * parseInt(sum) + parseFloat(freprice);
        $('.pay-sum,#J_ActualFee').text(price);
    };
    // 添加编辑用户地址
    var interactive = function () {
        var address_ul = $('.address ul');
        // 增加用户地址
        $('.createAddr').on('click',function () {
            var title = '新增地址/ Add address';
            var address = {};
            addr(title,address);
        });
        // 修改用户地址
        address_ul.on('click','.edit_addr',function () {
            var title = '修改地址/ Edit address';
            var addr_id = $(this).closest('li.user-addresslist').data('addr');
            page = 1;
            var address = get_address(addr_id)[0];
            addr(title,address);
        });
        // 选中用户地址
        address_ul.on('click','.user-addresslist',function() {
            $(this).addClass("defaultAddr").siblings().removeClass("defaultAddr");
            pay_address();
        });
        // 设置默认地址
        address_ul.on('click','.set_default',function() {
            var addr_id = $(this).closest('li.user-addresslist').data('addr');
            var param = {id:addr_id,is_default:1};
            $.post('/index/member/address_edit.html',param,function (data) {
                if(data.code==0){
                    page = 1;
                    rendering_1();
                }else {
                    layer.msg(data.info);
                }
            });
        });
        // 支付方式，物流方式
        $(".logistics").each(function() {
            var i = $(this);
            var p = i.find("ul>li");
            p.click(function() {
                if (!!$(this).hasClass("selected")) {
                    $(this).removeClass("selected");
                } else {
                    $(this).addClass("selected").siblings("li").removeClass("selected");
                }
            })
        });
        // 添加商品数量
        $(".add").click(function(){
            var t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())+1)
            price_view();
        });
        // 减少商品数量
        $(".min").click(function(){
            var t=$(this).parent().find('input[class*=text_box]');
            t.val(parseInt(t.val())-1);
            if(parseInt(t.val())<=0){
                t.val(1);
            }
            price_view();
        });
        $('#J_Go').on('click',function () {
            var addr_id = $('li.user-addresslist.defaultAddr').data('addr'); // 配送id
            var payment = $('.pay.selected').data('pay');//支付方式
            var sum = $('.text_box').val();// 购买数量
            var good_id = $('.bundle').data('good'); // 商品id
            var remarks = $('.J_MakePoint').val();
            var spec_group = $('.item-props').data('spec-group');
            if(!addr_id){
                layer.msg('请选择您的地址');
                return false;
            }
            if(!payment){
                layer.msg('请选择支付方式');
                return false;
            }
            if(sum<=0){
                layer.msg('购买数量必须>=1');
                return false;
            }
            if(!good_id){
                layer.msg('商品不存在');
                return false;
            }
            var param = {addr_id:addr_id,payment:payment,sum:sum,good_id:good_id,spec_group:spec_group,remarks:remarks};
            var url = '/index/auction/pay_now.html';
            PostForm.init(url,param,'post','_blank');

        });
    };

    return {
        init:function () {
            interactive(); // 编辑，添加地址
            rendering_1(); // 初始化地址
            price_view(); // 价格的计算
        },
    };
}();
