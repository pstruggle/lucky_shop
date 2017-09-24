/*
 *  Document   : readyLogin.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Login page
 */

var ReadyLogin = function() {
    var changeImg = function () {

        $('.verifyimg').attr('src',captcha_src)
            .on('click',function () {
                $(this).attr('src',captcha_src+'?'+Math.random())
        });
    };

    return {
        init: function() {
            /*
             *  Jquery Validation, Check out more examples and documentation at https://github.com/jzaefferer/jquery-validation
             */

            /* Login form - Initialize Validation */
            $('#form-login').validate({
                errorClass: 'help-block animation-slideUp', // You can change the animation class for a different entrance animation - check animations page
                errorElement: 'div',
                errorPlacement: function(error, e) {
                    e.parents('.form-group > div').append(error);
                },
                highlight: function(e) {
                    $(e).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                    $(e).closest('.help-block').remove();
                },
                success: function(e) {
                    e.closest('.form-group').removeClass('has-success has-error');
                    e.closest('.help-block').remove();
                },
                rules: {
                    'account': {
                        required: true,
                    },
                    'check_code': {
                        required: true,
                        remote: {
                            type: "post",
                            //请求方式
                            url: checkCodeUrl,       //发送请求的url地址
                            data: {
                                code: function () {
                                    return $("#check_code").val();     //id名为“txtUserName”中的值
                                }
                            },
                            dataType: "JSON",        //发送的数据类型
                            dataFilter: function (data, type) { //返回结果
                                console.log(data);
                                var result = eval('('+eval('('+data+')')+')');
                                if (result.code === true)
                                    return true;
                                else
                                    return false;
                            }
                        }
                    },
                    'passwd': {
                        required: true,
                        minlength: 5
                    }
                },
                messages: {
                    'account': '请输入邮箱 / 手机号码',
                    'check_code': {
                        required:'请输入验证码',
                        remote: '验证码输入错误'
                    },
                    'passwd': {
                        required: '请输入登录密码',
                        minlength: '您输入的密码长度小于5'
                    }
                }
            });
            changeImg();
        }

    };
}();