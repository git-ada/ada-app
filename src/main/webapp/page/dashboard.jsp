
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	@media (min-width: 992px){
		.search-field {padding-right:0!important;}
	}
	
	.dashboard-stat{
		padding-bottom: 0;
		margin-bottom: 0;
	}
</style>
<div class="page-bar">
    <ul class="page-breadcrumb" style="width: 100%">
        <li>
            <i class="icon-home"></i>
            <a href="/manage/index.jhtm">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
         <li>
            <span>实时数据</span>
        </li>
    </ul>
</div>

<div class="row">

	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		<div class="dashboard-stat green margin-bottom0">
			<div class="visual">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${siteStat.ip}">${siteStat.ip}</span>(IP)
				</div>
				<div class="desc">今日独立IP数</div>
			</div>
		</div>
	</div>
	
	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		<div class="dashboard-stat blue margin-bottom0">
			<div class="visual">
				<i class="fa fa-comments"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${siteStat.pv}">${siteStat.pv}</span>(PV)
				</div>
				<div class="desc">今日访问量</div>
			</div>
		</div>
	</div>
	

	<div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
		<div class="dashboard-stat red margin-bottom0">
			<div class="visual">
				<i class="fa fa-bar-chart-o"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${totalSummary.salesAmount}">--</span>(--)
				</div>
				<div class="desc"></div>
			</div>
		</div>
	</div>
	
</div>

<!--数据列表-->
<%-- <div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div >
			<div class="portlet-body" style="padding: 0;">
				<ul id="today_business" class="list-group" style="margin: 0;">
					<c:if test="${not empty todaykpi}">
					<li class="list-group-item">今日新增用户数 <span class="fr">
						${todaykpi.userNumbers} (人)</span></li>
					</c:if>
					<c:if test="${not empty yestodaykpi}">
					<li class="list-group-item">昨日新增用户数 <span class="fr">
						${yestodaykpi.userNumbers} (人)</span></li>
					</c:if>
					<c:if test="${not empty monthkpi}">
					<li class="list-group-item">本月新增用户数 <span class="fr">
						${monthkpi.userNumbers} (人)</span></li>
					</c:if>
					<c:if test="${not empty lastMonthkpi}">
					<li class="list-group-item">上月新增用户数 <span class="fr">
						${lastMonthkpi.userNumbers} (人)</span></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="portlet box">
			<div class="portlet-body" style="padding: 0;">
				<ul id="today_increase" class="list-group" style="margin: 0;">
					<c:if test="${not empty todaykpi}">
					<li class="list-group-item">今日订单数 <span class="fr">
							${todaykpi.orderNumbers} (单)</span></li>
					</c:if>
					<c:if test="${not empty yestodaykpi}">
					<li class="list-group-item">昨日订单数 <span class="fr">
							${yestodaykpi.orderNumbers} (单)</span></li>
					</c:if>
					<c:if test="${not empty monthkpi}">
					<li class="list-group-item">本月订单数 <span class="fr">
							${monthkpi.orderNumbers} (单)</span></li>
					</c:if>
					<c:if test="${not empty lastMonthkpi}">
					<li class="list-group-item">上月订单数<span class="fr">
							${lastMonthkpi.orderNumbers} (单))</span></li>
					</c:if>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="portlet box">
			<div class="portlet-body" style="padding: 0;">
				<ul id="yesterday_business" class="list-group" style="margin: 0;">
					<c:if test="${not empty todaykpi}">
					<li class="list-group-item">今日营业额<span class="fr">
							 ${todaykpi.salesAmount} (元)</span></li>
					</c:if>
					<c:if test="${not empty yestodaykpi}">
					<li class="list-group-item">昨日营业额 <span class="fr">
							 ${yestodaykpi.salesAmount} (元)</span></li>
				    </c:if>
					<c:if test="${not empty monthkpi}">
					<li class="list-group-item">本月营业额 <span class="fr">
							 ${monthkpi.salesAmount} (元)</span></li>
				    </c:if>
					<c:if test="${not empty lastMonthkpi}">
				    <li class="list-group-item">上月营业额 <span class="fr">
							 ${lastMonthkpi.salesAmount} (元)</span></li>
				    </c:if>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="portlet box" >
			<div class="portlet-body" style="padding: 0;">
				<ul id="yesterday_business" class="list-group" style="margin: 0;">
					<c:if test="${not empty todaykpi}">
					<li class="list-group-item">今日利润<span class="fr">
							 ${todaykpi.profitsAmount} (元)</span></li>
					</c:if>
					<c:if test="${not empty yestodaykpi}">
					<li class="list-group-item">昨日利润 <span class="fr">
							 ${yestodaykpi.profitsAmount} (元)</span></li>
					</c:if>
					<c:if test="${not empty monthkpi}">
					<li class="list-group-item">本月利润<span class="fr">
							 ${monthkpi.profitsAmount} (元)</span></li>
				    </c:if>
					<c:if test="${not empty lastMonthkpi}">
				    <li class="list-group-item">上月利润<span class="fr">
							 ${lastMonthkpi.profitsAmount} (元)</span></li>
				    </c:if>
				</ul>
			</div>
		</div>
	</div>
</div> --%>

