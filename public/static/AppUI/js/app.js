/*
 *  Document   : app.js
 *  Author     : pixelcave
 *  Description: Custom scripts and plugin initializations (available to all pages)
 *
 *  Feel free to remove the plugin initilizations from uiInit() if you would like to
 *  use them only in specific pages. Also, if you remove a js plugin you won't use, make
 *  sure to remove its initialization from uiInit().
 */

var App = function() {

    /* Helper variables - set in uiInit() */
    var page, pageContent, header, sidebar, sBrand, sExtraInfo, sidebarAlt, sScroll, sScrollAlt,iframeTitle;

    var iframeH=0;
    /* Initialization UI Code */
    var uiInit = function() {

        // Set variables - Cache some often used Jquery objects in variables */
        page            = $('#page-container');
        header          = $('header');
        pageContent     = $('#page-content');

        iframeTitle     = $("#iframe-title");

        sidebar         = $('#sidebar');
        sBrand          = $('#sidebar-brand');
        sExtraInfo      = $('#sidebar-extra-info');
        sScroll         = $('#sidebar-scroll');

        sidebarAlt      = $('#sidebar-alt');
        sScrollAlt      = $('#sidebar-scroll-alt');

        // Color Theme Preview functionality
        colorThemePreview();

        // Initialize sidebars functionality
        handleSidebar('init');

        // Sidebar navigation functionality
        // handleNav();
        dialog(); // 编辑弹窗事件监听
        // Header glass effect on scrolling
        if ((header.hasClass('navbar-fixed-top') || header.hasClass('navbar-fixed-bottom'))) {
            $(window).on('scroll', function(){
                if ($(this).scrollTop() > 50) {
                    header.addClass('navbar-glass');
                } else {
                    header.removeClass('navbar-glass');
                }
            });
        }

        // Resize #page-content to fill empty space if exists
        $(window).on('resize orientationchange', function(){ resizePageContent(); }).resize();

        // Add the correct copyright year
        var yearCopy = $('#year-copy'), d = new Date();
        if (d.getFullYear() === 2014) { yearCopy.html('2014'); } else { yearCopy.html('2014-' + d.getFullYear().toString().substr(2,2)); }

        // Intialize ripple effect on buttons
        rippleEffect($('.btn-effect-ripple'), 'btn-ripple');

        // Initialize Tabs
        // $('[data-toggle="tabs"] a, .enable-tabs a').click(function(e){ console.log("test"); e.preventDefault(); $(this).tab('show'); });
        pageContent.on("click",'[data-toggle="tabs"] a, .enable-tabs a',function(e){ console.log("test"); e.preventDefault(); $(this).tab('show'); })
        // Initialize Tooltips
        $('[data-toggle="tooltip"], .enable-tooltip').tooltip({container: 'body', animation: false});

        // Initialize Popovers
        $('[data-toggle="popover"], .enable-popover').popover({container: 'body', animation: true});

        // Initialize Image Lightbox
        $('[data-toggle="lightbox-image"]').magnificPopup({type: 'image', image: {titleSrc: 'title'}});

        // Initialize image gallery lightbox
        $('[data-toggle="lightbox-gallery"]').each(function(){
            $(this).magnificPopup({
                delegate: 'a',
                type: 'image',
                gallery: {
                    enabled: true,
                    navigateByImgClick: true,
                    arrowMarkup: '<button type="button" class="mfp-arrow mfp-arrow-%dir%" title="%title%"></button>',
                    tPrev: 'Previous',
                    tNext: 'Next',
                    tCounter: '<span class="mfp-counter">%curr% of %total%</span>'
                },
                image: {titleSrc: 'title'}
            });
        });

        // Initialize Typeahead - Example with countries
        var exampleTypeheadData = ["Afghanistan","Albania","Algeria","American Samoa","Andorra","Angola","Anguilla","Antarctica","Antigua and Barbuda","Argentina","Armenia","Aruba","Australia","Austria","Azerbaijan","Bahrain","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia and Herzegovina","Botswana","Bouvet Island","Brazil","British Indian Ocean Territory","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","CΓ΄te d'Ivoire","Cambodia","Cameroon","Canada","Cape Verde","Cayman Islands","Central African Republic","Chad","Chile","China","Christmas Island","Cocos (Keeling) Islands","Colombia","Comoros","Congo","Cook Islands","Costa Rica","Croatia","Cuba","Cyprus","Czech Republic","Democratic Republic of the Congo","Denmark","Djibouti","Dominica","Dominican Republic","East Timor","Ecuador","Egypt","El Salvador","Equatorial Guinea","Eritrea","Estonia","Ethiopia","Faeroe Islands","Falkland Islands","Fiji","Finland","Former Yugoslav Republic of Macedonia","France","French Guiana","French Polynesia","French Southern Territories","Gabon","Georgia","Germany","Ghana","Gibraltar","Greece","Greenland","Grenada","Guadeloupe","Guam","Guatemala","Guinea","Guinea-Bissau","Guyana","Haiti","Heard Island and McDonald Islands","Honduras","Hong Kong","Hungary","Iceland","India","Indonesia","Iran","Iraq","Ireland","Israel","Italy","Jamaica","Japan","Jordan","Kazakhstan","Kenya","Kiribati","Kuwait","Kyrgyzstan","Laos","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Lithuania","Luxembourg","Macau","Madagascar","Malawi","Malaysia","Maldives","Mali","Malta","Marshall Islands","Martinique","Mauritania","Mauritius","Mayotte","Mexico","Micronesia","Moldova","Monaco","Mongolia","Montserrat","Morocco","Mozambique","Myanmar","Namibia","Nauru","Nepal","Netherlands","Netherlands Antilles","New Caledonia","New Zealand","Nicaragua","Niger","Nigeria","Niue","Norfolk Island","North Korea","Northern Marianas","Norway","Oman","Pakistan","Palau","Panama","Papua New Guinea","Paraguay","Peru","Philippines","Pitcairn Islands","Poland","Portugal","Puerto Rico","Qatar","RΓ©union","Romania","Russia","Rwanda","SΓ£o TomΓ© and PrΓ­ncipe","Saint Helena","Saint Kitts and Nevis","Saint Lucia","Saint Pierre and Miquelon","Saint Vincent and the Grenadines","Samoa","San Marino","Saudi Arabia","Senegal","Seychelles","Sierra Leone","Singapore","Slovakia","Slovenia","Solomon Islands","Somalia","South Africa","South Georgia and the South Sandwich Islands","South Korea","Spain","Sri Lanka","Sudan","Suriname","Svalbard and Jan Mayen","Swaziland","Sweden","Switzerland","Syria","Taiwan","Tajikistan","Tanzania","Thailand","The Bahamas","The Gambia","Togo","Tokelau","Tonga","Trinidad and Tobago","Tunisia","Turkey","Turkmenistan","Turks and Caicos Islands","Tuvalu","US Virgin Islands","Uganda","Ukraine","United Arab Emirates","United Kingdom","United States","United States Minor Outlying Islands","Uruguay","Uzbekistan","Vanuatu","Vatican City","Venezuela","Vietnam","Wallis and Futuna","Western Sahara","Yemen","Yugoslavia","Zambia","Zimbabwe"];
        $('.input-typeahead').typeahead({ source: exampleTypeheadData });

        // Initialize Chosen
        $('.select-chosen').chosen({width: "100%"});

        // Initialize Select2
        $('.select-select2').select2();

        // Initialize Slider for Bootstrap
        $('.input-slider').slider();

        // Initialize Tags Input
        $('.input-tags').tagsInput({ width: 'auto', height: 'auto'});

        // Initialize Timepicker
        $('.input-timepicker').timepicker({minuteStep: 1,showSeconds: true,showMeridian: true});
        $('.input-timepicker24').timepicker({minuteStep: 1,showSeconds: true,showMeridian: false});

        // Initialize Datepicker
        $('.input-datepicker, .input-daterange').datepicker({weekStart: 1}).on('changeDate', function(e){ $(this).datepicker('hide'); });

        // Initialize Bootstrap Colorpicker
        $('.input-colorpicker').colorpicker({format: 'hex'});
        $('.input-colorpicker-rgba').colorpicker({format: 'rgba'});

        // Easy Pie Chart
        $('.pie-chart').easyPieChart({
            barColor: $(this).data('bar-color') ? $(this).data('bar-color') : '#777777',
            trackColor: $(this).data('track-color') ? $(this).data('track-color') : '#eeeeee',
            lineWidth: $(this).data('line-width') ? $(this).data('line-width') : 3,
            size: $(this).data('size') ? $(this).data('size') : '80',
            animate: 800,
            scaleColor: false
        });

        // Toggles 'open' class on toggle menu
        $('.toggle-menu .submenu').on('click', function(){
           $(this)
               .parent('li')
               .toggleClass('open');
        });

        // Initialize Placeholder (for IE9)
        $('input, textarea').placeholder();
    };

    /* Page Loading functionality */
    var pageLoading = function(){
        var pageWrapper = $('#page-wrapper');

        if (pageWrapper.hasClass('page-loading')) {
            if (page.hasClass('enable-cookies')) {
                setTimeout(function(){
                    pageWrapper.removeClass('page-loading');
                }, 100);
            } else {
                pageWrapper.removeClass('page-loading');
            }
        }
    };
    /* 初始化后台菜单 */
    var initNav = function () {

    };
    var setIframeHeight = function (iframe) {
        if (iframe) {
            var iframeWin = iframe.contentWindow || iframe.contentDocument.parentWindow;
            if (iframeWin.document.body) {
                iframe.height = iframeWin.document.documentElement.scrollHeight || iframeWin.document.body.scrollHeight;
            }
        }
    };

    window.onload = function () {
        setIframeHeight(document.getElementById('external-frame'));
    };


    /* Sidebar Navigation functionality */
    var handleNav = function() {
        // Get all vital links
        var allLinks        = $('.sidebar-nav a', sidebar);
        var menuLinks       = $('.sidebar-nav-menu', sidebar);
        var submenuLinks    = $('.sidebar-nav-submenu', sidebar);
        var menu = -1,submenu = -1,a = 0;
        menu = Cookies.get('optionMenu') ? Cookies.get('optionMenu') : -1;
        submenu = Cookies.get('optionSubmenu') ? Cookies.get('optionSubmenu') : -1;
        a = Cookies.get('optionA') ? Cookies.get('optionA') : 0;
        var menuLi = $('.sidebar-nav > li');

        //  选中函数
        var menuActive = function () {
            var link;
            if(menu == -1 && submenu == -1){
                link = menuLi.eq(a).children('a').addClass('active');

            }else if(submenu == -1){
                link = menuLi.eq(menu).addClass('active')
                    .find('li').eq(a).children('a').addClass('active');

            }else {
                link = menuLi.eq(menu).addClass('active')
                    .children('ul').children('li').eq(submenu).addClass('active')
                    .find('li').eq(a).children('a').addClass('active');

            }
            createIframe(link);
        };
        // 创建新页面
        var createIframe = function (link) {
            var iframeTitle = $("#iframe-title",page);
            var iframeBox = $("#iframe-box",page);
            var iframeNav = iframeTitle.children(".nav-tabs");

            var tab = link.text(),href=link.attr("_href"),tabHref=href.replace(/\//g,"-");
            var tabLi = $('<li class="active"><a href="#'+tabHref+'">'+tab+'</a></li>');
            var contentIframe = $('<div class="tab-pane active" id="'+tabHref+'"><iframe scrolling="auto" onload="" frameborder="0" src="'+href+'" style="width: 100%;height: '+iframeH+'px;"></iframe></div>');

            iframeNav.find("li").removeClass('active');
            iframeBox.find(".tab-pane").removeClass('active');
            var iframeNavItem = iframeNav.find("a[href='#"+tabHref+"']");

            if(iframeNavItem.length>0){
                iframeNavItem.eq(0).tab("show");
                console.log($("#"+tabHref+" iframe").eq(0));
                // $("#"+tabHref+" iframe").eq(0).contentWindow.location.reload(true);
                $("#"+tabHref+" iframe").attr("src",href);
            }else {
                iframeNav.append(tabLi);
                iframeBox.append(contentIframe);
            }

        };
        menuActive();
        // Add ripple effect to all navigation links
        allLinks.on('click', function(e){
            var link = $(this), ripple, d, x, y,link_type;
            // Remove .animate class from all ripple elements
            sidebar.find('.sidebar-nav-ripple').removeClass('animate');

            // If the ripple element doesn't exist in this link, add it
            if(link.children('.sidebar-nav-ripple').length === 0) {
                link.prepend('<span class="sidebar-nav-ripple"></span>');
            }

            if(link.parent('li').parent('ul').hasClass('sidebar-nav')){
                a = link.parent('li').index();
                menu = -1;
                submenu = -1
            }else if(link.parent('li').parent('ul').parent('li').parent('ul').hasClass('sidebar-nav')) {
                a = link.parent('li').index();
                menu = link.parent('li').parent('ul').parent('li').index();
                submenu = -1
            }else if(link.parent('li').parent('ul').parent('li').parent('ul').parent('li').parent('ul').hasClass('sidebar-nav')) {
                a = link.parent('li').index();
                menu = link.parent('li').parent('ul').parent('li').parent('ul').parent('li').index();
                submenu = link.parent('li').parent('ul').parent('li').index();
            }
            if(!link.hasClass('sidebar-nav-menu') && !link.hasClass('sidebar-nav-submenu')){
                Cookies.set('optionA', a, {expires: 7});
                Cookies.set('optionMenu', menu, {expires: 7});
                Cookies.set('optionSubmenu', submenu, {expires: 7});
                //  静态选中(页面不跳转选中)
                allLinks.removeClass("active") &&
                menuLi.removeClass("active") &&
                menuActive()&&
                link.addClass("active")
                    .parent('li').siblings("li").children("a").removeClass("active");
            }

            // Get the ripple element
            ripple = link.children('.sidebar-nav-ripple');

            // If the ripple element doesn't have dimensions set them accordingly
            if(!ripple.height() && !ripple.width()) {
                d = Math.max(link.outerWidth(), link.outerHeight());
                ripple.css({height: d, width: d});
            }

            // Get coordinates for our ripple element
            x = e.pageX - link.offset().left - ripple.width()/2;
            y = e.pageY - link.offset().top - ripple.height()/2;
            // Position the ripple element and add the class .animate to it
            ripple.css({top: y + 'px', left: x + 'px'}).addClass('animate');
        });

        // Primary Accordion functionality
        menuLinks.on('click', function(e){
            var link = $(this);
            var windowW = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

            // If we are in mini sidebar mode
            if (page.hasClass('sidebar-visible-lg-mini') && (windowW > 991)) {
                if (link.hasClass('open')) {
                    link.removeClass('open');
                }
                else {
                    $('#sidebar .sidebar-nav-menu.open').removeClass('open');
                    link.addClass('open');
                }
            }
            else if (!link.parent().hasClass('active')) {
                if (link.hasClass('open')) {
                    link.removeClass('open');
                }
                else {
                    $('#sidebar .sidebar-nav-menu.open').removeClass('open');
                    link.addClass('open');
                }

                // Resize Page Content
                setTimeout(resizePageContent, 50);
            }

            return false;
        });

        // Submenu Accordion functionality
        submenuLinks.on('click', function(e){
            var link = $(this);

            if (link.parent().hasClass('active') !== true) {
                if (link.hasClass('open')) {
                    link.removeClass('open');
                }
                else {
                    link.closest('ul').find('.sidebar-nav-submenu.open').removeClass('open');
                    link.addClass('open');
                }

                // Resize Page Content
                setTimeout(resizePageContent, 50);
            }

            return false;
        });
    };

    /* Ripple effect on click functionality */
    var rippleEffect = function(element, cl){
        // Add required classes to the element
        element.css({
            'overflow': 'hidden',
            'position': 'relative'
        });

        // On element click
        element.on('click', function(e){
            var elem = $(this), ripple, d, x, y;

            // If the ripple element doesn't exist in this element, add it..
            if(elem.children('.' + cl).length === 0) {
                elem.prepend('<span class="' + cl + '"></span>');
            }
            else { // ..else remove .animate class from ripple element
                elem.children('.' + cl).removeClass('animate');
            }

            // Get the ripple element
            var ripple = elem.children('.' + cl);

            // If the ripple element doesn't have dimensions set them accordingly
            if(!ripple.height() && !ripple.width()) {
                d = Math.max(elem.outerWidth(), elem.outerHeight());
                ripple.css({height: d, width: d});
            }

            // Get coordinates for our ripple element
            x = e.pageX - elem.offset().left - ripple.width()/2;
            y = e.pageY - elem.offset().top - ripple.height()/2;

            // Position the ripple element and add the class .animate to it
            ripple.css({top: y + 'px', left: x + 'px'}).addClass('animate');
        });
    };

    /* Sidebars Functionality */
    var handleSidebar = function(mode){
        if (mode === 'init') {
            // Init sidebars scrolling functionality
            handleSidebar('sidebar-scroll');
            handleSidebar('sidebar-alt-scroll');

            // Handle main sidebar's scrolling functionality on resize or orientation change
            var sScrollTimeout;

            $(window).on('resize orientationchange', function(){
                clearTimeout(sScrollTimeout);

                sScrollTimeout = setTimeout(function(){
                    handleSidebar('sidebar-scroll');
                }, 150);
            });
        } else {
            var windowW = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth;

            if (mode === 'toggle-sidebar') {
                if ( windowW > 991) { // Toggle main sidebar in large screens (> 991px)
                    if (page.hasClass('sidebar-visible-lg-full')) {
                        page.removeClass('sidebar-visible-lg-full').addClass('sidebar-visible-lg-mini');
                    } else if (page.hasClass('sidebar-visible-lg-mini')) {
                        page.removeClass('sidebar-visible-lg-mini').addClass('sidebar-visible-lg-full');
                    } else {
                        page.addClass('sidebar-visible-lg-mini');
                    }

                    // Resize Page Content
                    setTimeout(resizePageContent, 50);
                } else { // Toggle main sidebar in small screens (< 992px)
                    page.toggleClass('sidebar-visible-xs');

                    if (page.hasClass('sidebar-visible-xs')) {
                        handleSidebar('close-sidebar-alt');
                    }
                }

                // Handle main sidebar scrolling functionality
                handleSidebar('sidebar-scroll');
            }
            else if (mode === 'open-sidebar') {
                if ( windowW > 991) { // Open main sidebar in large screens (> 991px)
                    page.removeClass('sidebar-visible-lg-mini').addClass('sidebar-visible-lg-full');
                } else { // Open main sidebar in small screens (< 992px)
                    page.addClass('sidebar-visible-xs');
                    handleSidebar('close-sidebar-alt');
                }
                // Handle main sidebar scrolling functionality
                handleSidebar('sidebar-scroll');

                // Resize Page Content
                setTimeout(resizePageContent, 50);
            }
            else if (mode === 'close-sidebar') {
                if ( windowW > 991) { // Close main sidebar in large screens (> 991px)
                    page.removeClass('sidebar-visible-lg-full').addClass('sidebar-visible-lg-mini');
                } else { // Close main sidebar in small screens (< 992px)
                    page.removeClass('sidebar-visible-xs');
                }

                // Handle main sidebar scrolling functionality
                handleSidebar('sidebar-scroll');
            }
            else if (mode === 'toggle-sidebar-alt') {
                if ( windowW > 991) { // Toggle alternative sidebar in large screens (> 991px)
                    page.toggleClass('sidebar-alt-visible-lg');
                } else { // Toggle alternative sidebar in small screens (< 992px)
                    page.toggleClass('sidebar-alt-visible-xs');

                    if (page.hasClass('sidebar-alt-visible-xs')) {
                        handleSidebar('close-sidebar');
                    }
                }
            }
            else if (mode === 'open-sidebar-alt') {
                if ( windowW > 991) { // Open alternative sidebar in large screens (> 991px)
                    page.addClass('sidebar-alt-visible-lg');
                } else { // Open alternative sidebar in small screens (< 992px)
                    page.addClass('sidebar-alt-visible-xs');
                    handleSidebar('close-sidebar');
                }
            }
            else if (mode === 'close-sidebar-alt') {
                if ( windowW > 991) { // Close alternative sidebar in large screens (> 991px)
                    page.removeClass('sidebar-alt-visible-lg');
                } else { // Close alternative sidebar in small screens (< 992px)
                    page.removeClass('sidebar-alt-visible-xs');
                }
            }
            else if (mode === 'sidebar-scroll') { // Handle main sidebar scrolling
                if (page.hasClass('sidebar-visible-lg-mini') && (windowW > 991)) { // Destroy main sidebar scrolling when in mini sidebar mode
                    if (sScroll.length && sScroll.parent('.slimScrollDiv').length) {
                        sScroll
                            .slimScroll({destroy: true});
                        sScroll
                            .attr('style', '');
                    }
                }
                else if ((header.hasClass('navbar-fixed-top') || header.hasClass('navbar-fixed-bottom'))) {
                    var sHeight = $(window).height() - ((sBrand.css('display') === 'none' ? 0 : sBrand.outerHeight()) + (sExtraInfo.css('display') === 'none' ? 0 : sExtraInfo.outerHeight()));

                    if ( windowW < 992) { sHeight = sHeight - 50; }

                    if (sScroll.length && (!sScroll.parent('.slimScrollDiv').length)) { // If scrolling does not exist init it..
                        sScroll
                            .slimScroll({
                                height: sHeight,
                                color: '#bbbbbb',
                                size: '3px',
                                touchScrollStep: 100,
                                railVisible: false,
                                railOpacity: 1
                            });
                    }
                    else { // ..else resize scrolling height
                        sScroll
                            .add(sScroll.parent())
                            .css('height', sHeight);
                    }
                }
            }
            else if (mode === 'sidebar-alt-scroll') { // Init alternative sidebar scrolling
                if (sScrollAlt.length && (!sScrollAlt.parent('.slimScrollDiv').length)) { // If scrolling does not exist init it..
                    sScrollAlt.slimScroll({
                        height: sidebarAlt.outerHeight(),
                        color: '#bbbbbb',
                        size: '3px',
                        touchScrollStep: 100,
                        railVisible: false,
                        railOpacity: 1
                    });

                    // Resize alternative sidebar scrolling height on window resize or orientation change
                    var sScrollAltTimeout;

                    $(window).on('resize orientationchange', function(){
                        clearTimeout(sScrollAltTimeout);

                        sScrollAltTimeout = setTimeout(function(){
                            handleSidebar('sidebar-alt-scroll');
                        }, 150);
                    });
                }
                else { // ..else resize scrolling height
                    sScrollAlt.add(sScrollAlt.parent()).css('height', sidebarAlt.outerHeight());
                }
            }
        }
    };

    /* Resize #page-content to fill empty space if exists */
    var resizePageContent = function() {
        var windowH     = $(window).height();
        var headerH     = header.outerHeight();
        var sidebarH    = sidebar.outerHeight();
        var iframeTitleH    = iframeTitle.outerHeight(true);
        var pageContentPadding = parseInt(pageContent.css("paddingTop"))+5;
        // iframeTitle.
        console.log(windowH,headerH,sidebarH,iframeTitleH,pageContentPadding);
        if (header.hasClass('navbar-fixed-top') || header.hasClass('navbar-fixed-bottom')) {
            pageContent.css('min-height', windowH);
            if (window.self == window.top) {
                pageContent.css('max-height', windowH);
                pageContent.css('height', windowH);
                iframeH = windowH - pageContentPadding-iframeTitleH;
            }
        } else if (sidebarH > windowH) {
            pageContent.css('min-height', sidebarH - headerH);
            if (window.self == window.top) {
                pageContent.css('max-height', sidebarH - headerH);
                pageContent.css('height', sidebarH - headerH);
                iframeH = sidebarH -headerH - pageContentPadding-iframeTitleH;
            }

        } else {
            pageContent.css('min-height', windowH - headerH);
            if (window.self == window.top) {
                pageContent.css('max-height', windowH - headerH);
                pageContent.css('height', windowH - headerH);
                iframeH = windowH -headerH - pageContentPadding-iframeTitleH;
            }
        }
        if (window.self == window.top) {
            $("iframe").css("height", iframeH);
        }
        console.log(windowH,headerH,sidebarH,iframeTitleH,pageContentPadding,iframeH);

    };

    /* Color Theme preview, preview a color theme on a page */
    var colorThemePreview = function() {
        var colorList       = $('.sidebar-themes');
        var themeLink       = $('#theme-link');

        var themeColor      = themeLink.length ? themeLink.attr('href') : 'default';
        var themeHeader     = header.hasClass('navbar-inverse') ? 'navbar-inverse' : 'navbar-default';
        var themeSidebar    = page.hasClass('sidebar-light') ? 'sidebar-light' : '';

        var cookies         = page.hasClass('enable-cookies') ? true : false;
        var themeColorCke, themeHeaderCke, themeSidebarCke;

        // If cookies have been enabled
        if (cookies) {
            themeColorCke   = Cookies.get('optionThemeColor') ? Cookies.get('optionThemeColor') : false;
            themeHeaderCke  = Cookies.get('optionThemeHeader') ? Cookies.get('optionThemeHeader') : false;
            themeSidebarCke = Cookies.get('optionThemeSidebar') ? Cookies.get('optionThemeSidebar') : false;

            // Update navbar class
            themeHeaderCke ? header.removeClass('navbar-inverse navbar-default').addClass(themeHeaderCke) : false;

            // Update sidebar class
            themeSidebarCke ? page.removeClass('sidebar-light').addClass(themeSidebarCke) : false;

            // Update color theme
            if (themeColorCke) {
                if (themeColorCke === 'default') {
                    if (themeLink.length) {
                        themeLink.remove();
                        themeLink = $('#theme-link');
                    }
                } else {
                    if (themeLink.length) {
                        themeLink.attr('href', themeColorCke);
                    } else {
                        $('link[href="'+themes+'"]')
                            .before('<link id="theme-link" rel="stylesheet" href="' + themeColorCke + '">');

                        themeLink = $('#theme-link');
                    }
                }
            }

            themeColor      = themeColorCke ? themeColorCke : themeColor;
            themeHeader     = themeHeaderCke ? themeHeaderCke : themeHeader;
            themeSidebar    = themeSidebarCke ? themeSidebarCke : themeSidebar;
        }

        // Set the active color theme link as active
        $('a[data-theme="' + themeColor + '"][data-theme-navbar="' + themeHeader + '"][data-theme-sidebar="' + themeSidebar + '"]', colorList)
            .parent('li')
            .addClass('active');

        // When a color theme link is clicked
        $('a', colorList).click(function(e){
            themeColor      = $(this).data('theme');
            themeHeader     = $(this).data('theme-navbar');
            themeSidebar    = $(this).data('theme-sidebar');

            // Set this color theme link as active
            $('li', colorList).removeClass('active');
            $(this).parent('li').addClass('active');

            // Update navbar class
            header.removeClass('navbar-inverse navbar-default').addClass(themeHeader);

            // Update sidebar class
            page.removeClass('sidebar-light').addClass(themeSidebar);

            // Update color theme
            if (themeColor === 'default') {
                if (themeLink.length) {
                    themeLink.remove();
                    themeLink = $('#theme-link');
                }
            } else {
                if (themeLink.length) {
                    themeLink.attr('href', themeColor);
                } else {
                    $('link[href="'+themes+'"]')
                        .before('<link id="theme-link" rel="stylesheet" href="' + themeColor + '">');

                    themeLink = $('#theme-link');
                }
            }

            // If cookies have been enabled, save the new options
            if (cookies) {
                Cookies.set('optionThemeColor', themeColor, {expires: 7});
                Cookies.set('optionThemeHeader', themeHeader, {expires: 7});
                Cookies.set('optionThemeSidebar', themeSidebar, {expires: 7});
            }
        });
    };
    /* Datatables basic Bootstrap integration (pagination integration included under the Datatables plugin in plugins.js) */
    var dtIntegration = function() {
        $.extend(true, $.fn.dataTable.defaults, {
            "sDom": "<'row'<'col-sm-6 col-xs-5'l><'col-sm-6 col-xs-7'f>r>t<'row'<'col-sm-5 hidden-xs'i><'col-sm-7 col-xs-12 clearfix'p>>",
            "sPaginationType": "bootstrap",
            "oLanguage": {
                "sLengthMenu": "_MENU_",
                "sSearch": "<div class=\"input-group\">_INPUT_<span class=\"input-group-addon\"><i class=\"fa fa-search\"></i></span></div>",
                "sInfo": "<strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>",
                "oPaginate": {
                    "sPrevious": "",
                    "sNext": ""
                }
            }
        });
        $.extend($.fn.dataTableExt.oStdClasses, {
            "sWrapper": "dataTables_wrapper form-inline",
            "sFilterInput": "form-control",
            "sLengthSelect": "form-control"
        });
    };

    /* Print functionality - Hides all sidebars, prints the page and then restores them (To fix an issue with CSS print styles in webkit browsers)  */
    var handlePrint = function() {
        // Store all #page-container classes
        var pageCls = page.prop('class');

        // Remove all classes from #page-container
        page.prop('class', '');

        // Print the page
        window.print();

        // Restore all #page-container classes
        page.prop('class', pageCls);
    };
    var check = function () {
        $('.is_true').each(function () {
            var val = $(this).val(),
                name = $(this).attr('name'),
                check = false;
            if(val == '1'){
                check = true;
            }
            $('#'+name).prop('checked',check)
                .on('change',function () {
                var id = $(this).attr('id'),
                    input = $('input[name="'+id+'"]');
                if($(this).is(':checked')){
                    input.val(1)
                }else{
                    input.val(0)

                }
            });
        });
    };
    // 编辑跳转
    var edit = function () {
        $('.edit').on('click',function () {
            var id = $(this).data('id');
            var edit_url = $('.edit_view').attr('href');
            location.href = edit_url + '?id=' + id;
        });
    };
    //设置大小的
    var layer_show = function (title,url,w,h){
        if (title == null || title == '') {
            title=false;
        };
        if (url == null || url == '') {
            url="404.html";
        };
        if (w == null || w == '') {
            w=800;
        };
        if (h == null || h == '') {
            h=($(window).height() - 50);
        };
        layer.open({
            type: 2,
            area: [w+'px', h +'px'],
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: title,
            content: url
        });
    };
    //全屏幕打开弹出层
    var layer_full_show=function (title,url)
    {
        var index = layer.open({
            type: 2,
            fix: false, //不固定
            maxmin: true,
            shade:0.4,
            title: title,
            content: url
        });
        layer.full(index);
    };
    // 编辑弹窗跳转
    var dialog = function () {
        // 自定义宽度弹窗
        pageContent.on('click',".layer_show",function () {
            var id = $(this).data('id') || "";
            var edit_view = $('.edit_view');
            var title=edit_view.text();
            var edit_url = edit_view.attr('_href');
            var w = edit_view.data("width")||$(this).data("width") || null;
            var h = edit_view.data("height")||$(this).data("height") || null;
            // id = id==undefined?"":id;
            layer_show(title,edit_url + '?id=' + id,w,h)
        });
        // 全屏弹窗
        pageContent.on('click',".layer_full",function () {
            var id = $(this).data('id') || "";
            var edit_view = $('.edit_view');
            var title=edit_view.text();
            var edit_url = edit_view.attr('_href');
            layer_full_show(title,edit_url + '?id=' + id)
        });
        // 页面跳转
        pageContent.on('click',".edit",function () {
            var id = $(this).data('id') || "";
            var edit_view = $('.edit_view');
            var edit_url = edit_view.attr('_href');
            location.href = edit_url + '?id=' + id;
        });
    };

    // 初始化下拉框
    var selected = function () {
        $('select').each(function () {
            var val = $(this).data('val');
            if(val){
                $(this).val(val);
            }
            return true;
        })
    };
    return {
        init: function() {
            uiInit(); // Initialize UI
            pageLoading(); // Initialize Page Loading
            check();
        },
        sidebar: function(mode, extra) {
            handleSidebar(mode, extra); // Handle sidebars - access functionality from everywhere
        },
        datatables: function() {
            dtIntegration(); // Datatables Bootstrap integration
        },
        pagePrint: function() {
            handlePrint(); // Print functionality
        },
        nav:function(){
            handleNav();
        },
        setIframeHeight:setIframeHeight,//iframe自适应高度
        // edit:edit,//跳转编辑
        selected:selected   // 初始化下拉框
    };
}();

/* Initialize App when page loads */
$(function(){ App.init(); });