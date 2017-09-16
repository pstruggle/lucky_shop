<?php if (!defined('THINK_PATH')) exit(); /*a:1:{s:79:"D:\xampp\htdocs\shop\home\admin\controller/../view/helsinki/restrict\login.html";i:1498650630;}*/ ?>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>管理员登录</title>
	<link rel="icon" type="image/png" sizes="16x16" href="<?php echo getCache('basic')['favicon'] ? getCache('basic')['favicon']:'/favicon.ico'; ?>">
	<link rel="stylesheet" href="__ADMIN__css/reset.css" />
	<link rel="stylesheet" href="__ADMIN__css/login.css" />
	<script type="text/javascript" src="__JQUERY__jquery-2.0.0.min.js"></script>
	<script type="text/javascript" src="__ADMIN__js/login.js"></script>
</head>
<body>
<div class="page">
	<div class="loginwarrp">
		<div class="logo">管理员登陆</div>
		<div class="login_form">
			<form id="Login" name="Login" method="post" onsubmit="" action="<?php echo url('restrict/chacklogin'); ?>">
				<input type="hidden" name="url" value="<?php echo $url; ?>" />
				<ul>
					<li class="login-item">
						<span>用户名：</span>
						<input type="text" id="username" name="UserName" class="login_input" >
						<span id="count-msg" class="error"></span>
					</li>
					<li class="login-item">
						<span>密　码：</span>
						<input type="password" id="password" name="password" class="login_input" >
						<span id="password-msg" class="error"></span>
					</li>
					<li class="login-item verify">
						<span>验证码：</span>
						<input type="text" id="CheckCode" name="CheckCode" class="login_input verify_input">
						<span id="code-msg" class="error"></span>
					</li>
					<img src="<?php echo captcha_src(); ?>" border="0" class="verifyimg" />
					<div class="clearfix"></div>
					<li class="login-sub">
						<input type="submit" name="Submit" value="登录" />
						<input type="reset" name="Reset" value="重置" />
					</li>
				</ul>
			</form>
		</div>
	</div>
</div>
<script type="text/javascript">
	var chackCode = "<?php echo url('restrict/checkCode'); ?>";
    window.onload = function() {
        var config = {
            vx : 4,
            vy : 4,
            height : 2,
            width : 2,
            count : 100,
            color : "121, 162, 185",
            stroke : "100, 200, 180",
            dist : 6000,
            e_dist : 20000,
            max_conn : 10
        };
        CanvasParticle(config);
    }
</script>
<script type="text/javascript" src="__ADMIN__js/canvas-particle.js"></script>
</body>
</html>