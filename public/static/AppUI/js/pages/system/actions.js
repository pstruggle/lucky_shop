/*
 *  Document   : action.js
 *  Author     : pixelcave
 *  Description: 短信配置交互配置js
 */

var Actions = function() {

    return {
        init: function() {
            App.edit();
            $('#send_mode').val(send_mode);
        }
    };
}();