/**
 * Created by 纯简 on 2017/10/12.
 * 创建表单并post方式提交
 */
var PostForm = function () {
    var form_html = '';//表单字符串
    var id = 'form'+Date.parse(new Date());
    var post_html = function (url,param,method,target) {
        method = method || 'post';
        target = target || '_self';
        form_html += "<form method='"+method+"' action='"+url+"' id='"+id+"' target='"+target+"'>";
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
        $('body').append(form_html);
        $('#'+id).submit().remove();
    };
    return {
        init : function (url,param,method,target) {
            post_html(url,param,method,target);
        }
    };
}();

