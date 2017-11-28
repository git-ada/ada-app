
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
table.dataTable {
    clear: both;
    margin-bottom: 0px !important;
    margin-top: 0px !important;
    max-width: none !important;
}

table.dataTable thead td
{
	border-top:none!important;	
	border-bottom:none!important;	
}

.DTFC_LeftHeadWrapper .no-footer {
	border-bottom: 1px solid #e7ecf1!important;
}


.dataTables_scrollHead {
	border-top:none!important;	
    border-bottom: 1px solid #e7ecf1!important;
}

.DTFC_LeftBodyLiner tbody td{
	border-top:none!important;
	border-bottom: 1px solid #e7ecf1!important;
}

.DTFC_LeftBodyLiner table {
	border-top:none!important;
	margin-bottom: 0;
	
}
div.DTS div.dataTables_scrollBody {
    background: none;
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

<div class="row" style="margin-top: 30px;display: none;">
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
<!-- 渠道和域名数据列表                           ---------------------------------------------------------------- -->
<div class="portlet-body " style="margin-top: 25px;">
	<table id="scrolltable" class="table table-striped table-bordered table-hover order-column">
            <thead>
                <tr>
					<th scope="col" style="min-width: 120px;">渠道 / 域名</th>
					<th scope="col" style="min-width: 60px">IP</th>			
					<th scope="col" style="min-width: 60px">PV</th>
					<th scope="col" style="min-width: 80px">登录用户数</th>	
					<th scope="col" style="min-width: 80px">1-2次点击</th>			
					<th scope="col" style="min-width: 80px">3-5次点击</th>			
					<th scope="col" style="min-width: 80px">6-10次点击</th>			
					<th scope="col" style="min-width: 80px">10+次点击</th>			
					<th scope="col" style="min-width: 80px">进入目标页</th>
					<th scope="col" style="min-width: 80px">5-30秒停留</th>
					<th scope="col" style="min-width: 80px">31-120秒</th>
					<th scope="col" style="min-width: 80px">121-300秒</th>
					<th scope="col" style="min-width: 80px">300+秒停留</th>
					<th scope="col" style="min-width: 80px">1-2次滚动</th>
					<th scope="col" style="min-width: 80px">3-5次滚动</th>
					<th scope="col" style="min-width: 80px">6-10次滚动</th>
					<th scope="col" style="min-width: 80px">10+次滚动</th>
					<th scope="col" style="min-width: 80px">1-2次移动</th>
					<th scope="col" style="min-width: 80px">3-5次移动</th>
					<th scope="col" style="min-width: 80px">6-10次移动</th>
					<th scope="col" style="min-width: 80px">10+次移动</th>
					
			     </tr>
            </thead>
            <tbody id="tbody">
               <c:forEach var="item" items="${pageResults}" varStatus="number">
                <tr>
					<td style="min-width: 150px;">${item.channelName}</td>
					<td style="min-width: 80px">${item.ip}</td>
					<td style="min-width: 80px">${item.pv}</td>
					<td style="min-width: 80px">${item.olduserip} (${item.old}%)</td>
					<td style="min-width: 80px">${item.clickip1} (${item.c1}%)</td>
					<td style="min-width: 80px">${item.clickip2} (${item.c2}%)</td>
					<td style="min-width: 80px">${item.clickip3} (${item.c3}%)</td>
					<td style="min-width: 80px">${item.clickip4} (${item.c4}%)</td>
					<td style="min-width: 80px">${item.targetpageip} (${item.tgp}%)</td>
					<td style="min-width: 80px">${item.staytimeip1} (${item.s1}%)</td>
					<td style="min-width: 80px">${item.staytimeip2} (${item.s2}%)</td>
					<td style="min-width: 80px">${item.staytimeip3} (${item.s3}%)</td>
					<td style="min-width: 80px">${item.staytimeip4} (${item.s4}%)</td>
					<td style="min-width: 80px">${item.scrollip1} (${item.sc1}%)</td>
					<td style="min-width: 80px">${item.scrollip2} (${item.sc2}%)</td>
					<td style="min-width: 80px">${item.scrollip3} (${item.sc3}%)</td>
					<td style="min-width: 80px">${item.scrollip4} (${item.sc4}%)</td>
					<td style="min-width: 80px">${item.moveip1} (${item.m1}%)</td>
					<td style="min-width: 80px">${item.moveip2} (${item.m2}%)</td>
					<td style="min-width: 80px">${item.moveip3} (${item.m3}%)</td>
					<td style="min-width: 80px">${item.moveip4} (${item.m4}%)</td>
					
                </tr>
                </c:forEach>
                	<c:forEach var="domain" items="${DomainStat_list}" varStatus="number">
                <tr>
					<td style="min-width: 150px;" title="${domain.domain}">${domain.subDomain}</td>
					<td style="min-width: 80px">${domain.ip}</td>
					<td style="min-width: 80px">${domain.pv}</td>
					<td style="min-width: 80px">${domain.olduserip} (${domain.old}%)</td>
					<td style="min-width: 80px">${domain.clickip1} (${domain.c1}%)</td>
					<td style="min-width: 80px">${domain.clickip2} (${domain.c2}%)</td>
					<td style="min-width: 80px">${domain.clickip3} (${domain.c3}%)</td>
					<td style="min-width: 80px">${domain.clickip4} (${domain.c4}%)</td>
					<td style="min-width: 80px">${domain.targetpageip} (${domain.tgp}%)</td>
					<td style="min-width: 80px">${domain.staytimeip1} (${domain.s1}%)</td>
					<td style="min-width: 80px">${domain.staytimeip2} (${domain.s2}%)</td>
					<td style="min-width: 80px">${domain.staytimeip3} (${domain.s3}%)</td>
					<td style="min-width: 80px">${domain.staytimeip4} (${domain.s4}%)</td>
					<td style="min-width: 80px">${domain.scrollip1} (${domain.sc1}%)</td>
					<td style="min-width: 80px">${domain.scrollip2} (${domain.sc2}%)</td>
					<td style="min-width: 80px">${domain.scrollip3} (${domain.sc3}%)</td>
					<td style="min-width: 80px">${domain.scrollip4} (${domain.sc4}%)</td>
					<td style="min-width: 80px">${domain.moveip1} (${domain.m1}%)</td>
					<td style="min-width: 80px">${domain.moveip2} (${domain.m2}%)</td>
					<td style="min-width: 80px">${domain.moveip3} (${domain.m3}%)</td>
					<td style="min-width: 80px">${domain.moveip4} (${domain.m4}%)</td>
					
                </tr>
                </c:forEach>
            </tbody>
        </table>
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

var initTable1 = function () {
    var table = $('#scrolltable');

    var oTable = table.dataTable({

        // Internationalisation. For more info refer to http://datatables.net/manual/i18n
        "language": {
            "aria": {
                "sortAscending": ": activate to sort column ascending",
                "sortDescending": ": activate to sort column descending"
            },
            "emptyTable": "No data available in table",
            "info": "",
            "infoEmpty": "No entries found",
            "infoFiltered": "(filtered1 from _MAX_ total entries)",
            "lengthMenu": "_MENU_ entries",
            "search": "Search:",
            "zeroRecords": "No matching records found"
        },
        buttons: [
        ],
        scrollY:        window.screen.height-450,
        deferRender:    true,
        "ordering": false,
        scroller:       true,
        scrollX:        true,
        
        stateSave:      true,
        "searching": false,
        fixedColumns:   {
            leftColumns: 3
        },
        "order": [
            [0, 'asc']
        ],
        "lengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"] // change per page values here
        ],
        // set the initial value
        "pageLength": 10,

        "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable

        // Uncomment below line("dom" parameter) to fix the dropdown overflow issue in the datatable cells. The default datatable layout
        // setup uses scrollable div(table-scrollable) with overflow:auto to enable vertical scroll(see: assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js). 
        // So when dropdowns used the scrollable div should be removed. 
        //"dom": "<'row' <'col-md-12'T>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r>t<'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>",
    });
}

	jQuery(document).ready(function() {
		

	    
	    initTable1();
		
		
		//$('#tbody').css("height",window.screen.height-465+"px");
		/* var table = $('#sample_1').DataTable( {
	        scrollY:        "300px",
	        scrollX:        true,
	        scrollCollapse: false,
	        paging:         false,
	        "searching": false,
	        fixedColumns:   {
	            leftColumns: 1
	        }
	    } ); */
		//graphicLoading(1);
		
	});
	
	
	
	var pageSize;
	
	function a() {
		var w = $(window).width();
	 
		pageSize=500>w ? 7 : (1000>w && w>=500) ? 12 : (1500>w && w>=1000) ? 20 : (2000>w && w>=1500) ? 30 : 30;
		
		$("#forward").attr("data-value",1); //下一月
		$("#backoff").attr("data-value",""); //上一月
	 
			//graphicLoading(1);
		
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
			//toastr.success("已经没有数据了！");
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
						//toastr.success(json.message);
					}
				}
			});
		}
	} 
	 
	 var ajaxTime = 2000;
	 
	 var t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
	  
	 function ajaxRefreshPage(){
		 jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxRefreshPage.do",
				success : function(data) {
					if (data!=null) {
						var json = eval('(' + data + ')');
						$("#ip").html(json.siteStat.ip);
						$("#pv").html(json.siteStat.pv);
						$("#cip").html(json.channelSumIP);
						$("#cpv").html(json.channelSumPV);
						
						/** 渠道数据列表 **/
						var list = json.ChannelStat_list;
						var open = "";
						var lefttale = "";
						for(var i=0;i<list.length;i++){
							var tr = "";
							 tr+="<tr>" + 
							      "<td >"+list[i].channelName+"</td>"+
								  "<td >"+list[i].ip+"</td>"+
								  "<td >"+list[i].pv+"</td>"+
								  "<td >"+list[i].olduserip+" ("+list[i].old+"%)</td>"+
								  "<td >"+list[i].clickip1+" ("+list[i].c1+"%)</td>"+
								  "<td >"+list[i].clickip2+" ("+list[i].c2+"%)</td>"+
								  "<td >"+list[i].clickip3+" ("+list[i].c3+"%)</td>"+
								  "<td >"+list[i].clickip4+" ("+list[i].c4+"%)</td>"+
								  "<td >"+list[i].targetpageip+" ("+list[i].tgp+"%)</td>"+
								  "<td >"+list[i].staytimeip1+" ("+list[i].s1+"%)</td>"+
								  "<td >"+list[i].staytimeip2+" ("+list[i].s2+"%)</td>"+
								  "<td >"+list[i].staytimeip3+" ("+list[i].s3+"%)</td>"+
								  "<td >"+list[i].staytimeip4+" ("+list[i].s4+"%)</td>"+
								  "<td >"+list[i].scrollip1+" ("+list[i].sc1+"%)</td>"+
								  "<td >"+list[i].scrollip2+" ("+list[i].sc2+"%)</td>"+
								  "<td >"+list[i].scrollip3+" ("+list[i].sc3+"%)</td>"+
								  "<td >"+list[i].scrollip4+" ("+list[i].sc4+"%)</td>"+
								  "<td >"+list[i].moveip1+" ("+list[i].m1+"%)</td>"+
								  "<td >"+list[i].moveip2+" ("+list[i].m2+"%)</td>"+
								  "<td >"+list[i].moveip3+" ("+list[i].m3+"%)</td>"+
								  "<td >"+list[i].moveip4+" ("+list[i].m4+"%)</td>"+
								  
								  "</tr>";
							open+=tr;
							
							var tr2 = "";
								tr2+="<tr>"+
								 "<td >"+list[i].channelName+"</td>"+
								  "<td >"+list[i].ip+"</td>"+
								  "<td >"+list[i].pv+"</td>"+
									"<tr>";
								lefttale+=tr2;
							
						}
						
						/** 域名数据列表 **/
						var domainList = json.DomainStat_list;
						var domain = "";
						for(var i=0;i<domainList.length;i++){
							var tr = "";
							 tr+="<tr>" + 
							      "<td  title='${item.domain}'>"+domainList[i].subDomain+"</td>"+
								  "<td >"+domainList[i].ip+"</td>"+
								  "<td >"+domainList[i].pv+"</td>"+
								  "<td >"+domainList[i].olduserip+" ("+domainList[i].old+"%)</td>"+
								  "<td >"+domainList[i].clickip1+" ("+domainList[i].c1+"%)</td>"+
								  "<td >"+domainList[i].clickip2+" ("+domainList[i].c2+"%)</td>"+
								  "<td >"+domainList[i].clickip3+" ("+domainList[i].c3+"%)</td>"+
								  "<td >"+domainList[i].clickip4+" ("+domainList[i].c4+"%)</td>"+
								  "<td >"+domainList[i].targetpageip+" ("+domainList[i].tgp+"%)</td>"+
								  "<td >"+domainList[i].staytimeip1+" ("+domainList[i].s1+"%)</td>"+
								  "<td >"+domainList[i].staytimeip2+" ("+domainList[i].s2+"%)</td>"+
								  "<td >"+domainList[i].staytimeip3+" ("+domainList[i].s3+"%)</td>"+
								  "<td >"+domainList[i].staytimeip4+" ("+domainList[i].s4+"%)</td>"+
								  "<td >"+domainList[i].scrollip1+" ("+domainList[i].sc1+"%)</td>"+
								  "<td >"+domainList[i].scrollip2+" ("+domainList[i].sc2+"%)</td>"+
								  "<td >"+domainList[i].scrollip3+" ("+domainList[i].sc3+"%)</td>"+
								  "<td >"+domainList[i].scrollip4+" ("+domainList[i].sc4+"%)</td>"+
								  "<td >"+domainList[i].moveip1+" ("+domainList[i].m1+"%)</td>"+
								  "<td >"+domainList[i].moveip2+" ("+domainList[i].m2+"%)</td>"+
								  "<td >"+domainList[i].moveip3+" ("+domainList[i].m3+"%)</td>"+
								  "<td >"+domainList[i].moveip4+" ("+domainList[i].m4+"%)</td>"+
								  
								  "</tr>";
								  open+=tr;
								  
								  var tr2 = "";
									tr2+="<tr>"+
											 "<td  title='${item.domain}'>"+domainList[i].subDomain+"</td>"+
											  "<td >"+domainList[i].ip+"</td>"+
											  "<td >"+domainList[i].pv+"</td>"+
										"<tr>";
									lefttale+=tr2;
						}
						
						jQuery("#tbody").empty();
						jQuery("#tbody").append(open);
						
						jQuery(".DTFC_LeftBodyWrapper #tbody").empty();
						jQuery(".DTFC_LeftBodyWrapper #tbody").append(lefttale);
						//DTFC_LeftBodyWrapper
						//initTable1();
						//jQuery("#domain").empty();
						//jQuery("#domain").append(domain);
					}
					clearTimeout(t);
					if(browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0){
						ajaxTime=2000;
						t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
					}
					
				},
				error: function (data) {
					clearTimeout(t);
					ajaxTime=ajaxTime*2;
					t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
				}
			});
	 }
	 
</script>

<!-- END PAGE SCRIPTS -->
