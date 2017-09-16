<?php if (!defined('THINK_PATH')) exit(); /*a:3:{s:75:"D:\xampp\htdocs\shop\home\index\controller/../view/default/index\index.html";i:1500547423;s:75:"D:\xampp\htdocs\shop\home\index\controller/../view/default/base\header.html";i:1500268318;s:75:"D:\xampp\htdocs\shop\home\index\controller/../view/default/base\footer.html";i:1501389164;}*/ ?>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <title><?php echo isset($title) ? $title : ''; ?></title>
    <meta name="keywords"  content="KEYWORDS..." />
    <meta name="description" content="DESCRIPTION..." />
    <meta name="author" content="DeathGhost" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name='apple-touch-fullscreen' content='yes'>
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <meta name="format-detection" content="address=no">
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo isset($cache_config['favicon']) ? $cache_config['favicon'] : '/favicon.ico'; ?>">
    <meta name="viewport" content="initial-scale=1, width=device-width, maximum-scale=1, user-scalable=no">
    <link rel="stylesheet" type="text/css" href="__INDEX__css/style.css" />
    <script src="__INDEX__js/jquery.js"></script>
    <script src="__INDEX__js/swiper.min.js"></script>
    
    <script type="text/javascript" src="__PUBLIC__jwexin/jweixin-1.2.0.js"></script>
</head>
<body style="background:white;">
<!--header-->
<header>
    <a href="<?php echo url('Index/location'); ?>" class="location"><?php echo !empty($location['location_city'])?$location['location_city']:(!empty($location['location_province'])?$location['location_province']:'自动定位...'); ?></a>
    <h1 class="logoIcon" style="font-size:.85rem;">
        <?php /*
        <a href="<?php echo url('Index/index'); ?>">
            <img src="<?php echo isset($cache_config['web_logo']) ? $cache_config['web_logo'] : '/favicon.ico'; ?>" alt="小惠猫旅游平台" style="height: calc(100% - 10px) ; margin: 5px 0">
        </a>
        */ ?>
    </h1>
    <a href="<?php echo url('Index/search'); ?>" class="rt_searchIcon">&#37;</a>
</header>
<div style="height:1rem;"></div>
<!--slide-->
<div id="slide">
    <div class="swiper-wrapper">
        <?php if(is_array($ly_tops) || $ly_tops instanceof \think\Collection || $ly_tops instanceof \think\Paginator): $i = 0; $__LIST__ = $ly_tops;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ly_top): $mod = ($i % 2 );++$i;?>
        <div class="swiper-slide">
            <a href="<?php echo $ly_top['url']; ?>">
                <img src="<?php echo img_url($ly_top['pic'],414,160); ?>"/>
            </a>
        </div>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div class="pagination"></div>
</div>
<!--高级搜索入口-->
<div id="advanced_search" class="advaced">
    <span>高级搜索</span>目的地、出发时间、预算、天数
