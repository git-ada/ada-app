<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<!-- saved from url=(0088)http://ningqu.oss-cn-hangzhou.aliyuncs.com/metronic/theme/admin_1/page_user_login_1.html -->
<html lang="en"><!--<![endif]--><!-- BEGIN HEAD --><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>${platformName}</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta content="width=device-width, initial-scale=1" name="viewport">
        <meta content="${platformName}" name="description">
        <meta content="" name="author">
        <link rel="apple-touch-icon" href="assets/i/favicon.png">
		<link rel="Shortcut Icon" href="assets/i/favicon.png" type="image/x-icon">
        <!-- BEGIN GLOBAL MANDATORY STYLES -->
        <link href="assets/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/simple-line-icons.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css">
        <!-- END GLOBAL MANDATORY STYLES -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <link href="assets/css/select2.min.css" rel="stylesheet" type="text/css">
        <link href="assets/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css">
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL STYLES -->
        <link href="assets/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
        <link href="assets/css/plugins.min.css" rel="stylesheet" type="text/css">
        <!-- END THEME GLOBAL STYLES -->
        <!-- BEGIN PAGE LEVEL STYLES -->
        <link href="assets/css/login.min.css" rel="stylesheet" type="text/css">
        <!-- END PAGE LEVEL STYLES -->
        <!-- BEGIN THEME LAYOUT STYLES -->
        <!-- END THEME LAYOUT STYLES -->
        <link rel="shortcut icon" href="http://ningqu.oss-cn-hangzhou.aliyuncs.com/metronic/theme/admin_1/favicon.ico"> </head>
    <!-- END HEAD -->
	<style>
		.login .content {
			background-color: #333;
		}
		
		.login .content .form-actions{
			border-bottom: 0px;
		}

		.copyright {
			color: #f2f2f2!important;
			border-top: 1px solid #eee;
		}
	</style>
    <body class=" login">
    	<!-- 
    	<header style="background-color: #EF3F3F;text-align: center;height: 35px;" >
			<span style="color: #fff;font-size: 23px;">优乐充管理平台</span>
		</header>
		 -->
        <!-- BEGIN LOGO -->
        <div class="logo" style="padding-top: 30px;">
            <a href="#">
            	<!--<img src="./Metronic Admin Theme #1 _ User Login 1_files/logo-big.png" alt=""> -->
            </a>
            <span style="color: #fff;font-size: 28px;">${platformName}</span>
        </div>
        <!-- END LOGO -->
        <!-- BEGIN LOGIN -->
        <div class="content">
            <!-- BEGIN LOGIN FORM -->
            <form class="login-form" action="login.do" method="post" novalidate="novalidate">
                <h3 class="form-title font-red">登录</h3>
                <div class="alert alert-danger display-hide">
                    <button class="close" data-close="alert"></button>
                    <span id="error-msg"> 请输入账号和密码. </span>
                </div>
                <div class="form-group">
                    <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
                    <label class="control-label visible-ie8 visible-ie9">用户名</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="用户名" name="username"> </div>
                <div class="form-group">
                    <label class="control-label visible-ie8 visible-ie9">密码</label>
                    <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="密码" name="password"> </div>
                <div class="form-actions">
                    <button type="submit" class="btn red uppercase">立即登陆</button>
                    <label class="rememberme check mt-checkbox mt-checkbox-outline" style="text-align: right;">
                        <input type="checkbox" name="remember" value="1">30天免登陆
                        <span></span>
                    </label>
                    <!-- 
                    <a href="javascript:;" id="forget-password" class="forget-password">忘记密码?</a>
                     
                    <a href="javascript:;" class="forget-password">忘记密码?</a>
                    -->
                </div>
            </form>
            <!-- END LOGIN FORM -->
        </div>

        <!--[if lt IE 9]>
		<script src="../assets/global/plugins/respond.min.js"></script>
		<script src="../assets/global/plugins/excanvas.min.js"></script> 
		<script src="../assets/global/plugins/ie8.fix.min.js"></script> 
		<![endif]-->
        <!-- BEGIN CORE PLUGINS -->
        <script src="assets/js/jquery.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="assets/js/js.cookie.min.js" type="text/javascript"></script>
        <script src="assets/js/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="assets/js/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="assets/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <script src="assets/js/jquery.form.js" type="text/javascript" ></script>
        <!-- END CORE PLUGINS -->
        <!-- BEGIN PAGE LEVEL PLUGINS -->
        <script src="assets/js/jquery.validate.min.js" type="text/javascript"></script>
        <script src="assets/js/additional-methods.min.js" type="text/javascript"></script>
        <script src="assets/js/select2.full.min.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL PLUGINS -->
        <!-- BEGIN THEME GLOBAL SCRIPTS -->
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <!-- END THEME GLOBAL SCRIPTS -->
        <!-- BEGIN PAGE LEVEL SCRIPTS -->
        <script src="assets/js/login.js" type="text/javascript"></script>
        <!-- END PAGE LEVEL SCRIPTS -->
        <!-- BEGIN THEME LAYOUT SCRIPTS -->
        <script type="text/javascript">
        </script>
        <!-- END THEME LAYOUT SCRIPTS -->
</body>
</html>