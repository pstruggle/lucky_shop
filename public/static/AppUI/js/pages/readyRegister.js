/*
 *  Document   : readyRegister.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Register page
 */

var ReadyRegister = function() {
    // 更换验证码图片
    var changeImg = function () {

        $('.verifyimg').attr('src',captcha_src)
            .on('click',function () {
                $(this).attr('src',captcha_src+'?'+Math.random())
            });
    };
    // 发送验证码
    var send_sms = function () {
        var _this =  $('#send_sms');
        var send_code = function (e) {
            if($(this).hasClass('disabled')){
                return false;
            }
            _this.addClass('disabled');
            var phone = $('input[name="phone"]').val();
            var data = {phone:phone,scene:'scene_reg'};
            $.post(send_sms_url,data,function (result) {
                var result = eval('(' + result + ')');
                if (result.code == '0') {
                    count_down();
                } else {
                    alert(result.info);
                    _this.text('发送验证码').removeClass('disabled').click(send_code)
                }
            });
        };
        var count_down =  function () {
            var  times = 60,text='';
            a = setInterval(function () {
                times -- ;
                if(times == 0){
                    _this.text('发送验证码').removeClass('disabled').click(send_code);
                    clearInterval(a);
                    return true;
                }
                _this.addClass('disabled');
                text = ''+times+'s重新发送';
                _this.text(text);
            },1000);
        };
        _this.on('click',send_code);
    };
    return {
        init: function() {
            changeImg();
            send_sms();
            /*
             *  Jquery Validation, Check out more examples and documentation at https://github.com/jzaefferer/jquery-validation
             */
            $.validator.addMethod('isMobile',function (v,e) {
                var length = v.length;
                var mobile = /^1[0-9]{10}$/;
                return this.optional(e) || (length == 11 && mobile.test(v));
            },'请输入正确的手机号码');
            $.validator.addMethod('isNickname',function (v,e) {
                var number = /^[0-9]+$/;
                var char = /^[a-zA-Z0-9_\u4e00-\u9fa5]+$/;
                console.log(number.test(v),char.test(v),this.optional(e),this.optional(e) || number.test(v) && char.test(v));
                var result = false;
                if(!number.test(v)){
                    if(char.test(v)){
                        result = true;
                    }
                }
                return this.optional(e) || result;
            },'用户名仅支持中英文、数字和下划线,且不能为纯数字');
            var phone_status = false, check_code_status = false;
            /* Register form - Initialize Validation */
            $('#form-register').validate({
                errorClass: 'help-block animation-slideUp', // You can change the animation class for a different entrance animation - check animations page
                errorElement: 'div',
                errorPlacement: function(error, e) {

                    if(e[0]==$('input[name="phone"]')[0]) phone_status = false;
                    if(e[0]==$('input[name="check_code"]')[0]) check_code_status = false;
                    if( !phone_status || !check_code_status ){
                        $('#send_sms').addClass('disabled');
                    }
                    e.parents('.form-group > div').append(error);
                },
                highlight: function(e) {
                    $(e).closest('.form-group').removeClass('has-success has-error').addClass('has-error');
                    $(e).closest('.help-block').remove();
                },
                success: function(error,e) {
                    if(e == $('input[name="phone"]')[0]) phone_status = true;
                    if(e == $('input[name="check_code"]')[0]) check_code_status = true;
                    if(phone_status && check_code_status ){
                        $('#send_sms').removeClass('disabled');
                    }
                    if (error.closest('.form-group').find('.help-block').length === 2) {
                        error.closest('.help-block').remove();
                    } else {
                        error.closest('.form-group').removeClass('has-success has-error');
                        error.closest('.help-block').remove();
                    }
                },
                rules: {
                    'nickname': {
                        required: true,
                        isNickname: true,
                        minlength: 2,
                        maxlength: 16
                    },
                    'email': {
                        required: true,
                        email: true
                    },
                    'phone': {
                        required: true,
                        isMobile: true
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
                                var result = eval('('+eval('('+data+')')+')');
                                if (result.code === true)
                                    return true;
                                else
                                    return false;
                            }
                        }
                    },
                    'sms_code': {
                        required: true,
                        remote: {
                            type: "post",
                            //请求方式
                            url: checkSmsUrl,       //发送请求的url地址
                            data: {
                                code: function () {
                                    return $("#sms_code").val();     //id名为“txtUserName”中的值
                                }
                            },
                            dataType: "JSON",        //发送的数据类型
                            dataFilter: function (data, type) { //返回结果
                                console.log(data);
                                if (data == 'true')
                                    return true;
                                else
                                    return false;
                            }
                        }
                    },
                    'passwd': {
                        required: true,
                        minlength: 5
                    },
                    'passwd_verify': {
                        required: true,
                        equalTo: '#passwd'
                    },
                    'terms': {
                        required: true
                    }
                },
                messages: {
                    'nickname': {
                        required: '请输入您的昵称',
                        minlength: '有点短哦！(>2)',
                        maxlength: '你那么长人家受不了!(<16)'
                    },
                    'email': '请输入正确的电子邮件',
                    'phone': '请输入正确的手机号码',
                    'check_code': {
                        required:'请输入验证码',
                        remote: '验证码输入错误'
                    },
                    'sms_code':{
                        required:'请输入短信验证码',
                        remote: '短信验证码输入错误'
                    },
                    'passwd': {
                        required: '请输入注册密码',
                        minlength: '您这也太短了吧！(>5)'
                    },
                    'passwd_verify': {
                        required: '请确认您的注册密码',
                        minlength: '您这也太短了吧！(>5)',
                        equalTo: '您两次密码输入不一致哦！'
                    },
                    'terms': {
                        required: '必须确认您认同我们的规则哦！'
                    }
                }
            });
            $('.dropdown-menu').on('click','li',function () {
                var desc = $(this).text(),
                    val = $(this).data('type');
                 $('#reg_type').val(val);
                 $('.dropdown-toggle').html(desc +'<span class="caret"></span>');
                 $('#account').attr({name:val,placeholder:desc});
                 if(val == 'phone'){
                     $('#sms_code').closest('.form-group').removeClass('hidden');
                 }else {
                     $('#sms_code').closest('.form-group').addClass('hidden');
                 }
            });
        }
    };
}();