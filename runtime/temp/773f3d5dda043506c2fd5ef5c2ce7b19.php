<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:61:"D:\xampp\htdocs\lucky_shop\public/static/tpl/rewrite_jump.tpl";i:1500692605;}*/ ?>
<!doctype html>
<html lang="en" class="error-404">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <title>跳转提示</title>
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo empty(getCache('basic')['favicon']) ?'/favicon.ico':getCache('basic')['favicon'];?>">
    <link rel="stylesheet" type="text/css" href="__HELSINKI__stylesheets/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="__HELSINKI__stylesheets/css/font-awesome.min.css">
    <link rel="stylesheet" href="__HELSINKI__vendor/animate.css/animate.css">
    <link rel="stylesheet" href="__HELSINKI__stylesheets/css/style.css">
</head>

<body>
<div class="wrap">
    <div class="page-body">
        <div class="row animated bounce ">
            <div class="col-sm-8 col-sm-offset-2">
                <div class="panel mt-xlg">
                    <div class="panel-content">
                        <h1 class="error-number">
                            <?php switch ($code) {case 1:?>
                            (﹡ˆoˆ﹡)
                            <?php break;case 0:?>
                            ╥﹏╥
                            <?php break;} ?>
                        </h1>
                        <h2 class="error-name"><?php echo(strip_tags($msg));?></h2>
                        <p class="error-text">等待时间：<b id="wait"><?php echo($wait);?></b>s页面自动跳转</p>
                        <div class="row mt-xlg">
                            <div class="col-sm-6  col-sm-offset-3">
                                <a id="href" href="<?php echo($url);?>" class="btn btn-sm btn-darker-2 btn-block" >点击跳转</a>
                                <!--<a href="http://myiideveloper.com/helsinki/helsinki-green/dashboard.html" class="btn btn-sm btn-primary btn-block">Dashboard</a>-->
                                <a href="javascript:void (0);" class="btn btn-sm btn-lighter-2 btn-block mb-xlg">FAQ</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="__JQUERY__jquery-2.0.0.min.js"></script>
<script type="text/javascript" src="__BOOTSTRAP__bootstrap.min.js"></script>
<script src="__HELSINKI__vendor/nano-scroller/nano-scroller.js"></script>
<script src="__HELSINKI__javascripts/template-script.min.js"></script>
<script src="__HELSINKI__javascripts/template-init.min.js"></script>
<script type="text/javascript">
    (function(){
        var wait = document.getElementById('wait'),
            href = document.getElementById('href').href;
        var interval = setInterval(function(){
            var time = --wait.innerHTML;
            if(time <= 0) {
                location.href = href;
                clearInterval(interval);
            };
        }, 1000);
    })();
</script>
</body>
</html>
