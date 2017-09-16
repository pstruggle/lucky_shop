<?php if (!defined('THINK_PATH')) exit(); /*a:5:{s:73:"D:\xampp\htdocs\shop\home\admin\controller/../view/appui/index\index.html";i:1505264935;s:74:"D:\xampp\htdocs\shop\home\admin\controller/../view/appui/common\frame.html";i:1505282683;s:74:"D:\xampp\htdocs\shop\home\admin\controller/../view/appui/common\right.html";i:1505198697;s:73:"D:\xampp\htdocs\shop\home\admin\controller/../view/appui/common\left.html";i:1505273659;s:75:"D:\xampp\htdocs\shop\home\admin\controller/../view/appui/common\navbar.html";i:1505199279;}*/ ?>

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

<div id="page-wrapper" class="page-loading">
    <!-- Preloader -->
    <!-- Preloader functionality (initialized in js/app.js) - pageLoading() -->
    <!-- Used only if page preloader enabled from inc/config (PHP version) or the class 'page-loading' is added in #page-wrapper element (HTML version) -->

    <div class="preloader">
        <div class="inner">
            <!-- Animation spinner for all modern browsers -->
            <div class="preloader-spinner themed-background hidden-lt-ie10"></div>

            <!-- Text for IE9 -->
            <h3 class="text-primary visible-lt-ie10"><strong>Loading..</strong></h3>
        </div>
    </div>
    <!-- END Preloader -->

    <!-- Page Container -->
    <!-- In the PHP version you can set the following options from inc/config file -->
    <!--
        Available #page-container classes:

        'sidebar-light'                                 for a light main sidebar (You can add it along with any other class)

        'sidebar-visible-lg-mini'                       main sidebar condensed - Mini Navigation (> 991px)
        'sidebar-visible-lg-full'                       main sidebar full - Full Navigation (> 991px)

        'sidebar-alt-visible-lg'                        alternative sidebar visible by default (> 991px) (You can add it along with any other class)

        'header-fixed-top'                              has to be added only if the class 'navbar-fixed-top' was added on header.navbar
        'header-fixed-bottom'                           has to be added only if the class 'navbar-fixed-bottom' was added on header.navbar

        'fixed-width'                                   for a fixed width layout (can only be used with a static header/main sidebar layout)

        'enable-cookies'                                enables cookies for remembering active color theme when changed from the sidebar links (You can add it along with any other class)
    -->
    <div id="page-container" class="header-fixed-top sidebar-visible-lg-full enable-cookies">
        <!-- Alternative Sidebar -->
        <div id="sidebar-alt" tabindex="-1" aria-hidden="true">
    <!-- Toggle Alternative Sidebar Button (visible only in static layout) -->
    <a href="javascript:void(0)" id="sidebar-alt-close" onclick="App.sidebar('toggle-sidebar-alt');"><i class="fa fa-times"></i></a>

    <!-- Wrapper for scrolling functionality -->
    <div id="sidebar-scroll-alt">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- Profile -->
            <div class="sidebar-section">
                <h2 class="text-light">Profile</h2>
                <form action="index.html" method="post" class="form-control-borderless" onsubmit="return false;">
                    <div class="form-group">
                        <label for="side-profile-name">Name</label>
                        <input type="text" id="side-profile-name" name="side-profile-name" class="form-control" value="John Doe">
                    </div>
                    <div class="form-group">
                        <label for="side-profile-email">Email</label>
                        <input type="email" id="side-profile-email" name="side-profile-email" class="form-control" value="john.doe@example.com">
                    </div>
                    <div class="form-group">
                        <label for="side-profile-password">New Password</label>
                        <input type="password" id="side-profile-password" name="side-profile-password" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="side-profile-password-confirm">Confirm New Password</label>
                        <input type="password" id="side-profile-password-confirm" name="side-profile-password-confirm" class="form-control">
                    </div>
                    <div class="form-group remove-margin">
                        <button type="submit" class="btn btn-effect-ripple btn-primary" onclick="App.sidebar('close-sidebar-alt');">Save</button>
                    </div>
                </form>
            </div>
            <!-- END Profile -->

            <!-- Settings -->
            <div class="sidebar-section">
                <h2 class="text-light">Settings</h2>
                <form action="index.html" method="post" class="form-horizontal form-control-borderless" onsubmit="return false;">
                    <div class="form-group">
                        <label class="col-xs-7 control-label-fixed">Notifications</label>
                        <div class="col-xs-5">
                            <label class="switch switch-success"><input type="checkbox" checked><span></span></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-7 control-label-fixed">Public Profile</label>
                        <div class="col-xs-5">
                            <label class="switch switch-success"><input type="checkbox" checked><span></span></label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-xs-7 control-label-fixed">Enable API</label>
                        <div class="col-xs-5">
                            <label class="switch switch-success"><input type="checkbox"><span></span></label>
                        </div>
                    </div>
                    <div class="form-group remove-margin">
                        <button type="submit" class="btn btn-effect-ripple btn-primary" onclick="App.sidebar('close-sidebar-alt');">Save</button>
                    </div>
                </form>
            </div>
            <!-- END Settings -->
        </div>
        <!-- END Sidebar Content -->
    </div>
    <!-- END Wrapper for scrolling functionality -->
