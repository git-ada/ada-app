<%@ page language="java" pageEncoding="UTF-8"%>
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
            <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/ada-site/list.jhtm')">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/ada-user/list.jhtm')"> 用户列表 </a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <span>新增</span>
        </li>
    </ul>
</div>
<!-- 顶部导航 END -->

<!-- 内容编辑区 BEGIN -->
<div class="portlet light ">
    <div class="portlet-body form">
        <form id="edit_form" action="${pageContext.request.contextPath}/ada-user/${action=='create'?'save':'update'}.do" class="form-horizontal" method="post">
        <jodd:form bean="adaUser" scope="request">
            <div class="form-body">
					<div class="form-group">
	                    <label class="col-md-3 control-label">用户名：</label>
	                    <div class="col-md-4">
			                <input type="text" name="username" class="form-control input-medium"  maxlength="24">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">密码,MD5：</label>
	                    <div class="col-md-4">
			                <input type="text" name="password" class="form-control input-medium"  maxlength="32">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">昵称：</label>
	                    <div class="col-md-4">
			                <input type="text" name="nickname" class="form-control input-medium"  maxlength="64">
						</div>
				  </div>			
				  <!--  
					<div class="form-group">
	                    <label class="col-md-3 control-label">真名：</label>
	                    <div class="col-md-4">
			                <input type="text" name="realname" class="form-control input-medium"  maxlength="24">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">身份证号码：</label>
	                    <div class="col-md-4">
			                <input type="text" name="idNo" class="form-control input-medium"  maxlength="24">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">邮箱：</label>
	                    <div class="col-md-4">
							<textarea rows="3" cols="40" name="email" class="form-control input-medium"  maxlength="128"></textarea>
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">手机：</label>
	                    <div class="col-md-4">
			                <input type="text" name="phone" class="form-control input-medium"  maxlength="16">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">生日：</label>
	                    <div class="col-md-4">
							<input name="birthday" class="form-control form-control-inline input-medium datepick" type="text" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${adaUser.birthday}" pattern="yyyy-MM-dd"/>" readonly="readonly">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">性别：</label>
	                    <div class="col-md-4">
							<select name="sex" class="form-control input-medium" >
							<c:forEach items="${allSexs}" var="e">
							<option value="${e.key}">${e.value}</option>
							</c:forEach>
							</select>
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">头像URL：</label>
	                    <div class="col-md-4">
							<textarea rows="3" cols="40" name="headImgUrl" class="form-control input-medium"  maxlength="256"></textarea>
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">省ID：</label>
	                    <div class="col-md-4">
			                <input type="text" name="provinceId" class="form-control input-medium"  maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">城市ID：</label>
	                    <div class="col-md-4">
			                <input type="text" name="cityId" class="form-control input-medium"  maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">地区ID：</label>
	                    <div class="col-md-4">
			                <input type="text" name="districtId" class="form-control input-medium"  maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">家庭住址：</label>
	                    <div class="col-md-4">
			                <input type="text" name="homeAddress" class="form-control input-medium"  maxlength="64">
						</div>
				  </div>		
				  -->		
					<div class="form-group">
	                    <label class="col-md-3 control-label">状态：</label>
	                    <div class="col-md-4">
							<select name="status" class="form-control input-medium" >
							<c:forEach items="${allStatuss}" var="e">
							<option value="${e.key}">${e.value}</option>
							</c:forEach>
							</select>
						</div>
				  </div>
				  <div class="form-group">
	                    <label class="col-md-3 control-label">是否为管理员：</label>
	                    <div class="col-md-4">
							<select name="isAdmin" class="form-control input-medium" >
							<c:forEach items="${allIsAdmins}" var="e">
							<option value="${e.key}">${e.value}</option>
							</c:forEach>
							</select>
						</div>
				  </div>
				  <!-- 
					<div class="form-group">
	                    <label class="col-md-3 control-label">创建时间：</label>
	                    <div class="col-md-4">
							<input name="createTime" class="form-control form-control-inline input-medium datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
						</div>
				  </div>
				    -->				
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-3 col-md-4">
                    	<button type="submit" class="btn btn-success">
                		<i class="fa fa-check"></i>保存</button>
                    	<a class="btn btn-default" onclick="gotoHistoryPage(-1);">&nbsp;取消&nbsp;</a>
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
		handleValidation("#edit_form");
	});
	//初始化时间器
	initatepicker();
</script>