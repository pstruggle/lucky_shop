function Upload(id,obj,str) {
    this.inputName ='';
    this.inputId = id || 'upfile';
    this.inputVal = '';
    this.obj = obj || {};
    this.str = str || '';
    var up = this;
    up.getUpload();
}

/*
 * 初始化上传视图
 * */
Upload.prototype.getUpload = function(){
    var up = this;
    var tag = $("#"+up.inputId);
    up.inputName = tag.attr('name');
    up.inputVal = tag.data('val') || '点我上传';
    up.host = location.origin;
    if(tag.get(0).tagName != 'INPUT'){
        alert('请使用input标签')
        return;
    }
    if(up.inputName == ''){
        alert('请输入表单的name值')
        return;
    }
    up.getHtml();
}
/*
 * 上传成功视图
 * */
Upload.prototype.getHtml = function(){
    var up = this;
    var timestrap = (+new Date()).toString(36),
        images = [".png", ".jpg", ".jpeg", ".gif", ".bmp"],
        multiple = '',
        upfile = 'upfile';
    if(typeof($('#'+up.inputId).attr('multiple')) != 'undefined'){
        multiple = 'multiple';
        upfile = 'upfile[]';
    }
    var content = $('<div class="up-content"></div>')
    var out = $(
        '<div class="up-c-box"> <span class="up-text">'
        + up.inputVal +
        '</span> <iframe id="'+timestrap+'" class="up-iframe"></iframe></div>');
    content.html(out);
    $('#'+up.inputId).replaceWith(content);
    var upload = $('#'+timestrap).contents();
    upload.find('html');
    var body = upload.find('body');

    body.css({'width':'100%','height':'100%','margin':'0','overflow':'hidden'}).html(
        "<form action='"+up.host+"/index.php/api/Upload/single_upload/action/uploadimage.html' id='upload_form' enctype='multipart/form-data' target='upload_iframe' method='post'><input type='file' name='"+ upfile+"' "+multiple+" id='upfile' style='display:block;width: 100%;height: 100%;overflow: hidden;border: none; margin: 0;padding: 0;opacity:0;cursor: pointer;' /></form><iframe name='upload_iframe' id='upload_iframe' frameborder='0' style='display: none;'></iframe>"
    );
    var upload_form = $('#'+timestrap).contents().find('#upload_form');
    var upfile = $('#'+timestrap).contents().find('#upfile');
    var upload_iframe = $('#'+timestrap).contents().find('#upload_iframe');
    // console.log(up.str);

    if(up.str != ''){
        var pics = new Array(),
            imgShow = '',
            timestr = '';
        pics = up.str.split(',');
        for(x in pics){
            // console.log(pics[x]);
            timestr = (+new Date()).toString(36);
            imgShow = $("<div  class='upfiles'><img src='"+ up.host+ '/api.php/upload/handle.html?pic=' + pics[x] + "&w=200&h=200' alt='图片' title='" + pics[x] + "' height='42'/><input type='hidden' name='" + up.inputName + "' id='" + up.inputId + timestr + "' value='" + pics[x] + "' /><i class='del'></i></div>");
            out.after(imgShow);
        }
    }
    // alert(JSON.stringify(upfile));
    upfile.on('change',function(){
        // alert(JSON.stringify($('.upfiles')));
        upload_form.submit();
    });
    upload_iframe.on('load',function() {
        var str = $(this).contents().find('body').text();
        var json = eval('(' + str + ')');
        // typeHtml();
        /*
         * 根据文件类型不同显示
         *
         * */
        var timestr = (+new Date()).toString(36);
        var imgShow = '';
        if (multiple == '') {
            if (json.state == 'SUCCESS') {
                if (out.siblings('.upfiles').length != 0) {
                    out.siblings('.upfiles').remove();
                }
                if ($.inArray(json.type, images) != -1) {
                    imgShow = $("<div  class='upfiles'><img src='"+ up.host+ '/api.php/upload/handle.html?pic=' + json.url + "&w=200&h=200' alt='图片' title='" + json.title + "' height='42'/><input type='hidden' name='" + up.inputName + "' id='" + up.inputId + timestr + "'value='" + json.url + "' /><i class='del'></i></div>");
                    out.after(imgShow);
                } else {
                    imgShow = $("<div  class='upfiles'><a href='" + json.url + "'>" + json.original + "</a><input type='hidden' name='" + up.inputName + "' id='" + up.inputId + "'value='" + json.url + "' /><i class='del'></i></div>");
                    out.after(imgShow);
                }
            } else {
                imgShow = $("<div class='upfiles'>" + json.state + "<i class='del'></i></div>");
                out.after(imgShow);
            }
        } else {
            var len = json.state.length;
            for (var i = 0; i < len; i++) {
                timestr = (+new Date()).toString(36);
                if (json.state[i] == 'SUCCESS') {
                    if ($.inArray(json.type[i], images) != -1) {
                        imgShow = $("<div class='upfiles'><img src='"+ up.host+ '/api.php/upload/handle.html?pic=' + json.url[i] + "&w=200&h=200' alt='图片' title='" + json.title[i] + "' height='42'/><input type='hidden' name='" + up.inputName + "' id='" + up.inputId + timestr + "' value='" + json.url[i] + "' /><i class='del'></i></div>");
                        out.after(imgShow);
                    } else {
                        imgShow = $("<div  class='upfiles'><a href='" + json.url[i] + "'>" + json.original[i] + "</a><input type='hidden' name='" + up.inputName + "' id='" + up.inputId + timestr + "'value='" + json.url[i] + "' /><i class='del'></i></div>");
                        out.after(imgShow);
                    }
                } else {
                    imgShow = $("<div class='upfiles'>" + json.state + "<i class='del'></i></div>");
                    out.after(imgShow);
                }
            }
        }
    });

    $(document).on('click','.del',function(){
        $(this).parent('.upfiles').remove();
    });
}