</div>

        <!-- END Alternative Sidebar -->

        <!-- Main Sidebar -->
        <div id="sidebar">
    <!-- Sidebar Brand -->
    <div id="sidebar-brand" class="themed-background">
        <a href="index.html" class="sidebar-title">
            <i class="fa fa-cube"></i> <span class="sidebar-nav-mini-hide">App<strong>UI</strong></span>
        </a>
    </div>
    <!-- END Sidebar Brand -->

    <!-- Wrapper for scrolling functionality -->
    <div id="sidebar-scroll">
        <!-- Sidebar Content -->
        <div class="sidebar-content">
            <!-- Sidebar Navigation -->
            <ul class="sidebar-nav">
                <li>
                    <a href="<?php echo url('admin/index/index'); ?>"><i class="gi gi-compass sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">概览</span></a>
                </li>
                <li class="sidebar-separator">
                    <i class="fa fa-ellipsis-h"></i>
                </li>
                <li>
                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="fa fa-rocket sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">系统设置</span></a>
                    <ul>
                        <li>
                            <a href="<?php echo url('admin/index/config'); ?>">商城设置</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/table'); ?>">配送方式</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">计划任务</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">友情链接</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">自定义导航栏</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">广告管理</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">邮件发送日志</a>
                        </li>

                    </ul>
                </li>
                <li>
                    <a href="#" class="sidebar-nav-menu"><i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i><i class="gi gi-airplane sidebar-nav-icon"></i><span class="sidebar-nav-mini-hide">商品管理</span></a>
                    <ul>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">商品分类</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">商品列表</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">订单列表</a>
                        </li>
                        <li>
                            <a href="<?php echo url('admin/index/index'); ?>">用户评论</a>
                        </li>
                        <li>
                            <a href="page_comp_calendar.html">库存日志</a>
                        </li>
                        <li>
                            <a href="#" class="sidebar-nav-submenu"><i class="fa fa-chevron-left sidebar-nav-indicator"></i>促销管理</a>
                            <ul>
                                <li>
                                    <a href="page_forms_components.html">抢购管理</a>
                                </li>
                                <li>
                                    <a href="page_forms_wizard.html">团购管理</a>
                                </li>
                                <li>
                                    <a href="page_forms_validation.html">优惠管理</a>
                                </li>
                                <li>
                                    <a href="page_forms_validation.html">订单促销</a>
                                </li>
                                <li>
                                    <a href="page_forms_validation.html">拼团管理</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="sidebar-nav-menu">
                        <i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i>
                        <i class="gi gi-more_items sidebar-nav-icon"></i>
                        <span class="sidebar-nav-mini-hide">会员管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="page_layout_static.html">会员列表</a>
                        </li>
                        <li>
                            <a href="page_layout_static_fixed_width.html">充值列表</a>
                        </li>
                        <li>
                            <a href="page_layout_fixed_top.html">会员等级设置</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#" class="sidebar-nav-menu">
                        <i class="fa fa-chevron-left sidebar-nav-indicator sidebar-nav-mini-hide"></i>
                        <i class="gi gi-more_items sidebar-nav-icon"></i>
                        <span class="sidebar-nav-mini-hide">权限管理</span>
                    </a>
                    <ul>
                        <li>
                            <a href="page_layout_static.html">管理员管理</a>
                        </li>
                        <li>
                            <a href="page_layout_static_fixed_width.html">权限分组</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- END Sidebar Navigation -->

            <!-- Color Themes -->
            <!-- Preview a theme on a page functionality can be found in js/app.js - colorThemePreview() -->
            <div class="sidebar-section sidebar-nav-mini-hide">
                <div class="sidebar-separator push">
                    <i class="fa fa-ellipsis-h"></i>
                </div>
                <ul class="sidebar-themes clearfix">
                    <li>
                        <a href="javascript:void(0)" class="themed-background-default" data-toggle="tooltip" title="Default" data-theme="default" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-default"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-classy" data-toggle="tooltip" title="Classy" data-theme="__APPUI__css/themes/classy.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-classy"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-social" data-toggle="tooltip" title="Social" data-theme="__APPUI__css/themes/social.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-social"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-flat" data-toggle="tooltip" title="Flat" data-theme="__APPUI__css/themes/flat.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-flat"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-amethyst" data-toggle="tooltip" title="Amethyst" data-theme="__APPUI__css/themes/amethyst.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-amethyst"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-creme" data-toggle="tooltip" title="Creme" data-theme="__APPUI__css/themes/creme.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-creme"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-passion" data-toggle="tooltip" title="Passion" data-theme="__APPUI__css/themes/passion.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="">
                            <span class="section-side themed-background-dark-passion"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-default" data-toggle="tooltip" title="Default + Light Sidebar" data-theme="default" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-classy" data-toggle="tooltip" title="Classy + Light Sidebar" data-theme="__APPUI__css/themes/classy.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-social" data-toggle="tooltip" title="Social + Light Sidebar" data-theme="__APPUI__css/themes/social.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-flat" data-toggle="tooltip" title="Flat + Light Sidebar" data-theme="__APPUI__css/themes/flat.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-amethyst" data-toggle="tooltip" title="Amethyst + Light Sidebar" data-theme="__APPUI__css/themes/amethyst.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-creme" data-toggle="tooltip" title="Creme + Light Sidebar" data-theme="__APPUI__css/themes/creme.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-passion" data-toggle="tooltip" title="Passion + Light Sidebar" data-theme="__APPUI__css/themes/passion.css" data-theme-navbar="navbar-inverse" data-theme-sidebar="sidebar-light">
                            <span class="section-side"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-default" data-toggle="tooltip" title="Default + Light Header" data-theme="default" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-default"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-classy" data-toggle="tooltip" title="Classy + Light Header" data-theme="__APPUI__css/themes/classy.css" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-classy"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-social" data-toggle="tooltip" title="Social + Light Header" data-theme="__APPUI__css/themes/social.css" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-social"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-flat" data-toggle="tooltip" title="Flat + Light Header" data-theme="__APPUI__css/themes/flat.css" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-flat"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-amethyst" data-toggle="tooltip" title="Amethyst + Light Header" data-theme="__APPUI__css/themes/amethyst.css" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-amethyst"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-creme" data-toggle="tooltip" title="Creme + Light Header" data-theme="__APPUI__css/themes/creme.css" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-creme"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="themed-background-passion" data-toggle="tooltip" title="Passion + Light Header" data-theme="__APPUI__css/themes/passion.css" data-theme-navbar="navbar-default" data-theme-sidebar="">
                            <span class="section-header"></span>
                            <span class="section-side themed-background-dark-passion"></span>
                            <span class="section-content"></span>
                        </a>
                    </li>
                </ul>
            </div>
            <!-- END Color Themes -->
        </div>
        <!-- END Sidebar Content -->
    </div>
    <!-- END Wrapper for scrolling functionality -->

    <!-- Sidebar Extra Info -->
    <div id="sidebar-extra-info" class="sidebar-content sidebar-nav-mini-hide">
        <div class="push-bit">
                            <span class="pull-right">
                                <a href="javascript:void(0)" class="text-muted"><i class="fa fa-plus"></i></a>
                            </span>
            <small><strong>78 GB</strong> / 100 GB</small>
        </div>
        <div class="progress progress-mini push-bit">
            <div class="progress-bar progress-bar-primary" role="progressbar" aria-valuenow="78" aria-valuemin="0" aria-valuemax="100" style="width: 78%"></div>
        </div>
        <div class="text-center">
            <small>Crafted with <i class="fa fa-heart text-danger"></i> by <a href="http://goo.gl/vNS3I" target="_blank">pixelcave</a></small><br>
            <small><span id="year-copy"></span> &copy; <a href="http://goo.gl/RcsdAh" target="_blank">AppUI 2.7</a></small>
        </div>
    </div>
    <!-- END Sidebar Extra Info -->
