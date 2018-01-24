<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="jodd" uri="http://www.springside.org.cn/jodd_form"%>
<!-- 顶部导航 BENG -->
<div class="page-bar">
    <ul class="page-breadcrumb" style="width: 100%">
    	<!--
        <li class="index-refresh toggler tooltips" data-placement="left" data-html="true" data-original-title="刷新页面"><i class="icon-refresh" onclick="refreshPage()"></i></li>
        -->
        <li>
            <i class="icon-home"></i>
            <a href="${pageContext.request.contextPath}/index.jhtm">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <span>修改密码</span>
        </li>
    </ul>
</div>
<!-- 顶部导航 END -->

<!-- 内容编辑区 BEGIN -->
<div class="portlet light ">
    <div class="portlet-body form">
        <form id="edit_form" action="${pageContext.request.contextPath}/change-password.do" class="form-horizontal" method="post">
        <jodd:form bean="userInfo" scope="request">
            <div class="form-body">
					<div class="form-group">
	                    <label class="col-md-2 control-label">原密码：</label>
	                    <div class="col-md-4">
			                <input type="password" name="oldPassword" class="form-control input-medium">
						</div>
				  </div>				
				  <div class="form-group">
	                    <label class="col-md-2 control-label">新密码：</label>
	                    <div class="col-md-4">
			                <input type="password" name="newPassword" class="form-control input-medium">
						</div>
				  </div>	
				  
				  <div class="form-group">
	                    <label class="col-md-2 control-label">重复密码：</label>
	                    <div class="col-md-4">
			                <input type="password" name="repePassword" class="form-control input-medium">
						</div>
				  </div>		
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-2 col-md-4">
                    	<button type="submit" class="btn btn-success">
                		<i class="fa fa-check"></i>&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
                    </div>
                </div>
            </div>
        </jodd:form>
        </form>
    </div>
</div>

<!-- 内容编辑区 END -->
<!-- 选择时间依赖 -->
<script src="assets/js/table-datatables-buttons.min.js" type="text/javascript"></script> 
<script type="text/javascript">
	$(document).ready(function(){
		 $("#edit_form").validate({
			 errorClass: "invalid",
			 rules: {
			     oldPassword: "required",
			     newPassword: "required",
			     repePassword: "required"
			   },
			 messages: {oldPassword: {required: "原密码必输."},
	                 newPassword: {required: "新密码必输."},
	                 repePassword: {required: "重复密码必输."
	                }
	            },
		  submitHandler: function(form) {
			  var newPassword = $('input[name=newPassword]').val();
			  var repePassword = $('input[name=repePassword]').val();
			  
			  if(repePassword != newPassword){
					toastr.error("两次输入密码不一致");
					return false;
			  }
			  
			  
		     var submitBtn = $('button[type=submit]');
	         if(!submitBtn.hasClass("disabled")){
	        		submitBtn.addClass("disabled");
	        		$(form).ajaxSubmit(function(ret) {
	         	    	if(ret.success){
	         	    		toastr.success(ret.message);
	         	    	}else{
	         	    		toastr.error(ret.message);
	         	    	}
	         	    	$('button[type=submit]').removeClass("disabled");
	         	      return false;
	         	   });
	        }
	        
	        return false;
		  }
		 });
	});
</script>