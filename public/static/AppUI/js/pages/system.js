/*
 *  Document   : system.js
 *  Author     : pixelcave
 *  Description: 系统配置页面交互脚本
 */

var System = function() {

    return {
        init: function() {
            /* Toggle .form-bordered class on block's form */
            $('.toggle-bordered').click(function() {
                $(this)
                    .parents('.block')
                    .find('form')
                    .toggleClass('form-bordered');
            });
            var title = $('a[href="/admin/system/index/config/'+fetch+'.html"]').parent().addClass('active').text();
            $('title').text(title);
        }
    };
}();