</div>

        <!-- END Main Sidebar -->

        <!-- Main Container -->
        <div id="main-container">
            <!-- Header -->
            <!-- In the PHP version you can set the following options from inc/config file -->
            <!--
                Available header.navbar classes:

                'navbar-default'            for the default light header
                'navbar-inverse'            for an alternative dark header

                'navbar-fixed-top'          for a top fixed header (fixed main sidebar with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar())
                    'header-fixed-top'      has to be added on #page-container only if the class 'navbar-fixed-top' was added

                'navbar-fixed-bottom'       for a bottom fixed header (fixed main sidebar with scroll will be auto initialized, functionality can be found in js/app.js - handleSidebar()))
                    'header-fixed-bottom'   has to be added on #page-container only if the class 'navbar-fixed-bottom' was added
            -->
            <header class="navbar navbar-inverse navbar-fixed-top">
    <!-- Left Header Navigation -->
    <ul class="nav navbar-nav-custom">
        <!-- Main Sidebar Toggle Button -->
        <li>
            <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar');this.blur();">
                <i class="fa fa-ellipsis-v fa-fw animation-fadeInRight" id="sidebar-toggle-mini"></i>
                <i class="fa fa-bars fa-fw animation-fadeInRight" id="sidebar-toggle-full"></i>
            </a>
        </li>
        <!-- END Main Sidebar Toggle Button -->

        <!-- Header Link -->
        <li class="hidden-xs animation-fadeInQuick">
            <a href=""><strong>WELCOME</strong></a>
        </li>
        <!-- END Header Link -->
    </ul>
    <!-- END Left Header Navigation -->

    <!-- Right Header Navigation -->
    <ul class="nav navbar-nav-custom pull-right">
        <!-- Search Form -->
        <li>
            <form action="page_ready_search_results.html" method="post" class="navbar-form-custom">
                <input type="text" id="top-search" name="top-search" class="form-control" placeholder="Search..">
            </form>
        </li>
        <!-- END Search Form -->

        <!-- Alternative Sidebar Toggle Button -->
        <li>
            <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar-alt');this.blur();">
                <i class="gi gi-settings"></i>
            </a>
        </li>
        <!-- END Alternative Sidebar Toggle Button -->

        <!-- User Dropdown -->
        <li class="dropdown">
            <a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown">
                <img src="img/placeholders/avatars/avatar9.jpg" alt="avatar">
            </a>
            <ul class="dropdown-menu dropdown-menu-right">
                <li class="dropdown-header">
                    <strong>ADMINISTRATOR</strong>
                </li>
                <li>
                    <a href="page_app_email.html">
                        <i class="fa fa-inbox fa-fw pull-right"></i>
                        Inbox
                    </a>
                </li>
                <li>
                    <a href="page_app_social.html">
                        <i class="fa fa-pencil-square fa-fw pull-right"></i>
                        Profile
                    </a>
                </li>
                <li>
                    <a href="page_app_media.html">
                        <i class="fa fa-picture-o fa-fw pull-right"></i>
                        Media Manager
                    </a>
                </li>
                <li class="divider"><li>
                <li>
                    <a href="javascript:void(0)" onclick="App.sidebar('toggle-sidebar-alt');">
                        <i class="gi gi-settings fa-fw pull-right"></i>
                        Settings
                    </a>
                </li>
                <li>
                    <a href="page_ready_lock_screen.html">
                        <i class="gi gi-lock fa-fw pull-right"></i>
                        Lock Account
                    </a>
                </li>
                <li>
                    <a href="page_ready_login.html">
                        <i class="fa fa-power-off fa-fw pull-right"></i>
                        Log out
                    </a>
                </li>
            </ul>
        </li>
        <!-- END User Dropdown -->
    </ul>
    <!-- END Right Header Navigation -->
