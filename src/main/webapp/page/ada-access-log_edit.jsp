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
            <a href="/">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/ada-access-log/list.jhtm')"> 访问日志 </a>
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
        <form id="edit_form" action="${pageContext.request.contextPath}/ada-access-log/${action=='create'?'save':'update'}.do" class="form-horizontal" method="post">
        <jodd:form bean="adaAccessLog" scope="request">
            <div class="form-body">
					<div class="form-group">
	                    <label class="col-md-2 control-label">站点ID：</label>
	                    <div class="col-md-4">
			                <input type="text" name="siteId" class="form-control input-medium"  maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">域名ID：</label>
	                    <div class="col-md-4">
			                <input type="text" name="domainId" class="form-control input-medium"  maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">渠道ID<span class="required" > * </span>：</label>
	                    <div class="col-md-4">
			                <input type="text" name="channelId" class="form-control input-medium" required="required" maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">IP地址：</label>
	                    <div class="col-md-4">
			                <input type="text" name="ipAddress" class="form-control input-medium"  maxlength="24">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">客户端ID：</label>
	                    <div class="col-md-4">
			                <input type="text" name="uuid" class="form-control input-medium"  maxlength="32">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">浏览页：</label>
	                    <div class="col-md-4">
							<textarea rows="3" cols="40" name="url" class="form-control input-medium"  maxlength="128"></textarea>
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">客户端头信息：</label>
	                    <div class="col-md-4">
							<textarea rows="3" cols="40" name="useragent" class="form-control input-medium"  maxlength="256"></textarea>
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">操作系统：</label>
	                    <div class="col-md-4">
			                <input type="text" name="os" class="form-control input-medium"  maxlength="24">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">浏览器：</label>
	                    <div class="col-md-4">
			                <input type="text" name="browser" class="form-control input-medium"  maxlength="24">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">屏幕大小：</label>
	                    <div class="col-md-4">
			                <input type="text" name="screenSize" class="form-control input-medium"  maxlength="16">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">页面大小：</label>
	                    <div class="col-md-4">
			                <input type="text" name="pageSize" class="form-control input-medium"  maxlength="16">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">引用页：</label>
	                    <div class="col-md-4">
							<textarea rows="3" cols="40" name="referer" class="form-control input-medium"  maxlength="128"></textarea>
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">在Iframe中：</label>
	                    <div class="col-md-4">
			                <input type="text" name="iframe" class="form-control input-medium"  maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">首次访问时间：</label>
	                    <div class="col-md-4">
							<input name="firstTime" class="form-control form-control-inline input-medium datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaAccessLog.firstTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">当天首次访问时间：</label>
	                    <div class="col-md-4">
							<input name="todayTime" class="form-control form-control-inline input-medium datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaAccessLog.todayTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">客户端请求时间：</label>
	                    <div class="col-md-4">
							<input name="requestTime" class="form-control form-control-inline input-medium datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaAccessLog.requestTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">创建时间：</label>
	                    <div class="col-md-4">
							<input name="createTime" class="form-control form-control-inline input-medium datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaAccessLog.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
						</div>
				  </div>				
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-2 col-md-4">
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