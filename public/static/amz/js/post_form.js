/**
 * Created by 纯简 on 2017/10/12.
 * 创建表单并post方式提交
 */
var PostForm = function () {
    var form_html = '';//表单字符串
    var id = 'form'+Date.parse(new Date());
    var post_html = function (url,param,method) {
        method = method || 'post';
        form_html += "<form method='"+method+"' action='"+url+"' id='"+id+"'>";
        for (var name in param){
            if($.isArray(param[name])){
                for(var x in param[name]){
                    form_html += "<input type='text' name='"+name+"[]' value='"+param[name][x]+"' />";
                }
            }else {
                form_html += "<input type='text' name='"+name+"' value='"+param[name]+"' />";
            }
        }
        form_html +="</form>";
        $('body').after(form_html);
        $('#'+id).submit();
    };
    return {
        init : function (url,param) {
            post_html(url,param);
        }
    };
}();

