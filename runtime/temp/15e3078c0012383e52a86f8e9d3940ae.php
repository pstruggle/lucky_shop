<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:86:"D:\xampp\htdocs\shop\home\common\controller/../view/appui/restrict/index\register.html";i:1505376161;s:93:"D:\xampp\htdocs\shop\home\common\controller/../view/appui/restrict/..\common\after\frame.html";i:1505282683;}*/ ?>

<!DOCTYPE html>
<!--[if IE 9]>         <html class="no-js lt-ie10" lang="en"> <![endif]-->
<!--[if gt IE 9]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<head>
    <meta charset="utf-8">

    <title><?php echo isset($title) ? $title :  ''; ?></title>

    <meta name="description" content="">
    <meta name="author" content="pixelcave">
    <meta name="robots" content="noindex, nofollow">

    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">

    <!-- Icons -->
    <!-- The following icons can be replaced with your own, they are used by desktop and mobile browsers -->
    <link rel="shortcut icon" href="img/favicon.png">
    <link rel="apple-touch-icon" href="img/icon57.png" sizes="57x57">
    <link rel="apple-touch-icon" href="img/icon72.png" sizes="72x72">
    <link rel="apple-touch-icon" href="img/icon76.png" sizes="76x76">
    <link rel="apple-touch-icon" href="img/icon114.png" sizes="114x114">
    <link rel="apple-touch-icon" href="img/icon120.png" sizes="120x120">
    <link rel="apple-touch-icon" href="img/icon144.png" sizes="144x144">
    <link rel="apple-touch-icon" href="img/icon152.png" sizes="152x152">
    <link rel="apple-touch-icon" href="img/icon180.png" sizes="180x180">
    <!-- END Icons -->

    <!-- Stylesheets -->
    <!-- Bootstrap is included in its original form, unaltered -->
    <link rel="stylesheet" href="__APPUI__css/bootstrap.min.css">

    <!-- Related styles of various icon packs and plugins -->
    <link rel="stylesheet" href="__APPUI__css/plugins.css">

    <!-- The main stylesheet of this template. All Bootstrap overwrites are defined in here -->
    <link rel="stylesheet" href="__APPUI__css/main.css">

    <!-- Include a specific file here from css/themes/ folder to alter the default theme of the template -->

    <!-- The themes stylesheet of this template (for using specific theme color in individual elements - must included last) -->
    <link rel="stylesheet" href="__APPUI__css/themes.css">
    <!-- END Stylesheets -->

    <!-- Modernizr (browser feature detection library) -->
    <script src="__APPUI__js/vendor/modernizr-3.3.1.min.js"></script>
    <script>
        var themes = '__APPUI__css/themes.css';
    </script>
</head>
<body>
<!-- Page Wrapper -->
<!-- In the PHP version you can set the following options from inc/config file -->
<!--
    Available classes:

    'page-loading'      enables page preloader
-->

