
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            	首页
            <i class="fa fa-angle-right"></i>
        </li>
         <li>
            <span>实时数据</span>
        </li>
    </ul>
</div>

<div class="row">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat blue margin-bottom0">
			<div class="visual">
				<i class="fa fa-comments"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${siteStat.ip}" id="ip">${siteStat.ip}</span>(个)
				</div>
				<div class="desc">今日全站独立IP数</div>
			</div>
			<a class="more" href="#"> <i class="m-icon-swapright m-icon-white"></i></a>
			</a>
		</div>
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat green margin-bottom0">
			<div class="visual">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${siteStat.pv}" id="pv">${siteStat.pv}</span>(页)
				</div>
				<div class="desc">今日全站访问量</div>
			</div>
			<a class="more" href="#"> <i class="m-icon-swapright m-icon-white"></i></a>
		</div>
	</div>
	
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat red margin-bottom0">
			<div class="visual">
				<i class="fa fa-bar-chart-o"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${channelSumIP}" id="cip">${channelSumIP}</span>(个)
				</div>
				<div class="desc">今日渠道独立IP数</div>
			</div>
			<a class="more" href="#"> <i class="m-icon-swapright m-icon-white"></i></a>
		</div>
	</div>
	
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat purple margin-bottom0">
			<div class="visual">
				<i class="fa fa-bar-chart-o"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${channelSumPV}" id="cpv">${channelSumPV}</span>(页)
				</div>
				<div class="desc">今日渠道访问量</div>
			</div>
			<a class="more" href="#"> <i class="m-icon-swapright m-icon-white"></i></a>
			</a>
		</div>
	</div>
	
</div>

