<?php if (!defined('THINK_PATH')) exit(); /*a:2:{s:83:"D:\xampp\htdocs\shop\home\common\controller/../view/appui/restrict/index\index.html";i:1505361010;s:93:"D:\xampp\htdocs\shop\home\common\controller/../view/appui/restrict/..\common\after\frame.html";i:1505282683;}*/ ?>

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

<!-- Full Background -->
<!-- For best results use an image with a resolution of 1280x1280 pixels (prefer a blurred image for smaller file size) -->
<img src="__APPUI__img/placeholders/layout/login2_full_bg.jpg" alt="Full Background" class="full-bg animation-pulseSlow">
<!-- END Full Background -->

<!-- Login Container -->
<div id="login-container">
    <!-- Login Header -->
    <h1 class="h2 text-light text-center push-top-bottom animation-pullDown">
        <i class="fa fa-cube text-light-op"></i> <strong>AppUI</strong>
    </h1>
    <!-- END Login Header -->

    <!-- Login Block -->
    <div class="block animation-fadeInQuick">

        <!-- Login Title -->
        <div class="block-title">
            <div class="block-options pull-right">
                <a href="page_ready_reminder.html" class="btn btn-effect-ripple btn-primary" data-toggle="tooltip" data-placement="left" title="忘记您的密码？">
                    <i class="fa fa-exclamation-circle"></i>
                </a>
                <a href="<?php echo url('restrict/Index/register'); ?>" class="btn btn-effect-ripple btn-primary" data-toggle="tooltip" data-placement="left" title="注册新账户">
                    <i class="fa fa-plus"></i>
                </a>
            </div>

            <h2>请登录</h2>
        </div>
        <!-- END Login Title -->

        <!-- Login Form -->
        <form id="form-login" action="<?php echo url('admin/index/index'); ?>" method="post" class="form-horizontal">
            <div class="form-group">
                <label for="account" class="col-xs-12">邮箱 / 手机号码</label>
                <div class="col-xs-12">
                    <input type="text" id="account" name="account" class="form-control" placeholder="邮箱 / 手机号码">
                </div>
            </div>
            <div class="form-group">
                <label for="passwd" class="col-xs-12">密码</label>
                <div class="col-xs-12">
                    <input type="password" id="passwd" name="passwd" class="form-control" placeholder="您的密码...">
                </div>
            </div>
            <div class="form-group">
                <label for="check_code" class="col-xs-12">验证码</label>
                <div class="col-xs-8">
                    <input type="text" id="check_code" name="check_code" class="form-control" placeholder="验证码">
                </div>
                <div class="col-xs-4">
                    <img src="" border="0" class="verifyimg" title="看不清？" />
                </div>
            </div>
            <div class="form-group form-actions">
                <div class="col-xs-8">
                    <label class="csscheckbox csscheckbox-primary">
                        <input type="checkbox" id="login-remember-me" name="login-remember-me"><span></span> 记住我?
                    </label>
                </div>
                <div class="col-xs-4 text-right">
                    <button type="submit" class="btn btn-effect-ripple btn-sm btn-success">登录</button>
                </div>
            </div>
        </form>
        <!-- END Login Form -->

        <!-- Social Login -->
        <!-- END Social Login -->
    </div>
    <!-- END Login Block -->

    <!-- Footer -->
    <footer class="text-muted text-center animation-pullUp">
        <small><span id="year-copy"></span> &copy; <a href="http://goo.gl/RcsdAh" target="_blank">AppUI 2.7</a></small>
    </footer>
    <!-- END Footer -->
</div>
<!-- END Login Container -->


<!-- END Page Wrapper -->

<!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
<script src="__APPUI__js/vendor/jquery-2.2.4.min.js"></script>
<script src="__APPUI__js/vendor/bootstrap.min.js"></script>
<script src="__APPUI__js/plugins.js"></script>
<script src="__APPUI__js/app.js"></script>

<!-- Load and execute javascript code used only in this page -->


<script src="__APPUI__js/pages/readyLogin.js"></script>
<script>
    var checkCodeUrl = "<?php echo url('restrict/Index/checkcode'); ?>";
    var captcha_src = "<?php echo captcha_src(); ?>";
    $(function(){
        ReadyLogin.init();
    });
</script>


</body>
</html>