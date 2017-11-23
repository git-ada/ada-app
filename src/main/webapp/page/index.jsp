<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html>
    <!--<![endif]-->
    <!-- BEGIN HEAD -->

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>${platformName}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport" />
        <meta content="" name="description" />
        <meta content="fitz#demoworld@sina.com" name="author" />
        <link rel="apple-touch-icon" href="assets/i/favicon.ico">
		<!-- <link rel="Shortcut Icon" href="assets/i/favicon.png" type="image/x-icon"> -->
        <!--新路径-->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
        <!-- END GLOBAL MANDATORY STYLES -->
        <link href="assets/css/datatables.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/daterangepicker.min.css?t=20170522" rel="stylesheet" type="text/css" />
        <link href="assets/css/toastr.min.css" rel="stylesheet" type="text/css" />
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="assets/css/components.min.css" rel="stylesheet" id="style_components" type="text/css" />
        <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css" />
        <!-- <link href="assets/global/plugins/bootstrap-select/css/bootstrap-select.min.css" rel="stylesheet" type="text/css" /> -->
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <link href="assets/css/layout.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/dark.min.css" rel="stylesheet" type="text/css" id="style_color" />
        <link href="assets/css/custom.min.css" rel="stylesheet" type="text/css" />
        <link href="assets/css/fitz.css?20170514" rel="stylesheet" type="text/css" />
        <link href="assets/css/app.jd.css" rel="stylesheet" type="text/css" />
        <!-- END THEME LAYOUT STYLES -->
        <!-- <link rel="icon" type="image/png" href="assets/i/favicon.png"> -->
        <!-- 
        <link rel="shortcut icon" href="assets/i/favicon.ico" /> 
        <link rel="bookmark" href="assets/i/favicon.ico"/>
         -->
    </head>
    <!-- END HEAD -->
    <!--左侧导航紧凑显示-->
	<!--<body class="page-sidebar-closed-hide-logo page-container-bg-solid page-header-fixed ">-->
    <!--body class="page-sidebar-closed-hide-logo page-container-bg-solid page-header-fixed"-->
    <body class="page-sidebar-closed-hide-logo page-content-white page-header-fixed page-sidebar-fixed">
        <!-- BEGIN 导航 -->
        <div class="page-header navbar navbar-fixed-top">
            <div class="page-header-inner ">
                <!-- BEGIN LOGO -->
                <div class="page-logo" style="background: #e53e49">
                    <a>
                    	<!-- 
                        <img src="/assets/img/logetext.png" alt="logo" class="logo-default" style="height: 17px;"/> </a>
                         -->
                    <span style="color: #f7f0f0;padding-top: 40px;line-height: 52px;font-size: 17px;padding-left: 0px;" class="logo-default">${platformName}</span>
                    <div class="menu-toggler sidebar-toggler">
                        <!-- DOC: Remove the above "hide" to enable the sidebar toggler button on header -->
                        <span></span>
                    </div>
                </div>
                <!-- END LOGO -->
                <!-- BEGIN RESPONSIVE MENU TOGGLER -->
                <a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse"> </a>
                <!-- END RESPONSIVE MENU TOGGLER -->
                <!-- BEGIN PAGE TOP -->
                <div class="page-top">
                    <!-- BEGIN HEADER SEARCH BOX -->
                    <!-- DOC: Apply "search-form-expanded" right after the "search-form" class to have half expanded search box -->
                   
                    <!-- END HEADER SEARCH BOX -->
                    <!-- BEGIN TOP NAVIGATION MENU -->
                    <div class="top-menu">
                    	
                        <ul class="nav navbar-nav pull-right">
                        	<li >
                        		<span style="display:block;color: #ffffff;vertical-align: bottom;margin:18px; font-size: 13px;font-family: 微软雅黑">${platformName}</span>
                        	</li>
                            <li class="dropdown dropdown-user">
                                <a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                                    <i class="icon-user"></i>
                                    <span class="username username-hide-on-mobile"> ${user.nickname}</span>
                                    <i class="fa fa-angle-down"></i>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-default">
                                	<!-- 
                                    <li>
                                        <a href="javascript:;" onclick="gotoPage('temp/setting.jsp')">
                                            <i class="icon-user"></i> 个人信息 </a>
                                    </li>
                                    <li>
                                        <a href="javascript:;" onclick="gotoPage('temp/message.jsp')">
                                            <i class="icon-envelope-open"></i> 我的消息
                                            <span class="badge badge-danger"> 3 </span>
                                        </a>
                                   </li>
                                   <li class="divider"> </li>
                                   <li>
                                        <a href="page_user_lock_1.jsp" class="ajaxify nav-link">
                                            <i class="icon-lock"></i> 屏幕锁定 </a>
                                    </li>
                                    -->
                                    <li>
                                        <a href="javascript:gotoPage('${pageContext.request.contextPath}/change-password.jhtm')">
                                            <i class="icon-key"></i> 修改密码 </a>
                                    </li>
                                    <li>
                                        <a href="logout.jhtm">
                                            <i class="icon-logout"></i> 退出 </a>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!-- END PAGE TOP -->
            </div>
            <!-- END HEADER INNER -->
        </div>
        <!-- END HEADER -->
        <!-- BEGIN HEADER & CONTENT DIVIDER -->
        <div class="clearfix"> </div>
        <!-- END HEADER & CONTENT DIVIDER -->
        <!-- BEGIN CONTAINER -->
        <div class="page-container">
            <!-- BEGIN SIDEBAR -->
            <div class="page-sidebar-wrapper">
                <!-- END SIDEBAR -->
                <!-- DOC: Set data-auto-scroll="false" to disable the sidebar from auto scrolling/focusing -->
                <!-- DOC: Change data-auto-speed="200" to adjust the sub menu slide up/down speed -->
                <div class="page-sidebar navbar-collapse collapse">
                    <ul class="page-sidebar-menu  page-header-fixed" data-keep-expanded="true" data-auto-scroll="true" data-slide-speed="200">
                       	<jsp:include page="../include/menu.jsp"></jsp:include>
                    </ul>
                    <!-- END SIDEBAR MENU -->
                </div>
                <!-- END SIDEBAR -->
            </div>
            <!-- END SIDEBAR -->
            <!-- BEGIN CONTENT -->
            <div class="page-content-wrapper">
                <!-- BEGIN CONTENT BODY -->
                <div class="page-content">
                   <!-- ajaxloadcontent -->
                    <div class="page-content-body">
                    </div>
                </div>
                <!-- END CONTENT BODY -->
            </div>
            <!-- END CONTENT -->
            <!-- END QUICK SIDEBAR -->
        </div>
        <!-- END CONTAINER -->
        <!-- BEGIN FOOTER -->
        <div class="page-footer">
            <!-- END FOOTER -->
            <!-- BEGIN QUICK NAV -->
            <nav class="quick-nav" style="display:none;">
                <a class="quick-nav-trigger" href="#0">
                    <span aria-hidden="true"></span>
                </a>
                <ul>
                    <li>
                        <a href="https://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes" target="_blank" class="active">
                            <span>Purchase Metronic</span>
                            <i class="icon-basket"></i>
                        </a>
                    </li>
                    <li>
                        <a href="https://themeforest.net/item/metronic-responsive-admin-dashboard-template/reviews/4021469?ref=keenthemes" target="_blank">
                            <span>Customer Reviews</span>
                            <i class="icon-users"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://keenthemes.com/showcast/" target="_blank">
                            <span>Showcase</span>
                            <i class="icon-user"></i>
                        </a>
                    </li>
                    <li>
                        <a href="http://keenthemes.com/metronic-theme/changelog/" target="_blank">
                            <span>Changelog</span>
                            <i class="icon-graph"></i>
                        </a>
                    </li>
                </ul>
                <span aria-hidden="true" class="quick-nav-bg"></span>
            </nav>
            <div class="quick-nav-overlay"></div>
            <!-- 兼容性js -->
            <!--[if lt IE 9]>
            <script src="assets/js/respond.min.js"></script>
            <script src="assets/js/excanvas.min.js"></script> 
            <script src="assets/js/ie8.fix.min.js"></script> 
            <![endif]-->
            <!-- BEGIN CORE PLUGINS -->
            <script src="assets/js/jquery.min.js" type="text/javascript"></script>
            <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
            <script src="assets/js/js.cookie.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.slimscroll.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.blockui.min.js" type="text/javascript"></script>
            <script src="assets/js/bootstrap-switch.min.js" type="text/javascript"></script>
            <!-- END CORE PLUGINS -->
            <!-- BEGIN THEME GLOBAL SCRIPTS -->
            <!-- <script src="assets/js/jump.js" type="text/javascript"></script> -->
            <script src="assets/js/app.min.js" type="text/javascript"></script>
            <script src="assets/js/fitz.js" type="text/javascript"></script>
            <!-- END THEME GLOBAL SCRIPTS -->
            <!-- 图表控件 -->
            <script src="assets/js/moment.min.js" type="text/javascript"></script>
            <script src="assets/js/daterangepicker.min.js" type="text/javascript"></script>
            <script src="assets/js/morris.min.js" type="text/javascript"></script>
            <script src="assets/js/raphael-min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.waypoints.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.counterup.min.js" type="text/javascript"></script>
            <script src="assets/js/amcharts.js" type="text/javascript"></script>
            <script src="assets/js/serial.js" type="text/javascript"></script>
            <script src="assets/js/pie.js" type="text/javascript"></script>
            <script src="assets/js/radar.js" type="text/javascript"></script>
          <!--   <script src="assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
            <script src="assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
            <script src="assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script> -->
            <script src="assets/js/ammap.js" type="text/javascript"></script>
            <script src="assets/js/worldLow.js" type="text/javascript"></script>
            <script src="assets/js/amstock.js" type="text/javascript"></script>
            <script src="assets/js/fullcalendar.min.js" type="text/javascript"></script>
            <script src="assets/js/horizontal-timeline.js" type="text/javascript"></script>
            <script src="assets/js/jquery.flot.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.flot.resize.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.flot.categories.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.easypiechart.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.sparkline.min.js" type="text/javascript"></script>
            <script type="text/javascript" src="assets/js/jquery.form.js"></script>
            <!--首页数据图绘制-->
            <script src="assets/js/dashboard.min.js" type="text/javascript"></script>
             
            <!-- 表格控件 -->
            <script src="assets/js/jquery.validate.js" type="text/javascript"></script>
            <script src="assets/js/additional-methods.min.js" type="text/javascript"></script>
            <script src="assets/js/jquery.metadata.js" type="text/javascript"></script>
            
            <script src="assets/js/datatable.js" type="text/javascript"></script>
            <script src="assets/js/datatables.min.js" type="text/javascript"></script>
            <script src="assets/js/datatables.bootstrap.js" type="text/javascript"></script>
            <script src="assets/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
            <script src="assets/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
            <script src="assets/js/bootstrap-datetimepicker.zh-CN.js" type="text/javascript" charset="utf-8"></script>
            <script src="assets/js/bootstrap-confirmation.min.js" type="text/javascript"></script>
            <!-- <script src="assets/pages/scripts/table-datatables-buttons.min.js" type="text/javascript"></script> -->
            <!-- BEGIN THEME LAYOUT SCRIPTS -->
            <script src="assets/js/toastr.min.js" type="text/javascript"></script>

            <script src="assets/js/layout.js" type="text/javascript"></script>
            <script src="assets/js/demo.min.js" type="text/javascript"></script>
            <script src="assets/js/quick-sidebar.min.js" type="text/javascript"></script>
            <script src="assets/js/quick-nav.min.js" type="text/javascript"></script>
            <!-- 
            <script type="text/javascript" src="http://webapi.amap.com/maps?v=1.3&key=35c59396d056295c25ea08219fa6b2e4&plugin=AMap.Autocomplete&callback=init"></script>
            <script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>
             -->
            <!-- END THEME LAYOUT SCRIPTS -->
            
            <!-- 自定义JS -->
            <!-- 
            <script src="common/operations.js" type="text/javascript"></script>
             -->
            <script src="assets/js/app.jd.js" type="text/javascript"></script>
            <script type="text/javascript">
	            $(document).ready(function(){
	          	  $(".nav-link").first().click();
	          	});
            </script>
    </body>

</html>