<!--数据列表-->
<div class="row" style="display: none;">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div >
			<div class="portlet-body" style="padding: 0;">
				<ul id="today_business" class="list-group" style="margin: 0;">
					<li class="list-group-item">今日新增独立IP数 <span class="fr">
						${todaykpi.userNumbers} (IP)</span></li>
					<li class="list-group-item">昨日新增独立IP数 <span class="fr">
						${yestodaykpi.userNumbers} (IP)</span></li>
					<li class="list-group-item">本月新增独立IP数 <span class="fr">
						${monthkpi.userNumbers} (IP)</span></li>
					<li class="list-group-item">上月新增独立IP数<span class="fr">
						${lastMonthkpi.userNumbers} (IP)</span></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="portlet box">
			<div class="portlet-body" style="padding: 0;">
				<ul id="today_increase" class="list-group" style="margin: 0;">
					<li class="list-group-item">今日访问量 <span class="fr">
							${todaykpi.orderNumbers} (PV)</span></li>
					<li class="list-group-item">昨日访问量 <span class="fr">
							${yestodaykpi.orderNumbers} (PV)</span></li>
					<li class="list-group-item">本月访问量 <span class="fr">
							${monthkpi.orderNumbers} (PV)</span></li>
					<li class="list-group-item">上月访问量<span class="fr">
							${lastMonthkpi.orderNumbers} (PV)</span></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="portlet box">
			<div class="portlet-body" style="padding: 0;">
				<ul id="yesterday_business" class="list-group" style="margin: 0;">
					<li class="list-group-item">今日--<span class="fr">
							 ${todaykpi.salesAmount} (-)</span></li>
					<li class="list-group-item">昨日-- <span class="fr">
							 ${yestodaykpi.salesAmount} (-)</span></li>
					<li class="list-group-item">本月-- <span class="fr">
							 ${monthkpi.salesAmount} (-)</span></li>
				    <li class="list-group-item">上月-- <span class="fr">
							 ${lastMonthkpi.salesAmount} (-)</span></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="portlet box" >
			<div class="portlet-body" style="padding: 0;">
				<ul id="yesterday_business" class="list-group" style="margin: 0;">
					<li class="list-group-item">今日--<span class="fr">
							 ${todaykpi.profitsAmount} (-)</span></li>
					<li class="list-group-item">昨日-- <span class="fr">
							 ${yestodaykpi.profitsAmount} (-)</span></li>
					<li class="list-group-item">本月--<span class="fr">
							 ${monthkpi.profitsAmount} (-)</span></li>
				    <li class="list-group-item">上月--<span class="fr">
							 ${lastMonthkpi.profitsAmount} (-)</span></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="row" style="margin-top: 30px;">
	<div class="col-lg-12 col-xs-12 col-sm-12">
		<div class="portlet light bordered">
            <div class="portlet-title">
                <div class="caption">
                    <i class="icon-bar-chart"></i>
                    <span class="caption-subject bold uppercase"> 历史访问量</span>
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
	                	<th scope="col" style="width: 120px;">日期</th>		 
						<th scope="col" style="width: 150px;">渠道</th>			
						<th scope="col" style="width: 120px;">IP</th>			
						<th scope="col" style="width: 120px;">PV</th>			
						<th scope="col" style="width: 100px;">1-2次点击</th>			
						<th scope="col" style="width: 100px;">3-5次点击</th>			
						<th scope="col" style="width: 100px;">6-10次点击</th>			
						<th scope="col" style="width: 100px;">10+次点击</th>			
						<th scope="col" style="width: 100px;">进入目标页</th>
				     </tr>
	            </thead>
	            <%request.setAttribute("today", new Date()); %>
	            <tbody id="tbody">
	               <c:forEach var="item" items="${pageResults}" varStatus="number">
	                <tr>
	                	<td style=""><fmt:formatDate value="${today}" pattern="yyyy-MM-dd"/></td>      
						<td style="">${item.channelName}</td>
						<td style="">${item.ip}</td>
						<td style="">${item.pv}</td>
						<td style="">${item.clickip1}</td>
						<td style="">${item.clickip2}</td>
						<td style="">${item.clickip3}</td>
						<td style="">${item.clickip4}</td>
						<td style="">${item.targetpageip}</td>
	                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
	    <!-- 数据列表 END -->
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
		var pageNo = 1;

		if (obj == 1) { //表示下页数据
			pageNo = $("#forward").attr("data-value");
		} else if (obj == -1) { //表示上月数据
			pageNo = $("#backoff").attr("data-value");
		} else {
			//表示被人客户端恶意修改参数
			return;
		}
		if (null == pageNo || "" == pageNo) {
			toastr.success("已经没有数据了！");
			return;
		} else {
			//ajax读取 上一月的数据
			jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxLoadData.do?pageNo=" + pageNo,
				success : function(data) {
					var json = eval('(' + data + ')');
					if (json.success) {
						$("#forward").attr("data-value", json.nextMonth); //下一页
						$("#backoff").attr("data-value", json.lastMonth); //上一页
						t(json.order); //调用图形列表方法
					} else {
						/* $("#forward").attr("data-value", json.nextMonth); //下一页
						$("#backoff").attr("data-value", json.lastMonth); //上一页
						t(json.order) */
						toastr.success(json.message);
					}
				}
			});
		}
	} 
	 
	   /*  window.setInterval(function(){
		 gotoPage("${pageContext.request.contextPath}/dashboard.jhtm");
	 },5000);     */
		 window.setInterval(function(){
			 jQuery.ajax({
					url : "${pageContext.request.contextPath}/ajaxRefreshPage.do",
					success : function(data) {
						if (data!=null) {
							var json = eval('(' + data + ')');
							$("#ip").html(json.siteStat.ip);
							$("#pv").html(json.siteStat.pv);
							$("#cip").html(json.channelSumIP);
							$("#cpv").html(json.channelSumPV);
							
							var list = json.ChannelStat_list;
							var open = "";
							for(var i=0;i<list.length;i++){
								var tr = "";
								 tr+="<tr><td><fmt:formatDate value='${today}' pattern='yyyy-MM-dd'/></td>" + 
								      "<td>"+list[i].channelName+"</td>"+
									  "<td>"+list[i].ip+"</td>"+
									  "<td>"+list[i].pv+"</td>"+
									  "<td>"+list[i].clickip1+"</td>"+
									  "<td>"+list[i].clickip2+"</td>"+
									  "<td>"+list[i].clickip3+"</td>"+
									  "<td>"+list[i].clickip4+"</td>"+
									  "<td>"+list[i].targetpageip+"</td></tr>";
								open+=tr;
							}
							jQuery("#tbody").empty();
							jQuery("#tbody").append(open);
						}
					}
				});
		 },5000); 
	   
	 
</script>

<!-- END PAGE SCRIPTS -->
