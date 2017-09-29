/*
 *  Document   : category.js
 *  Author     : pixelcave
 *  Description: 商品分类交互配置js
 */

var Good = function() {
    var goods_id = $('#goods_id').val();
    // 更改类目
    var p1change = function (pid,select) {
        var html = '';
        if(pid === ''){
            html += "<option value=''>请选择分类</option>";
            pid = 0;
        }
        var data = {pid:pid};
        $.ajaxSetup({async:false});
        $.get(category_url,data,function (result) {
            for( var i in result ){
                var sele = '';
                if(select == result[i].id){
                    sele = 'selected ="selected"';
                }
                html += "<option value='"+result[i].id+"' "+sele+">"+result[i].name+"</option>";
            }
        });
        return html;
    };
    // 编辑分类类目的值
    var category_layer = function () {
        var top_cat_id = $('#top_cat_id'),pcat_id = $('#pcat_id'),cat_id = $('#cat_id');
        var pid_1 = top_cat_id.data('val'),pid_2 = pcat_id.data('val'),pid_3 = cat_id.data('val');
        if(top_cat_id.length <=0){
            return false;
        }
        var selP = function () {
            top_cat_id.html(p1change('',pid_1));
            selC();
        };
        var selC = function () {
            var id = top_cat_id.val();
            pcat_id.html(p1change(id,pid_2));
            selA();
        };
        var selA = function () {
            var id = pcat_id.val();
            cat_id.html(p1change(id,pid_3));
        };
        top_cat_id.on('change',selC);
        pcat_id .on('change',selA);
        selP();
    };
    // 商品品牌
    var brands = function () {
        var brand = $('#brand_id'), brand_id = brand.data('val');
        $.get(brands_url,{},function (result) {
            var html = "<option value='0'>请选择商品品牌</option>";
            for(var i in result ){
                var select = '';
                if(result[i].id == brand_id) select = 'selected="selected"';
                html += "<option value='"+result[i].id+"' "+select+">"+result[i].initial+"--"+result[i].name+"</option>";
            }
            brand.html(html)
        });
    };

    // 物流方式
    var logistics = function () {
        var shipp = $('#shipping_area_ids'),shipp_id = shipp.data('val');
        var logs = function () {
            var html = "<option value=''>请选择物流方式</option>";

            $.ajaxSetup({async:false});
            $.get(logistics_url,function (result) {
                for(var i in result ){
                    var select = '';
                    if(result[i].id == shipp_id) select = 'selected="selected"';
                    html += "<option value='"+result[i].id+"' "+select+">"+result[i].name+"</option>";
                }
            });
            return html;
        };
        shipp.html(logs());
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
    // 规格编辑方法
    var spec = function () {
        var spec = $('#spec');
        var result = {};
        var get_spec = function () {
            if(!goods_id)return false;
            var data = {goods_id:goods_id};
            $.ajaxSetup({async:false});
            $.get(spec_url,data,function (re) {
                result = re;
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

        var spec_attr = function (attr) {
            var str = '';
            if(attr){
                for (var i in attr){
                    str += attr[i][0]+',';
                }
            }
            return str;
        };

        // 添加规格方法
        var add_spec = function (specs) {
            var timestamp = new Date().getTime();
            var spec_id = 'spec_id_' + timestamp;
            var attr = spec_attr(specs[1]);
            var html = '<div class="form-group">'+
                '<label class="col-md-3 control-label">'+
                '<a href="javascript:void(0);" class="btn btn-effect-ripple btn-xs btn-danger del"><i class="fa fa-times"></i></a>'+
                '产品规格'+
                '</label>'+
                '<div class="col-md-2">'+
                '<input type="text" name="spec_name[]" class="form-control spec_name" value="'+(specs[0]?specs[0]:'')+'" placeholder="产品规格名">'+
                '</div>'+
                '<div class="col-md-4">'+
                '<input type="text" id="'+spec_id+'" name="spec_attr[]" class="form-control spec_attr"  value="'+attr+'">'+
                '</div>'+
                '</div>';
            spec.children('.form-horizontal').append(html);
            $('.spec_attr').tagsInput({wight:'auto',height:'auto',defaultText:'规格属性'});
        };
        // 点击生成规则
        $('.add_spec').on('click',add_spec);
        // 生成头部
        var head_spec = function () {
            var j=0,status = true,spec = [];
            // 规格名
            $('.spec_name').each(function () {
                var text = $(this).val();
                if(text == ''){
                    status = false;
                    return false;
                }
                spec[j++] = text;
            });

            if (!status){
                alert('规格名，规格属性必须填写！');
                return false;
            }

            var head = '<tr>';
            for (var de in spec){
                head += '<th>'+spec[de]+'</th>';
            }
            head += '<th>售价</th><th>市场价</th><th>库存</th><th>商品编码</th></tr>';
            return head;
        };
        // 生成属性
        var tags = function () {
            var status = true,tags = [],i=0;
            //属性
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
            if(tags.length<=0 || !status){
                alert('请添加规格！');
                return false;
            }

            tags = spec_allot(tags);
            return tags;
        };
        // 生成主体
        var body_spec = function () {
            var tagx = tags();

            var body = '';
            for (var y in tagx){
                var tag = tagx[y].split(',');
                body += '<tr>';
                for (var x in tag){
                    body += '<td>'+tag[x]+'</td>';
                }
                body += '<td><input type="text" class="form-control" name="shop_prices[]" value="'+result.spec_group[y].shop_price+'"></td>' +
                    '<td><input type="text" class="form-control" name="market_prices[]" value="'+result.spec_group[y].market_price+'"></td>' +
                    '<td><input type="text" class="form-control" name="store_counts[]" value="'+result.spec_group[y].store_count+'"></td>' +
                    '<td><input type="text" class="form-control" name="goods_sns[]" value="'+result.spec_group[y].goods_sn+'"></td></tr>';
            }
            return body;
        }
        // 生成规则组
        $('.creat_spec').on('click',function () {
            var head = head_spec();
            var shop_price = $('#shop_price').val(),
                store_count = $('#store_count').val(),
                market_price = $('#market_price').val(),
                goods_sn = $('#goods_sn').val();
            var body = '';
            var tagx = tags();
            for (var y in tagx){
                var tag = tagx[y].split(',');
                body += '<tr>';
                for (var x in tag){
                    body += '<td>'+tag[x]+'</td>';
                }
                body += '<td><input type="text" class="form-control" name="shop_prices[]" value="'+shop_price+'"></td>' +
                    '<td><input type="text" class="form-control" name="market_prices[]" value="'+market_price+'"></td>' +
                    '<td><input type="text" class="form-control" name="store_counts[]" value="'+store_count+'"></td>' +
                    '<td><input type="text" class="form-control" name="goods_sns[]" value="'+goods_sn+'"></td></tr>';
            }
            $('#spec_table thead').html(head);
            $('#spec_table tbody').html(body);
        });

        spec.on('click','.del',function () {
            $(this).closest('.form-group').remove();
        });
        // 初始化
        var init_spec = function () {
            get_spec();
            if(result.spec){
                for(var i in result.spec){
                    add_spec(result.spec[i]);
                }

                var head = head_spec();
                var body = body_spec();
                $('#spec_table thead').html(head);
                $('#spec_table tbody').html(body);
            }
        };
        init_spec();
    };
    return {
        init: function() {
            edit(); // 编辑跳转
        },
        edit_good : function () {
            spec(); // 规格
            brands(); // 品牌列表
            logistics(); // 物流方式
            category_layer(); // 分类层级的
            var desc = UE.getEditor('goods_content', {
//            toolbars: toolbars,
                initialFrameHeight: '400',
                initialFrameWidth: '100%'
            });

        }
    };
}();/**
 * Created by Administrator on 2017/9/27.
 */
