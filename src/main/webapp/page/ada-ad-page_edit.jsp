<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
            <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/ada-ad-page/list.jhtm')"> 广告页 </a>
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
        <form id="edit_form" action="${pageContext.request.contextPath}/ada-ad-page/${action=='create'?'save':'update'}.do" class="form-horizontal" method="post">
        <jodd:form bean="adaAdPage" scope="request">
            <div class="form-body">
				<input type="hidden" name="siteId" value="${_CURRENT_SITE.id}">				
					<div class="form-group">
	                    <label class="col-md-2 control-label">匹配内容<span class="required" > * </span>：</label>
	                    <div class="col-md-4">
			                <input type="text" name="matchContent" class="form-control input-medium" required="required" maxlength="64">
						</div>
				  </div>				
					<div class="form-group">
	                    <label class="col-md-2 control-label">渠道参数名<span class="required" > * </span>：</label>
	                    <div class="col-md-4">
			                <input type="text" name="channelKey" class="form-control input-medium"  maxlength="64">
						</div>
				  </div>				
					
            </div>
            <input name="createTime" type="hidden" value="<%=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()) %>" >
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