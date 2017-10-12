/**
 * Created by Administrator on 2017/10/12.
 */

var Buy = function () {
    var create_addr_view = function (addr) {
        addr = addr || {};
        var html = '<div class="theme-popover">'+
            '<div class="am-u-md-12">'+
            '<form class="am-form am-form-horizontal" target="create_address" action="'+create_address_url+'" method="post" id="add_form">'+
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
    // 用户上传的地址
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
    // 添加编辑用户地址
    var create_edit = function () {
        $('.createAddr').on('click',function () {
            var title = '新增地址/ Add address';
            var address = {};
            addr(title,address);
        });
        $('.edit_addr').on('click',function () {
            var addr = $(this).closest('li').data('addr');
            console.log(addr);
        });
    };
    return {
        init:function () {
            create_edit(); // 编辑，添加地址

        }
    };
}();
