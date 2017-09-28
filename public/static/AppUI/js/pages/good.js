/*
 *  Document   : category.js
 *  Author     : pixelcave
 *  Description: 商品分类交互配置js
 */

var Good = function() {
    // 更改类目
    var p1change = function (pid) {
        var html = '';
        console.log(pid)
        if(pid === ''){
            html += "<option value=''>请选择分类</option>";
            pid = 0;
        }
        var data = {pid:pid};
        $.ajaxSetup({async:false});
        $.get(category_url,data,function (result) {
            for( var i in result ){
                html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
            }
        });
        return html;
    };
    // 编辑分类类目的值
    var category_layer = function () {
        var pid_1 = $('#top_cat_id'),pid_2 = $('#pcat_id'),pid_3 = $('#cat_id');
        if(pid_1.length <=0){
            return false;
        }
        pid_1.html(p1change(''));
        pid_1.on('change',function () {
            var id = $(this).val();
            pid_2.html(p1change(id));
            var id_2 = pid_2.val();
            pid_3.html(p1change(id_2));
        });
        pid_2.on('change',function () {
            var id = $(this).val();
            pid_3.html(p1change(id));
        });
    };
    // 商品品牌
    var brands = function () {
        $.get(brands_url,{},function (result) {
            var html = "<option value='0'>请选择商品品牌</option>";
            for(var i in result ){
                html += "<option value='"+result[i].id+"'>"+result[i].initial+"--"+result[i].name+"</option>";
            }
            $('#brand_id').html(html)
        });
    };
    var logistics = function () {
        var logs = function () {
            var html = "<option value=''>请选择物流方式</option>";

            $.ajaxSetup({async:false});
            $.get(logistics_url,function (result) {
                for(var i in result ){
                    html += "<option value='"+result[i].id+"'>"+result[i].name+"</option>";
                }
            });
            return html;
        };
        $('#shipping_area_ids').html(logs());
        $('.layer').on('click',function () {
            var href = $(this).attr('_href');
            //iframe窗
            layer.open({
                type: 2,
                title: '增加物流方式',
                shadeClose: true,
                shade: false,
                maxmin: true, //开启最大化最小化按钮
                area: ['80%', '60%'],
                content: href,
                cancel: function(){
                    //右上角关闭回调
                    $('#shipping_area_ids').html(logs());
                    return true; // 开启该代码可禁止点击该按钮关闭
                }
            });

        });
    };
    // 编辑跳转
    var edit = function () {
        $('.edit').on('click',function () {
            var id = $(this).data('id');
            var edit_url = $('.edit_view').attr('href');
            location.href = edit_url + '?id=' + id;
        });
    };
    // 规格分配生成
    var spec_allot = function (data) {
        var len = data.length;
        if(len < 2){
            return data[0];
        }
        var items = [],i= 0;
        for (var x in data[0]){
            for (var y in  data[1]){
                items[i++] = data[0][x] +','+ data[1][y];
            }
        }
        data = data.slice(2);
        data.unshift(items);
        return spec_allot(data);
    };
    // 规格编辑方法
    var spec = function () {
        $('.spec_attr').tagsInput({wight:'auto',height:'auto',defaultText:'规格属性'});
        var spec = $('#spec');
        $('.add_spec').on('click',function () {
            var timestamp = new Date().getTime();
            var spec_id = 'spec_id_' + timestamp;
            var html = '<div class="form-group">'+
                '<label class="col-md-3 control-label">'+
                '<a href="javascript:void(0);" class="btn btn-effect-ripple btn-xs btn-danger del"><i class="fa fa-times"></i></a>'+
                '产品规格'+
                '</label>'+
                '<div class="col-md-2">'+
                '<input type="text" name="spec_name[]" class="form-control spec_name" value="" placeholder="产品规格名">'+
                '</div>'+
                '<div class="col-md-4">'+
                '<input type="text" id="'+spec_id+'" name="spec_attr[]" class="form-control spec_attr"  value="">'+
                '</div>'+
                '</div>';
            spec.children('.form-horizontal').append(html);
            $('.spec_attr').tagsInput({wight:'auto',height:'auto',defaultText:'规格属性'});

        });
        $('.creat_spec').on('click',function () {
            var tags = [],i=0,status = true,spec = [];
            $('.tagsinput').each(function () {
                tags[i] = [];
                var x = 0;
                $(this).find('.tag').each(function () {
                    var text = $(this).text().replace(/[\s]+x$/,"");
                    tags[i][x++] = text;
                });
                if(tags[i].length <=0){
                    status = false;
                    return false;
                }
                i++;
            });
            var j = 0;
            $('.spec_name').each(function () {
                var text = $(this).val();
                if(text == ''){
                    status = false;
                    return false;
                }
                spec[j++] = text;
            });
            if(tags.length<=0){
                alert('请添加规格！');
                return false;
            }
            if (!status){
                alert('规格名，规格属性必须填写！');
                return false;
            }
            var shop_price = $('#shop_price').val(),
                store_count = $('#store_count').val(),
                market_price = $('#market_price').val(),
                goods_sn = $('#goods_sn').val();
            var head = '<tr>',body = '';
            for (var de in spec){
                head += '<th>'+spec[de]+'</th>';
            }
            head += '<th>售价</th><th>市场价</th><th>库存</th><th>商品编码</th></tr>';
            tags = spec_allot(tags);
            for (var y in tags){
                var tag = tags[y].split(',');
                body += '<tr>';
                for (var x in tag){
                    body += '<td>'+tag[x]+'</td>';
                }
                body += '<td><input type="text" class="form-control" name="shop_prices[]" value="'+shop_price+'"></td>' +
                    '<td><input type="text" class="form-control" name="market_prices[]" value="'+market_prices+'"></td>' +
                    '<td><input type="text" class="form-control" name="store_counts[]" value="'+store_count+'"></td>' +
                    '<td><input type="text" class="form-control" name="goods_sns[]" value="'+goods_sn+'"></td></tr>';
            }
            $('#spec_table thead').html(head);
            $('#spec_table tbody').html(body);
        });

        spec.on('click','.del',function () {
            $(this).closest('.form-group').remove();
        });
    };
    return {
        init: function() {
            edit(); // 编辑跳转
        },
        edit_good : function () {
            spec(); // 规格
            brands(); // 品牌列表
            logistics();
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
}();/**
 * Created by Administrator on 2017/9/27.
 */