</div>
<!--导航栏-->
<div id="index_wrap">
    <ul class="icon_list">
        <?php if(is_array($navs) || $navs instanceof \think\Collection || $navs instanceof \think\Paginator): $i = 0; $__LIST__ = $navs;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$nav): $mod = ($i % 2 );++$i;?>
        <li class="icon">
            <a href="<?php echo $nav['hrefstr']; ?>">
                <span class="icon-circle">
                    <img src="<?php echo $nav['pic']; ?>" alt="" />
                </span>
                <span class="icon-desc"><?php echo $nav['desc']; ?></span>
            </a>
        </li>
        <?php endforeach; endif; else: echo "" ;endif; ?>
    </ul>
    <div class="hr"></div>
    <?php /*
    <div class="weather_vane">
        <div class="weather_vane_title">
            出行标签
        </div>
        <div class="weather_vane_pic" id="wrapper">
            <ul style="width: 492px; transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms; transform: translate(0px, 0px) translateZ(0px);">
                <li>
                    <a href="<?php echo url('index/trip_list',['pro_type'=>'weekend']); ?>">
                        <img src="__INDEX__images/djcx_145_145_app.png"  data-titlestr="排行榜-低价尝鲜" data-waveflag="true" data-index="4" data-load="1">
                    </a>
                </li>
                <li>
                    <a href="<?php echo url('index/trip_list',['pro_type'=>'weekend']); ?>">
                        <img src="https://images3.c-ctrip.com/dj/201611/fc/zmcy_145_145_app.png" data-titlestr="排行榜-周末出游" data-waveflag="true" data-index="5" data-load="1">
                    </a>
                </li>

            </ul>
        </div>
    </div>
    */ ?>
    <!--广告入口-->
    <div class="abtesting_ad border1px_scaley">
        <?php if(is_array($ly_contents) || $ly_contents instanceof \think\Collection || $ly_contents instanceof \think\Paginator): $k = 0; $__LIST__ = $ly_contents;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$ly_content): $mod = ($k % 2 );++$k;if($k == 1): ?>
        <div class="pic_left ads" data-index="<?php echo $k; ?>" id="pkg_BeijingHome_New<?php echo $k; ?>_app"  data-hrefstr="<?php echo $ly_content['url']; ?>">
            <img src="<?php echo $ly_content['pic']; ?>" alt="<?php echo $ly_content['subtitle']; ?>">
        </div>
        <?php else: ?>
        <div class="pic_right ads" data-index="<?php echo $k; ?>" id="pkg_BeijingHome_New<?php echo $k; ?>_app"  data-hrefstr="<?php echo $ly_content['url']; ?>">
            <img src="<?php echo $ly_content['pic']; ?>" alt="<?php echo $ly_content['subtitle']; ?>">
        </div>
        <?php endif; endforeach; endif; else: echo "" ;endif; ?>
    </div>
    <div class="preference">
        <div class="hr"></div>
        <div class="trave_box">
            <p class="trave_title"><span>旅游推荐</span></p>
            <div class="trave_tab_content">

                <div class="trave_lines">
                    <div class="trave_noting" style="display:none;">暂时没有为您推荐的旅游行程</div>
                    <?php if(is_array($trips) || $trips instanceof \think\Collection || $trips instanceof \think\Paginator): $i = 0; $__LIST__ = $trips;if( count($__LIST__)==0 ) : echo "" ;else: foreach($__LIST__ as $key=>$trip): $mod = ($i % 2 );++$i;?>
                    <div class="trave_item" data-lineid="<?php echo $trip['id']; ?>">
                        <div class="trave_item_pic">
                            <span class="trave_choiceness">为您精选</span>
                            <img src="<?php echo img_url($trip['pic'],414,160); ?>" style="height: 160px;">
                            <div class="trave_item_bg" style="height: 100%">
                                <img src="__INDEX__images/img/picbg.png" style="height: 100%">
                            </div>
                            <p><span><?php echo $trip['destination']; ?></span></p>
                        </div>
                    </div>
                    <?php endforeach; endif; else: echo "" ;endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="height:1.2rem;" class="foo"></div>
<nav>
    <a href="<?php echo url('Index/index'); ?>" class="homeIcon">首页</a>
    <a href="<?php echo url('Mall/index'); ?>" class="categoryIcon">商城</a>
    <a href="<?php echo url('Mall/cart'); ?>" class="cartIcon">购物车</a>
    <a href="<?php echo url('user/user'); ?>" class="userIcon">我的</a>