<div id="login-container">
    <!-- Register Header -->
    <h1 class="h2 text-light text-center push-top-bottom animation-slideDown">
        <i class="fa fa-plus"></i> <strong>创建新账户</strong>
    </h1>
    <!-- END Register Header -->

    <!-- Register Form -->
    <div class="block animation-fadeInQuickInv">
        <!-- Register Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a href="<?php echo url('restrict/Index/index'); ?>" class="btn btn-effect-ripple btn-primary" data-toggle="tooltip" data-placement="left" title="去登录"><i class="fa fa-user"></i></a>
            </div>
            <h2>注册</h2>
        </div>
        <!-- END Register Title -->

        <!-- Register Form -->
        <form id="form-register" action="" method="post" class="form-horizontal">
            <div class="form-group">
                <div class="col-xs-12">
                    <input type="text" id="nickname" name="nickname" class="form-control" placeholder="您的昵称">
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <div class="input-group">
                        <div class="input-group-btn">
                            <button type="button"  class="btn btn-effect-ripple btn-primary dropdown-toggle" data-toggle="dropdown">邮箱注册 <span class="caret"></span></button>
                            <input type="hidden" name="reg_type" id="reg_type" value="email">
                            <ul class="dropdown-menu">
                                <li data-type="email"><a href="javascript:void(0)">邮箱注册</a></li>
                                <li data-type="phone"><a href="javascript:void(0)">手机注册</a></li>
                            </ul>
                        </div>
                        <input type="text" id="account" name="email" class="form-control" placeholder="邮箱注册">
                    </div>

                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-8">
                    <input type="password" id="check_code" name="check_code" class="form-control" placeholder="验证码">
                </div>
                <div class="col-xs-4">
                    <img src="" border="0" class="verifyimg" title="看不清？" />
                </div>
            </div>
            <div class="form-group hidden">
                <div class="col-xs-8">
                    <input type="text" id="sms_code" name="sms_code" class="form-control" placeholder="短信验证码">
                </div>
                <div class="col-xs-4">
                    <button type="button" class="btn btn-effect-ripple btn-primary disabled" id="send_sms">发送验证码</button>
                    <!--btn btn-effect-ripple btn-danger ui-wizard-content ui-formwizard-button btn-primary-->
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <input type="password" id="password" name="password" class="form-control" placeholder="密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-12">
                    <input type="password" id="password_verify" name="password_verify" class="form-control" placeholder="确认密码">
                </div>
            </div>
            <div class="form-group form-actions">
                <div class="col-xs-6">
                    <label class="csscheckbox csscheckbox-primary" data-toggle="tooltip" title="Agree to the terms">
                        <input type="checkbox" id="terms" name="terms">
                        <span></span>
                    </label>
                    <a href="#modal-terms" data-toggle="modal">注册必读</a>
                </div>
                <div class="col-xs-6 text-right">
                    <button type="submit" class="btn btn-effect-ripple btn-success"><i class="fa fa-plus"></i> 注册账号</button>
                </div>
            </div>
        </form>
        <!-- END Register Form -->
    </div>
    <!-- END Register Block -->

    <!-- Footer -->
    <footer class="text-muted text-center animation-pullUp">
        <small><span id="year-copy"></span> &copy; <a href="http://goo.gl/RcsdAh" target="_blank">AppUI 2.7</a></small>
    </footer>
    <!-- END Footer -->
</div>
<!-- END Login Container -->

<!-- Modal Terms -->
<div id="modal-terms" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center"><strong>Terms and Conditions</strong></h3>
            </div>
            <div class="modal-body">
                <h4 class="page-header">1. <strong>General</strong></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                <h4 class="page-header">2. <strong>Account</strong></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                <h4 class="page-header">3. <strong>Service</strong></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
                <h4 class="page-header">4. <strong>Payments</strong></h4>
                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ultrices, justo vel imperdiet gravida, urna ligula hendrerit nibh, ac cursus nibh sapien in purus. Mauris tincidunt tincidunt turpis in porta. Integer fermentum tincidunt auctor.</p>
            </div>
            <div class="modal-footer">
                <div class="text-center">
                    <button type="button" class="btn btn-effect-ripple btn-sm btn-primary" data-dismiss="modal">I've read them!</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- END Modal Terms -->


<!-- END Page Wrapper -->

<!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
<script src="__APPUI__js/vendor/jquery-2.2.4.min.js"></script>
<script src="__APPUI__js/vendor/bootstrap.min.js"></script>
<script src="__APPUI__js/plugins.js"></script>
<script src="__APPUI__js/app.js"></script>

<!-- Load and execute javascript code used only in this page -->


<!-- Load and execute javascript code used only in this page -->
<script src="__APPUI__js/pages/readyRegister.js"></script>
<script>
    var checkCodeUrl = "<?php echo url('restrict/Index/checkcode'); ?>";
    var captcha_src = "<?php echo captcha_src(); ?>";
    var send_sms_url = "<?php echo captcha_src(); ?>";
    $(function(){ ReadyRegister.init(); });
</script>





</body>
</html>