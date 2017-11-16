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
            <a href="index.jsp">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/ada-site/list.jhtm')"> 站点 </a>
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
        <form id="edit_form" action="${pageContext.request.contextPath}/ada-site/${action=='create'?'save':'update'}.do" class="form-horizontal" method="post">
        <jodd:form bean="adaSite" scope="request">
            <div class="form-body">
					<div class="form-group">
	                    <label class="col-md-3 control-label">用户ID<span class="required" > * </span>：</label>
	                    <div class="col-md-4">
			                <input type="text" name="userId" class="form-control input-medium" required="required" maxlength="10">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">站点名称：</label>
	                    <div class="col-md-4">
			                <input type="text" name="siteName" class="form-control input-medium"  maxlength="64">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-3 control-label">创建时间：</label>
	                    <div class="col-md-4">
							<input name="createTime" class="form-control form-control-inline input-medium datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaSite.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>" readonly="readonly">
						</div>
				  </div>				
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