</nav>
<script type="text/javascript" src="__JQUERY__jquery.cookie.js"></script>
<script>
    document.oncontextmenu=new Function("event.returnValue=false;");
    document.onselectstart=new Function("event.returnValue=false;");
    $(function(){
        //飞入动画，具体根据实际情况调整
        $(".addToCart").bind('click',toCart);
        function toCart() {
            var gid = $(this).data('gid');
            var data = {"gid": gid};
            var self = $(this);
            $.ajaxSetup({async: false});
            $.get('<?php echo url("Mall/ajax_cart"); ?>', data, function (data) {
                var data = eval('(' + data + ')');
                $(".hoverCart a").html(data.num);
                $(".topCart em").html(data.num);
                if (data.code == 1) {
                    var shopOffset = $(".hoverCart").offset();
                    var cloneDiv = self.parent().siblings(".goodsPic").clone();
                    var proOffset = self.parent().siblings(".goodsPic").offset();
                    cloneDiv.css({"position": "absolute", "top": proOffset.top, "left": proOffset.left});
                    self.parent().siblings(".goodsPic").parent().append(cloneDiv);
                    cloneDiv.animate({
                        width: 0,
                        height: 0,
                        left: shopOffset.left,
                        top: shopOffset.top,
                        opacity: 1
                    }, "slow");
                    return true;
                } else if (data.code == -1) {
                    location.href = data.url;
                }
                alert(data.info);
                return false;
            });
        }
    });
    wx.config({
        debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
        appId: '<?php echo isset($signPackage['appId']) ? $signPackage['appId'] : ""; ?>', // 必填，公众号的唯一标识
        timestamp: '<?php echo isset($signPackage['timestamp']) ? $signPackage['timestamp'] : ""; ?>', // 必填，生成签名的时间戳
        nonceStr: '<?php echo isset($signPackage['nonceStr']) ? $signPackage['nonceStr'] : ""; ?>', // 必填，生成签名的随机串
        signature: '<?php echo isset($signPackage['signature']) ? $signPackage['signature'] : ""; ?>',// 必填，签名，见附录1
        jsApiList: [
            'onMenuShareTimeline',
            'onMenuShareAppMessage',
            'onMenuShareQQ',
            'onMenuShareWeibo',
            'onMenuShareQZone',
            'startRecord',
            'stopRecord',
            'onVoiceRecordEnd',
            'playVoice',
            'pauseVoice',
            'stopVoice',
            'onVoicePlayEnd',
            'uploadVoice',
            'downloadVoice',
            'previewImage',
            'downloadImage',
            'translateVoice',
            'getNetworkType',
            'openLocation',
            'getLocation',
            'hideOptionMenu',
            'showOptionMenu',
            'hideMenuItems',
            'showMenuItems',
            'hideAllNonBaseMenuItem',
            'showAllNonBaseMenuItem',
            'closeWindow',
            'scanQRCode',
            'chooseWXPay',
            'openProductSpecificView',
            'addCard',
            'chooseCard',
            'openCard'
        ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
    });
    wx.ready(function () {
        var title = '',
            url = "<?php echo $signPackage['url']; ?>",
            host = window.location.origin,
            img = $('img').attr('src'),
            desc = '做旅游我们是认真的';
//        if(url.indexOf('?')>0){
//            url += '&salesman=<?php echo encrypt(10009); ?>'
//        }else {
//            url += '?salesman=<?php echo encrypt(10009); ?>'
//        }
        if(url.indexOf('?')>0){
            url += '&salesman=<?php echo encrypt($userinfo['id'] ); ?>';
        }else {
            url += '?salesman=<?php echo encrypt($userinfo['id'] ); ?>';
        }
        if(img && img.indexOf('//') < 0){
            img = host + img;
        }
        var share = {
            title: title, // 分享标题
            desc: desc, // 分享描述
            link: url, // 分享链接，该链接域名或路径必须与当前页面对应的公众号JS安全域名一致
            imgUrl: img, // 分享图标
            type: '', // 分享类型,music、video或link，不填默认为link
            dataUrl: '', // 如果type是music或video，则要提供数据链接，默认为空
            success: function () {
                // 用户确认分享后执行的回调函数
            },
            cancel: function () {
                // 用户取消分享后执行的回调函数
            }
        }
        //分享朋友圈
        wx.onMenuShareTimeline(share);
        //分享给朋友
        wx.onMenuShareAppMessage(share);
        //分享QQ
        wx.onMenuShareQQ(share);
        //分享腾讯微博
        wx.onMenuShareWeibo(share);
        //分享QQ空间
        wx.onMenuShareQZone(share);
    });

</script>
</body>
</html>

<script type="text/javascript" src="__INDEX__/js/js.js"></script>
<script>
    $(function(){
        var mySwiper = new Swiper('#slide',{
            autoplay:5000,
            visibilityFullFit : true,
            loop:true,
            pagination : '.pagination',
        });
        //product list:Tab
        $(".tab_proList dd").eq(0).show().siblings(".tab_proList dd").hide();
        $(".tab_proList dt a").eq(0).addClass("currStyle");
        $(".tab_proList dt a").click(function(){
            var liindex = $(".tab_proList dt a").index(this);
            $(this).addClass("currStyle").siblings().removeClass("currStyle");
            $(".tab_proList dd").eq(liindex).fadeIn(150).siblings(".tab_proList dd").hide();
        });
        $('#advanced_search').click(function () {
            location.href = "<?php echo url('Index/advanced'); ?>";
        });

        var X = 0,
            x = 0,
            state = 0;
        $("#wrapper ul").on('touchmove',function (event) {
            var start_x = event.originalEvent.targetTouches[0].clientX + document.body.scrollLeft - document.body.clientLeft;
            x = -(X - start_x);
            $(this).css('transform',"translate("+x+"px,0px)")
        }).on('touchstart',function (event) {
            var start_x = event.originalEvent.targetTouches[0].clientX + document.body.scrollLeft - document.body.clientLeft;
            X = start_x;
        }).on('touchend',function (event) {
            var wrip_width = $('#wrapper').width(),
                ul_width = $('#wrapper ul').width(),
                cha_width = wrip_width - ul_width;
            if(x>0){
                x = 0;
                $(this).css('transform',"translate("+x+"px,0px)")

            }
            if(x<0 && x < cha_width){
                x = cha_width;
                $(this).css('transform',"translate("+x+"px,0px)")
            }
        });
        $('.trave_tab li').on('click',function () {
            $(this).addClass('cur').siblings().removeClass('cur');
            var index = $(this).index();
            $('.trave_name_'+index).show().siblings('.trave_name').hide();
        });
        var item = $('.trave_item');
        if(item.length == 0){
            $('.trave_noting').show();
        }
        item.on('click',function () {
            var lineid = $(this).data('lineid');
            location.href = "<?php echo url('index/details'); ?>?pid="+lineid;
        });
        $('.abtesting_ad .ads').on('click',function () {
            location.href = $(this).data('hrefstr');
        });
        var type = "<?php echo $userinfo['type']; ?>";
    });
</script>