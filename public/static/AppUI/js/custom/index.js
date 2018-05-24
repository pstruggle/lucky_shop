/*
 *  Document   : index.js
 *  Author     : cjphp
 *  Description: 首页交互js
 */

var Index = function () {
    var sidebar = $('#sidebar')
        ,page = $('#page-container')
        ,pageContent     = $('#page-content');

    /* Resize #page-content to fill empty space if exists */
    var resizePageContent = function() {
        var windowH     = $(window).height();
        var headerH     = header.outerHeight();
        var sidebarH    = sidebar.outerHeight();

        if (header.hasClass('navbar-fixed-top') || header.hasClass('navbar-fixed-bottom')) {
            pageContent.css('min-height', windowH);
        } else if (sidebarH > windowH) {
            pageContent.css('min-height', sidebarH - headerH);
        } else {
            pageContent.css('min-height', windowH - headerH);
        }
    };


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
        if(menu == -1 && submenu == -1){
            menuLi.eq(a).children('a').addClass('active');

        }else if(submenu == -1){
            menuLi.eq(menu).addClass('active')
                .find('li').eq(a).children('a').addClass('active');

        }else {
            menuLi.eq(menu).addClass('active')
                .children('ul').children('li').eq(submenu).addClass('active')
                .find('li').eq(a).children('a').addClass('active');

        }
        // Add ripple effect to all navigation links
        allLinks.on('click', function(e){
            var link = $(this), ripple, d, x, y;
            // console.log();
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
            console.log("a");
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

    return {
        init:function () {
            handleNav();
        }
    }
}();