<div class="row" style="display: none;">
	<div class="col-lg-12 col-xs-12 col-sm-12">
		<div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bar-chart"></i>
                    <span class="caption-subject bold uppercase"> 访问量</span>
                    <!-- 
                    <span class="caption-helper">weekly stats...</span>
                     -->
                </div>
                <div class="actions">
                	<!-- 
                    <a href="javascript:;" class="btn btn-circle btn-default">
                        <i class="fa fa-pencil"></i> Edit </a>
                    <a href="javascript:;" class="btn btn-circle btn-default">
                        <i class="fa fa-plus"></i> Add </a>
                    <a class="btn btn-circle btn-icon-only btn-default fullscreen" href="javascript:;" data-original-title="" title=""> </a>
                     -->
                </div>
            </div>
            <div class="portlet-body">
            	<div class="portlet-body index-zhuanzt">
			   <div id="dashboard_amchart_1" class="CSSAnimationChart"	style="height: 350px;"></div>
				<!--   <div id="dashboard_amchart_1" class="CSSAnimationChart" ></div> -->
				<a href="javascript:graphicLoading(-1)" data-value="${lastMonth}"
					id="backoff" title="" class="tubiao-btn-left"><i
					class="fa fa-chevron-left"></i></a> <a
					href="javascript:graphicLoading(1)" data-value="${nextMonth}"
					id="forward" title="" class="tubiao-btn-right"><i
					class="fa fa-chevron-right"></i></a>
			</div>
            </div>
        </div>
	</div>
</div>

<div class="portlet-body">
		<!-- 数据列表 BEGIN -->
	    <div class="table-scrollable">
	        <table class="table table-striped dataTableg table-bordered table-hover data-table">
	            <thead>
	                <tr>
	                	<!-- <th scope="col" style="width: 120px;">日期</th> -->			 
						<th scope="col" style="width: 150px;text-align: center;">渠道</th>			
						<th scope="col" style="width: 120px;text-align: center;">IP</th>			
						<th scope="col" style="width: 120px;text-align: center;">PV</th>			
						<th scope="col" style="width: 120px;text-align: center;">1-2次点击</th>			
						<th scope="col" style="width: 120px;text-align: center;">3-5次点击</th>			
						<th scope="col" style="width: 120px;text-align: center;">6-10次点击</th>			
						<th scope="col" style="width: 120px;text-align: center;">10+次点击</th>			
						<th scope="col" style="width: 120px;text-align: center;">进入目标页</th>			
				     </tr>
	            </thead>
	            <tbody>
	               <c:forEach var="item" items="${pageResults}" varStatus="number">
	                <tr>      
	                	<%-- <td><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd"/></td> --%>
						<td style="text-align: center;">${item.channelName}</td>
						<td style="text-align: center;">${item.ip}</td>
						<td style="text-align: center;">${item.pv}</td>
						<td style="text-align: center;">${item.clickip1}</td>
						<td style="text-align: center;">${item.clickip2}</td>
						<td style="text-align: center;">${item.clickip3}</td>
						<td style="text-align: center;">${item.clickip4}</td>
						<td style="text-align: center;">${item.targetpageip}</td>
	                </tr>
	                </c:forEach>
	                <%-- <c:if test="${empty page.pageResults}">
	            		<tr><td colspan="11">无</td></tr>
	            	</c:if> --%>
	            </tbody>
	        </table>
	    </div>
	    <!-- 数据列表 END -->
	    
	    <!-- 底部功能区 BEGIN -->
	    <c:if test="${not empty page.pageResults}">
		    <div class="row">
		        <!-- 底部分页 -->
		        <div class="col-md-4 col-sm-12">
		        	 <jsp:include page="/include/paging_footer.jsp"/>
		        </div>
		    </div>
		</c:if>
	    <!-- 底部功能区 END -->
	</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

	jQuery(document).ready(function() {
		   a();
	});
	
	
	var pageSize;
	
	function a() {
		var w = $(window).width();
	 
		pageSize=500>w ? 7 : (1000>w && w>=500) ? 12 : (1500>w && w>=1000) ? 20 : (2000>w && w>=1500) ? 30 : 30;
		
		$("#forward").attr("data-value",1); //下一月
		$("#backoff").attr("data-value",""); //上一月
	 
			graphicLoading(1);
	}


	function graphicLoading(obj) {
		//t();
		var month = null;

		if (obj == 1) { //表示下月数据
			month = $("#forward").attr("data-value");
		} else if (obj == -1) { //表示上月数据
			month = $("#backoff").attr("data-value");
		} else {
			//表示被人客户端恶意修改参数
			return;
		}
		if (null == month || "" == month) {
			toastr.success("已经没有数据了！");
			return;
		} else {
			//ajax读取 上一月的数据
			jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxLoadData.do?page=" + month+"&current="+pageSize,
				success : function(data) {
					var json = eval('(' + data + ')');
					if (json.success) {
						$("#forward").attr("data-value", json.nextMonth); //下一月
						$("#backoff").attr("data-value", json.lastMonth); //上一月
						t(json.order); //调用图形列表方法
					} else {
						//toastr.success(json.message);
					}
				}
			});
		}
	}
</script>

<!-- END PAGE SCRIPTS -->