</header>

            <!-- END Header -->

            <!-- Page content -->
            
<div id="page-content" class="">

    <!-- First Row -->
    <div class="row">
        <!-- Simple Stats Widgets -->
        <div class="col-sm-6 col-lg-3">
            <a href="javascript:void(0)" class="widget">
                <div class="widget-content widget-content-mini text-right clearfix">
                    <div class="widget-icon pull-left themed-background">
                        <i class="gi gi-cardio text-light-op"></i>
                    </div>
                    <h2 class="widget-heading h3">
                        <strong><span data-toggle="counter" data-to="2835"></span></strong>
                    </h2>
                    <span class="text-muted">SALES</span>
                </div>
            </a>
        </div>
        <div class="col-sm-6 col-lg-3">
            <a href="javascript:void(0)" class="widget">
                <div class="widget-content widget-content-mini text-right clearfix">
                    <div class="widget-icon pull-left themed-background-success">
                        <i class="gi gi-user text-light-op"></i>
                    </div>
                    <h2 class="widget-heading h3 text-success">
                        <strong>+ <span data-toggle="counter" data-to="2862"></span></strong>
                    </h2>
                    <span class="text-muted">NEW USERS</span>
                </div>
            </a>
        </div>
        <div class="col-sm-6 col-lg-3">
            <a href="javascript:void(0)" class="widget">
                <div class="widget-content widget-content-mini text-right clearfix">
                    <div class="widget-icon pull-left themed-background-warning">
                        <i class="gi gi-briefcase text-light-op"></i>
                    </div>
                    <h2 class="widget-heading h3 text-warning">
                        <strong>+ <span data-toggle="counter" data-to="75"></span></strong>
                    </h2>
                    <span class="text-muted">PROJECTS</span>
                </div>
            </a>
        </div>
        <div class="col-sm-6 col-lg-3">
            <a href="javascript:void(0)" class="widget">
                <div class="widget-content widget-content-mini text-right clearfix">
                    <div class="widget-icon pull-left themed-background-danger">
                        <i class="gi gi-wallet text-light-op"></i>
                    </div>
                    <h2 class="widget-heading h3 text-danger">
                        <strong>$ <span data-toggle="counter" data-to="5820"></span></strong>
                    </h2>
                    <span class="text-muted">EARNINGS</span>
                </div>
            </a>
        </div>
        <!-- END Simple Stats Widgets -->
    </div>
    <!-- END First Row -->

    <!-- Second Row -->
    <div class="row">
        <div class="col-sm-6 col-lg-8">
            <!-- Chart Widget -->
            <div class="widget">
                <div class="widget-content border-bottom">
                    <span class="pull-right text-muted">2013</span>
                    Last Year's Data
                </div>
                <div class="widget-content border-bottom themed-background-muted">
                    <!-- Flot Charts (initialized in js/pages/readyDashboard.js), for more examples you can check out http://www.flotcharts.org/ -->
                    <div id="chart-classic-dash" style="height: 393px;"></div>
                </div>
                <div class="widget-content widget-content-full">
                    <div class="row text-center">
                        <div class="col-xs-4 push-inner-top-bottom border-right">
                            <h3 class="widget-heading"><i class="gi gi-wallet text-dark push-bit"></i> <br><small>$ 41k</small></h3>
                        </div>
                        <div class="col-xs-4 push-inner-top-bottom">
                            <h3 class="widget-heading"><i class="gi gi-cardio text-dark push-bit"></i> <br><small>17k Sales</small></h3>
                        </div>
                        <div class="col-xs-4 push-inner-top-bottom border-left">
                            <h3 class="widget-heading"><i class="gi gi-life_preserver text-dark push-bit"></i> <br><small>3k+ Tickets</small></h3>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Chart Widget -->
        </div>
        <div class="col-sm-6 col-lg-4">
            <!-- Stats User Widget -->
            <a href="page_ready_profile.html" class="widget">
                <div class="widget-content border-bottom text-dark">
                    <span class="pull-right text-muted">This week</span>
                    Featured Author
                </div>
                <div class="widget-content border-bottom text-center themed-background-muted">
                    <img src="img/placeholders/avatars/avatar13@2x.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-avatar-2x">
                    <h2 class="widget-heading h3 text-dark">Anna Wigren</h2>
                    <span class="text-muted">
                                            <strong>Logo Designer</strong>, Sweden
                                        </span>
                </div>
                <div class="widget-content widget-content-full-top-bottom">
                    <div class="row text-center">
                        <div class="col-xs-6 push-inner-top-bottom border-right">
                            <h3 class="widget-heading"><i class="gi gi-briefcase text-dark push-bit"></i> <br><small>35 Projects</small></h3>
                        </div>
                        <div class="col-xs-6 push-inner-top-bottom">
                            <h3 class="widget-heading"><i class="gi gi-heart_empty text-dark push-bit"></i> <br><small>5.3k Likes</small></h3>
                        </div>
                    </div>
                </div>
            </a>
            <!-- END Stats User Widget -->

            <!-- Mini Widgets Row -->
            <div class="row">
                <div class="col-xs-6">
                    <a href="javascript:void(0)" class="widget">
                        <div class="widget-content themed-background-info text-light-op text-center">
                            <div class="widget-icon">
                                <i class="fa fa-facebook"></i>
                            </div>
                        </div>
                        <div class="widget-content text-dark text-center">
                            <strong>98k</strong><br>Followers
                        </div>
                    </a>
                </div>
                <div class="col-xs-6">
                    <a href="javascript:void(0)" class="widget">
                        <div class="widget-content themed-background-danger text-light-op text-center">
                            <div class="widget-icon">
                                <i class="fa fa-database"></i>
                            </div>
                        </div>
                        <div class="widget-content text-dark text-center">
                            <strong>15</strong><br>
                            Active Servers
                        </div>
                    </a>
                </div>
            </div>
            <!-- END Mini Widgets Row -->
        </div>
    </div>
    <!-- END Second Row -->

    <!-- Third Row -->
    <div class="row">
        <div class="col-sm-4">
            <!-- Project Widget -->
            <div class="widget">
                <div class="widget-content border-bottom">
                    <span class="pull-right text-muted">60%</span>
                    Project
                </div>
                <a href="javascript:void(0)" class="widget-content themed-background-muted text-right clearfix">
                    <img src="img/placeholders/avatars/avatar6.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-avatar pull-left">
                    <h2 class="widget-heading h3 text-muted">Logo</h2>
                    <div class="progress progress-striped progress-mini active">
                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="85" aria-valuemin="0" aria-valuemax="100" style="width: 85%"></div>
                    </div>
                </a>
                <a href="javascript:void(0)" class="widget-content themed-background-muted border-top text-right clearfix">
                    <img src="img/placeholders/avatars/avatar2.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-avatar pull-left">
                    <h2 class="widget-heading h3 text-muted">Icon Pack</h2>
                    <div class="progress progress-striped progress-mini active">
                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%"></div>
                    </div>
                </a>
                <a href="javascript:void(0)" class="widget-content themed-background-muted border-top text-right clearfix">
                    <img src="img/placeholders/avatars/avatar11.jpg" alt="avatar" class="img-circle img-thumbnail img-thumbnail-avatar pull-left">
                    <h2 class="widget-heading h3 text-muted">Design</h2>
                    <div class="progress progress-striped progress-mini active">
                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="55" aria-valuemin="0" aria-valuemax="100" style="width: 55%"></div>
                    </div>
                </a>
                <div class="widget-content widget-content-full border-top">
                    <div class="row text-center">
                        <div class="col-xs-6 push-inner-top-bottom border-right">
                            <i class="fa fa-check-circle-o"></i> On Time
                        </div>
                        <div class="col-xs-6 push-inner-top-bottom">
                            <i class="fa fa-clock-o"></i> 17 Days
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Project Widget -->
        </div>
        <div class="col-sm-4">
            <!-- Statistics Widget -->
            <div class="widget">
                <div class="widget-content border-bottom">
                    <span class="pull-right text-muted"><i class="fa fa-check"></i></span>
                    Weekly Sales
                </div>
                <div class="widget-content border-bottom themed-background-muted text-center">
                    <span id="widget-dashchart-sales">12,15,14,18,16,15,16,17</span>
                </div>
                <div class="widget-content widget-content-full-top-bottom border-bottom">
                    <div class="row text-center">
                        <div class="col-xs-6 push-inner-top-bottom border-right">
                            <h3 class="widget-heading"><i class="gi gi-book_open text-dark push"></i> <br><small>123 Total Sales</small></h3>
                        </div>
                        <div class="col-xs-6 push-inner-top-bottom">
                            <h3 class="widget-heading"><i class="gi gi-user_add text-dark push"></i> <br><small>+10% Clients</small></h3>
                        </div>
                    </div>
                </div>
                <div class="widget-content widget-content-full">
                    <div class="row text-center">
                        <div class="col-xs-6 push-inner-top-bottom border-right">
                            <h3 class="widget-heading"><i class="gi gi-briefcase text-dark push"></i> <br><small>5 Products</small></h3>
                        </div>
                        <div class="col-xs-6 push-inner-top-bottom">
                            <h3 class="widget-heading"><i class="gi gi-truck text-dark push"></i> <br><small>10 Deliveries</small></h3>
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Statistics Widget -->
        </div>
        <div class="col-sm-4">
            <!-- Story Widget -->
            <div class="widget">
                <div class="widget-content">
                    <span class="pull-right text-muted">Featured</span>
                    Story
                </div>
                <div class="widget-image">
                    <img src="img/placeholders/photos/photo9.jpg" alt="image">
                    <div class="widget-image-content">
                        <h2 class="widget-heading"><a href="page_ready_article.html" class="text-light"><strong>The trip that changed my life</strong></a></h2>
                        <h3 class="widget-heading text-light-op h4">It changed the way I think</h3>
                    </div>
                    <i class="gi gi-airplane"></i>
                </div>
                <div class="widget-content widget-content-full text-dark">
                    <div class="row text-center">
                        <div class="col-xs-4 push-inner-top-bottom border-right">
                            <i class="fa fa-heart-o"></i> 9.5k
                        </div>
                        <div class="col-xs-4 push-inner-top-bottom border-right">
                            <i class="fa fa-eye"></i> 76k
                        </div>
                        <div class="col-xs-4 push-inner-top-bottom">
                            <i class="fa fa-share-alt"></i> 7.2k
                        </div>
                    </div>
                </div>
            </div>
            <!-- END Story Widget -->
        </div>
    </div>
    <!-- END Third Row -->
</div>

            <!-- END Page Content -->
        </div>
        <!-- END Main Container -->
    </div>
    <!-- END Page Container -->
</div>


<!-- END Page Wrapper -->

<!-- jQuery, Bootstrap, jQuery plugins and Custom JS code -->
<script src="__APPUI__js/vendor/jquery-2.2.4.min.js"></script>
<script src="__APPUI__js/vendor/bootstrap.min.js"></script>
<script src="__APPUI__js/plugins.js"></script>
<script src="__APPUI__js/app.js"></script>

<!-- Load and execute javascript code used only in this page -->

<script src="__APPUI__js/pages/readyDashboard.js"></script>
<script>$(function(){ ReadyDashboard.init(); });</script>


</body>
</html>