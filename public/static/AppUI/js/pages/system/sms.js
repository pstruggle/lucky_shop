/*
 *  Document   : sms.js
 *  Author     : pixelcave
 *  Description: 短信配置交互配置js
 */

var Sms = function() {

    return {
        init: function() {
            $('#send_mode').val(send_mode);
            $('.is_true').each(function () {
                var val = $(this).val(),
                    name = $(this).attr('name'),
                    check = false;
                if(val == '1'){
                    check = true;
                }
                $('#'+name).on('change',function () {
                    var id = $(this).attr('id'),
                        input = $('input[name="'+id+'"]');
                    if($(this).is(':checked')){
                        input.val(1)
                    }else{
                        input.val(0)

                    }
                }).prop('checked',check);
            });

        }
    };
}();