<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
.table-scrollable{
	margin-top: 0px !important;
}
th:last-child,td:last-child {
    border-right-width: 1px !important;
}
.portlet {
    border-radius: 4px;
    margin-bottom: 0px !important;
    margin-top: 0px;
    padding: 0px;
}
.table-scrollable {
    border: 1px solid #e7ecf1;
    margin: 0px 0 !important;
    overflow-x: auto;
    overflow-y: hidden;
    width: 100%;
}
.dataTables_scroll {
    margin-bottom: 0px !important;
}
.displaynone{
	display: none;
}
.page-spinner-bar {
    left: 50%;
    margin-left: -55px;
    position: fixed;
    text-align: center;
    top: 40%;
    width: 100px;
    z-index: 10060 !important;
}

</style>

<!-- 
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
 -->
<div class="row" style="margin-bottom: 15px;">
	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat blue margin-bottom0">
			<div class="visual">
				<i class="fa fa-comments"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${sumip}" id="ip">${sumip}</span>(个)
				</div>
				<c:if test="${dataType=='domain'}"><div class="desc" id="SUMIP">全站独立IP数</div></c:if>
				<c:if test="${dataType=='domainAd'}"><div class="desc" id="SUMIP">广告入口独立IP数</div></c:if>
				<c:if test="${dataType=='domainNotAd'}"><div class="desc" id="SUMIP">非广告入口独立IP数</div></c:if>
			</div>
		</div>
	</div>

	<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
		<div class="dashboard-stat green margin-bottom0">
			<div class="visual">
				<i class="fa fa-shopping-cart"></i>
			</div>
			<div class="details">
				<div class="number">
					<span data-counter="counterup" data-value="${sumpv}" id="pv">${sumpv}</span>(页)
				</div>
				<c:if test="${dataType=='domain'}"><div class="desc" id="SUMPV">全站访问量</div></c:if>
				<c:if test="${dataType=='domainAd'}"><div class="desc" id="SUMPV">广告入口访问量</div></c:if>
				<c:if test="${dataType=='domainNotAd'}"><div class="desc" id="SUMPV">非广告入口访问量</div></c:if>
			</div>
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
		</div>
	</div>
</div>

<div class="portlet light portlet-fit bordered">
	<div class="portlet-title" style="padding-bottom: 0;margin-bottom: 0;padding-top: 5px;padding-right: 5px;">
		<div class="caption" style="padding-bottom: 0px;">
            <span class="caption-subject bold font-dark uppercase ">
            	<c:if test="${dataType=='domain'}">全站统计</c:if>
            	<c:if test="${dataType=='domainAd'}">广告入口统计</c:if> 
            	<c:if test="${dataType=='domainNotAd'}">非广告入口统计</c:if>  
            </span>
            <span class="caption-helper" id="lasttime">最后一次更新时间 ${lasttime}</span>
        </div>
        <div class="inputs">
            <div class="actions" style="float: left;">
				<a class="btn btn-circle btn-icon-only btn-default pause" id="pauseOrplay"><i class="icon-control-pause" ></i></a>
				<a class="btn btn-circle btn-icon-only btn-default fullscreen"  id="fullscreenOractual"><i class="icon-size-fullscreen"></i></a>
			</div>
        </div>
	</div>
	
	<!-- 渠道和域名数据列表                           ---------------------------------------------------------------- -->
	<div class="portlet-body" style="margin: 0px;padding: 0;">
		<table id="scrolltable" class="table table-striped table-bordered table-hover order-column" style="border: 0">
	            <thead>
	                <tr>
	                	<c:if test="${dataType=='domain'}"><th scope="col" style="min-width: 150px;" id="firstTh">域名</th></c:if>
						<c:if test="${dataType=='domainAd'}"><th scope="col" style="min-width: 150px;" id="firstTh">域名</th></c:if>
						<c:if test="${dataType=='domainNotAd'}"><th scope="col" style="min-width: 150px;" id="firstTh">域名</th></c:if>
						<th scope="col" style="min-width: 80px">IP</th>			
						<th scope="col" style="min-width: 80px">PV</th>
						<th scope="col" style="min-width: 80px">UV</th>
						<th scope="col" style="min-width: 80px">登录用户数</th>
						<th scope="col" style="min-width: 80px">老IP数</th>
						<th scope="col" style="min-width: 80px">老用户数</th>	
						<th scope="col" style="min-width: 80px">进入目标页</th>
						
						<th scope="col" style="min-width: 80px">停留 <a style="color: #333;" onclick="changeDisplay(this,'st')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="st">5-30秒</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="st">31-120秒</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="st">121-300秒</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="st">300+秒</th>
						
						<th scope="col" style="min-width: 80px">点击<a style="color: #333;" onclick="changeDisplay(this,'c')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="c">1-2次</th>			
						<th scope="col" style="min-width: 80px" class="displaynone" event="c">3-5次</th>			
						<th scope="col" style="min-width: 80px" class="displaynone" event="c">6-10次</th>			
						<th scope="col" style="min-width: 80px" class="displaynone" event="c">10+次</th>
						
						<th scope="col" style="min-width: 80px">滚动<a style="color: #333;" onclick="changeDisplay(this,'s')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="s">1-2次</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="s">3-5次</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="s">6-10次</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="s">10+次</th>
						
						<th scope="col" style="min-width: 80px">移动<a style="color: #333;" onclick="changeDisplay(this,'m')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="m">1-2次</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="m">3-5次</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="m">6-10次</th>
						<th scope="col" style="min-width: 80px" class="displaynone" event="m">10+次</th>
				     </tr>
	            </thead>
	            <tbody id="tbody">
	                	<c:forEach var="item" items="${DomainStat_list}" varStatus="number">
	                <tr>
                		<td style="min-width: 150px;" title="${item[24]}">
                			<c:if test="${dataType=='domain'}"><a id="dropdown" style="text-decoration:underline;color: #333;"  data-target="#context-menu${item[23]}" data-toggle="dropdown" onclick="openMenu(this)">${item[25]}</a></c:if>
                			<c:if test="${dataType=='domainAd'}"><a id="dropdown" style="text-decoration:underline;color: #333;"  data-target="#context-menu${item[23]}" data-toggle="dropdown" onclick="openMenu(this)">${item[25]}</a></c:if>
                			<c:if test="${dataType=='domainNotAd'}"><a id="dropdown" style="text-decoration:underline;color: #333;"  data-target="#context-menu${item[23]}" data-toggle="dropdown" onclick="openMenu(this)">${item[25]}</a></c:if>
                		</td>
						<td style="min-width: 80px">${item[0]}</td>
						<td style="min-width: 80px">${item[1]}</td>
						<td style="min-width: 80px">${item[2]}</td>
						<!-- ${domain.loginip} (${domain.log}%) eef1f5-->
						<td style="min-width: 80px">${item[3]} (<fmt:formatNumber type="number" value="${item[3] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px">${item[4]} (<fmt:formatNumber type="number" value="${item[4] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px">${item[5]} (<fmt:formatNumber type="number" value="${item[5] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px">${item[6]} (<fmt:formatNumber type="number" value="${item[6] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td> 
						
						<c:set var="sumST" scope="session" value="${item[7]+item[8]+item[9]+item[10]}"/>
						<c:set var="sumC" scope="session" value="${item[11]+item[12]+item[13]+item[14]}"/>
						<c:set var="sumS" scope="session" value="${item[15]+item[16]+item[17]+item[18]}"/>
						<c:set var="sumM" scope="session" value="${item[19]+item[20]+item[21]+item[22]}"/>
						
						<td style="min-width: 80px">${sumST} (<fmt:formatNumber type="number" value="${sumST / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="st">${item[7]} (<fmt:formatNumber type="number" value="${item[7] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="st">${item[8]} (<fmt:formatNumber type="number" value="${item[8] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="st">${item[9]} (<fmt:formatNumber type="number" value="${item[9] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="st">${item[10]} (<fmt:formatNumber type="number" value="${item[10] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						
						<td style="min-width: 80px">${sumC} (<fmt:formatNumber type="number" value="${sumC / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="c">${item[11]} (<fmt:formatNumber type="number" value="${item[11] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="c">${item[12]} (<fmt:formatNumber type="number" value="${item[12] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="c">${item[13]} (<fmt:formatNumber type="number" value="${item[13] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="c">${item[14]} (<fmt:formatNumber type="number" value="${item[14] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						
						<td style="min-width: 80px">${sumS} (<fmt:formatNumber type="number" value="${sumS / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="s">${item[15]} (<fmt:formatNumber type="number" value="${item[15] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="s">${item[16]} (<fmt:formatNumber type="number" value="${item[16] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="s">${item[17]} (<fmt:formatNumber type="number" value="${item[17] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="s">${item[18]} (<fmt:formatNumber type="number" value="${item[18] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						
						<td style="min-width: 80px">${sumM} (<fmt:formatNumber type="number" value="${sumM / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="m">${item[19]} (<fmt:formatNumber type="number" value="${item[19] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="m">${item[20]} (<fmt:formatNumber type="number" value="${item[20] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="m">${item[21]} (<fmt:formatNumber type="number" value="${item[21] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px" class="displaynone" event="m">${item[22]} (<fmt:formatNumber type="number" value="${item[22] / item[0]}" pattern="0.00" maxFractionDigits="2"/>%)</td>
	                </tr>
	                </c:forEach>
	                
	                 <c:forEach var="item" items="${DomainStat_list}" varStatus="number">
						<div id="context-menu${item[23]}" style="z-index: 999;position:absolute;">
							<ul class="dropdown-menu" role="menu" style="z-index: 99999;"  >
								
						      	<!-- <li>
							         <a href="javascript:;" onclick="changeDataType('domainAd')">域名统计（广告入口）</a>
							     </li>
							     <li>
							         <a href="javascript:;" onclick="changeDataType('domainNotAd')">域名统计（非广告入口）</a>
							     </li>  -->
							     <c:if test="${dataType=='domain'}">
							     	<li>
							       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId=${item[23]}')">分时统计</a>
							     </li>
								     <li>
								         <a href="javascript:;" onclick="changeDataType('domainRegion',${item[23]})">地域统计</a>
								     </li>
							     </c:if>
							     <c:if test="${dataType=='domainAd'}">
							     	<li>
							       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainAdTime.jhtm?domainId=${item[23]}&dataType=${dataType}')">分时统计</a>
							     </li>
								     <li>
								         <a href="javascript:;" onclick="changeDataType('domainRegionAd',${item[23]})">地域统计</a>
								     </li>
							     </c:if>
							     <c:if test="${dataType=='domainNotAd'}">
							     	<li>
							       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainAdTime.jhtm?domainId=${item[23]}&dataType=${dataType}')">分时统计</a>
							     </li>
								     <li>
								         <a href="javascript:;" onclick="changeDataType('domainRegionNotAd',${item[23]})">地域统计</a>
								     </li>
							     </c:if>
							    <%-- <li>
							         <a href="javascript:;" onclick="changeDataType('domainRegionAd',${item[23]})">地域统计（广告入口）</a>
							     </li>
							     <li>
							         <a href="javascript:;" onclick="changeDataType('domainRegionNotAd',${item[23]})">地域统计（非广告入口）</a>
							     </li>  --%>
							 </ul>
						</div>
					</c:forEach>
	            </tbody>
	            
	            
	        </table>
	</div>
</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var dataType = '${dataType}';//页面数据类型
var domainId = "";//域名ID
function openMenu(a,event){
	 var e = event || window.event;
	var yy  = parseInt(e.screenY-120);
	var  xx = parseInt(e.screenX);
	var menuHeight = parseInt(jQuery(jQuery(a).attr("data-target")+" ul").css("height"));//菜单高度
	var cHeight = parseInt(document.documentElement.clientHeight)-menuHeight;//页面可视高度
	if(yy+menuHeight>=cHeight){
		jQuery(jQuery(a).attr("data-target")).css({"top":yy-menuHeight,"left":xx});
	}else{
		jQuery(jQuery(a).attr("data-target")).css({"top":yy,"left":xx});
	}
	
}
//百分比
function Percentage(num, total) { 
    return (Math.round(num / total * 10000) / 100.00 + "%");// 小数点后两位百分比
   
}

/** 修改td样式 **/
function changeDisplay(a,data){
	 var i = jQuery(a).find("i");
	  if(jQuery(i).attr("class")=="icon-magnifier-add"){
		  jQuery(i).removeClass("icon-magnifier-add");
		  jQuery(i).addClass("icon-magnifier-remove");
		
		  jQuery("[event="+data+"]").toggleClass("displaynone");
		  jQuery(".dataTables_scrollHeadInner").css("width","4000px");
		  
		  var left =  jQuery(".dataTables_scrollBody").scrollLeft();
		  jQuery(".dataTables_scrollBody").scrollLeft(left+500);
	  }else if(jQuery(i).attr("class")=="icon-magnifier-remove"){
		  jQuery(i).removeClass("icon-magnifier-remove");
		  jQuery(i).addClass("icon-magnifier-add");
		  
		  jQuery("[event="+data+"]").toggleClass("displaynone");
			 
	  }
	 
	 
}
 

var t;
var isRefresh = true;
var oTable;
var oTable2;
var table;
//渲染table
var initTable1 = function () {
     table = $('#scrolltable');
     oTable = table.dataTable({
        "language": {
            "aria": {
                "sortAscending": ": activate to sort column ascending",
                "sortDescending": ": activate to sort column descending"
            },
            "emptyTable": "暂无数据",
            "info": "",
            "infoEmpty": "",
            "infoFiltered": "(filtered1 from _MAX_ total entries)",
            "lengthMenu": "_MENU_ entries",
            "search": "Search:",
            "zeroRecords": "No matching records found"
        },
        buttons: [
        ],
        scrollY:        document.documentElement.clientHeight-290,
        deferRender:    true,
        "ordering": false,
        scroller:       true,
        scrollX:        true,
        "info": false,
        stateSave:      true,
        "searching": false,
        fixedColumns:   {
            leftColumns: 2
        },
        "order": [
            [0, 'asc']
        ],
        "lengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"] // change per page values here
        ],
        "pageLength": 10,
        "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
    });
}

	jQuery(document).ready(function() {
	    initTable1();
	     jQuery("#pauseOrplay").click(function(){
	    	 if(jQuery("#pauseOrplay i").attr("class")=="icon-control-pause"){
	    		 jQuery("#pauseOrplay i").removeClass("icon-control-pause");
	    		 jQuery("#pauseOrplay i").addClass("icon-control-play");
	    		 clearTimeout(t);
	    		 isRefresh = false;
	    	 }else if(jQuery("#pauseOrplay i").attr("class")=="icon-control-play"){
	    		 jQuery("#pauseOrplay i").removeClass("icon-control-play");
	    		 jQuery("#pauseOrplay i").addClass("icon-control-pause");
				 ajaxRefreshPage();
				 isRefresh = true;
	    	 }
	     });
	    
	    jQuery("#fullscreenOractual").click(function(){
	    	 if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-fullscreen"){
	    		 
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-95);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-55);
	    		 
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-111);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-111);
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-fullscreen");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-actual");
	    		 
	    		   
	    	 }else if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-actual"){
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-290);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-235);
	    		
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-290);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-290);
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-actual");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-fullscreen");
	    		 
	    	 }
	     });  
	});
	/**改变页面数据类型**/
	function changeDataType(type,domainId){
		App.startPageLoading({animate: !0});//开启 加载 动画
		dataType = type;
		ajaxRefreshPage(type,domainId);
		
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
	 //第一次异步刷新
	 t = window.setTimeout("ajaxRefreshPage('"+dataType+"')",ajaxTime); 
	  
	 function ajaxRefreshPage(type,domainId){
		 jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxRefreshPage.do?dataType="+type+"&domainId="+domainId,
				success : function(data) {
					
					if (data!=null) {
						var json = eval('(' + data + ')');
						
						domainId = json.domainId;//域名ID
						var table = "";
						var lefttable = "";
						var menu = "";
						var firstTh = "域名";
						var SUMIP = "";
						var SUMPV = "";
						/** 数据列表 **/
						var dataList = json.data_list;
						if(dataType=="domain"){
							firstTh = "域名";
							SUMIP = "全站独立IP数";
							SUMPV = "全站访问量";
						}else if(dataType=="domainAd"){
							SUMIP = "广告入口独立IP数";
							SUMPV = "广告入口访问量";
							firstTh = "域名";
						}else if(dataType=="domainNotAd"){
							SUMIP = "非广告入口独立IP数";
							SUMPV = "非广告入口访问量";
							firstTh = "域名";
						}else if(dataType=="domainRegion"){
							SUMIP = "地域独立IP数";
							SUMPV = "地域访问量";
							firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domain\")'><i class='icon-action-undo'></i></a>";
						}else if(dataType=="domainRegionAd"){
							SUMIP = "地域广告入口独立IP数";
							SUMPV = "地域广告入口访问量";
							firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domainAd\")'><i class='icon-action-undo'></i></a>";
						}else if(dataType=="domainRegionNotAd"){
							SUMIP = "地域非广告入口独立IP数";
							SUMPV = "地域非广告入口访问量";
							firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domainNotAd\")'><i class='icon-action-undo'></i></a>";
						}
						if(dataList!=null && dataList.length>0){
							for(var i=0;i<dataList.length;i++){
								var item = dataList[i];
								var firstTd = "";
								var tr = "";
							    var tr2 = "";
							    var tr3 = "";
							    if(dataType=="domain"){
							    	firstTd="<td style='min-width: 150px;'  title='"+item[24]+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu"+item[23]+"' data-toggle='dropdown' onclick='openMenu(this)'>"+item[25]+"</a></td>";
							    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
									"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
										"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId="+item[23]+"\")'>分时统计</a></li>"+
										 /* "<li><a href='javascript:;' onclick='changeDataType(\"domainAd\")'>域名统计（广告入口）</a></li>"+
								     	 "<li><a href='javascript:;' onclick='changeDataType(\"domainNotAd\")'>域名统计（非广告入口）</a></li>"+ */
	                                	 /* "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionAd,"+item[23]+"\")'>地域统计（广告入口）</a></li>"+
	                                 	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionNotAd,"+item[23]+"\")'>地域统计（非广告入口）</a></li>"+ */ 
	                                 	"<li><a href='javascript:;' onclick='changeDataType(\"domainRegion,"+item[23]+"\")'>地域统计</a></li>"+
							      	"</ul></div>";
							      	menu+=tr3;
							    }else if(dataType=="domainAd"){
							    	firstTd = "<td style='min-width: 150px;'  title='"+item[24]+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu"+item[23]+"' data-toggle='dropdown' onclick='openMenu(this)'>"+item[25]+"</a></td>";
							    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
									"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
										"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/dashboard_domainAdTime.jhtm?domainId="+item[23]+"&dataType="+dataType+"\")'>分时统计</a></li>"+
	                                	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionAd,"+item[23]+"\")'>地域统计</a></li>"+
							      	"</ul></div>";
							      	menu+=tr3;
							    	
							    }else if(dataType=="domainNotAd"){
							    	firstTd = "<td style='min-width: 150px;'  title='"+item[24]+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu"+item[23]+"' data-toggle='dropdown' onclick='openMenu(this)'>"+item[25]+"</a></td>";
							    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
									"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
										"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/dashboard_domainAdTime.jhtm?domainId="+item[23]+"&dataType="+dataType+"\")'>分时统计</a></li>"+
	                                	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionNotAd,"+item[23]+"\")'>地域统计</a></li>"+
							      	"</ul></div>";
							      	menu+=tr3;
							    }else if(){
							    	firstTd = "<td style='min-width: 150px;'  >"+item[23]+"</td>";
							    }else if(dataType=="domainRegionAd"){
							    	firstTd = "<td style='min-width: 150px;'  >"+item[23]+"</td>";
							    }else if(dataType=="domainRegionNotAd"){
							    	firstTd = "<td style='min-width: 150px;'  >"+item[23]+"</td>";
							    }
							    var stDisplay = jQuery("[event=st]").first().attr("class");
							    var cDisplay = jQuery("[event=c]").first().attr("class");
							    var sDisplay = jQuery("[event=s]").first().attr("class");
							    var mtDisplay = jQuery("[event=m]").first().attr("class");
							    
							    var sumST = item[7]+item[8]+item[9]+item[10];
							    var sumC = item[11]+item[12]+item[13]+item[14];
							    var sumS = item[15]+item[16]+item[17]+item[18];
							    var sumM = item[19]+item[20]+item[21]+item[22];
							    var IP = item[0];
						  		tr+="<tr>" + firstTd+
								  "<td >"+IP+"</td>"+
								  "<td >"+item[1]+"</td>"+
								  "<td >"+item[2]+"</td>"+
								  "<td >"+item[3]+" ("+Percentage(item[3],IP)+")</td>"+
								  "<td >"+item[4]+" ("+Percentage(item[4],IP)+")</td>"+
								  "<td >"+item[5]+" ("+Percentage(item[5],IP)+")</td>"+
								  "<td >"+item[6]+" ("+Percentage(item[6],IP)+")</td>"+
								  
								  "<td >"+sumST+" ("+Percentage(sumST,IP)+")</td>"+
								  "<td class='"+stDisplay+"' event='st'>"+item[7]+" ("+Percentage(item[7],IP)+")</td>"+
								  "<td class='"+stDisplay+"' event='st'>"+item[8]+" ("+Percentage(item[8],IP)+")</td>"+
								  "<td class='"+stDisplay+"' event='st'>"+item[9]+" ("+Percentage(item[9],IP)+")</td>"+
								  "<td class='"+stDisplay+"' event='st'>"+item[10]+" ("+Percentage(item[10],IP)+")</td>"+
								  
								  "<td >"+sumC+" ("+Percentage(sumC,IP)+")</td>"+
								  "<td class='"+cDisplay+"' event='c'>"+item[11]+" ("+Percentage(item[11],IP)+")</td>"+
								  "<td class='"+cDisplay+"' event='c'>"+item[12]+" ("+Percentage(item[12],IP)+")</td>"+
								  "<td class='"+cDisplay+"' event='c'>"+item[13]+" ("+Percentage(item[13],IP)+")</td>"+
								  "<td class='"+cDisplay+"' event='c'>"+item[14]+" ("+Percentage(item[14],IP)+")</td>"+
								  
								  "<td >"+sumS+" ("+Percentage(sumS,IP)+")</td>"+
								  "<td class='"+sDisplay+"' event='s'>"+item[15]+" ("+Percentage(item[15],IP)+")</td>"+
								  "<td class='"+sDisplay+"' event='s'>"+item[16]+" ("+Percentage(item[16],IP)+")</td>"+
								  "<td class='"+sDisplay+"' event='s'>"+item[17]+" ("+Percentage(item[17],IP)+")</td>"+
								  "<td class='"+sDisplay+"' event='s'>"+item[18]+" ("+Percentage(item[18],IP)+")</td>"+
								  
								  "<td >"+sumM+" ("+Percentage(sumM,IP)+")</td>"+
								  "<td class='"+mtDisplay+"' event='m'>"+item[19]+" ("+Percentage(item[19],IP)+")</td>"+
								  "<td class='"+mtDisplay+"' event='m'>"+item[20]+" ("+Percentage(item[20],IP)+")</td>"+
								  "<td class='"+mtDisplay+"' event='m'>"+item[21]+" ("+Percentage(item[21],IP)+")</td>"+
								  "<td class='"+mtDisplay+"' event='m'>"+item[22]+" ("+Percentage(item[22],IP)+")</td>"+
								  "</tr>";
								  table+=tr;
							  
								tr2+="<tr>"+firstTd+
								  "<td style='min-width: 80px'>"+IP+"</td>"+
								  /* "<td style='min-width: 80px'>"+dataList[i].pv+"</td>"+ */
									"</tr>";
								lefttable+=tr2;
										
							}
						}
						
						if(browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0 && dataType==json.dataType && isRefresh){
							jQuery("#SUMIP").html(SUMIP);
							jQuery("#SUMPV").html(SUMPV);
							jQuery("#ip").html(json.sumip);
							jQuery("#pv").html(json.sumpv);
							jQuery(".DTFC_LeftHeadWrapper #firstTh").html(firstTh);
							jQuery("#tbody").empty();
							jQuery("#tbody").append(table);
							jQuery(".DTFC_LeftBodyWrapper #tbody").empty();
							jQuery(".DTFC_LeftBodyWrapper #tbody").append(lefttable+menu);
							jQuery("#lasttime").html("最后一次更新时间  "+json.lasttime);
							
						}
					
					}
					clearTimeout(t);
					if(browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0 && isRefresh){
						ajaxTime=2000;
						t = window.setTimeout("ajaxRefreshPage('"+dataType+"','"+domainId+"')",ajaxTime); 
					}
					App.stopPageLoading();//关闭 加载动画
				},
				error: function (data) {
					App.stopPageLoading();//关闭 加载动画
					clearTimeout(t);
					ajaxTime=ajaxTime*2;
					t = window.setTimeout("ajaxRefreshPage('"+dataType+"','"+domainId+"')",ajaxTime); 
				}
			});
	 }
	 
</script>

<!-- END PAGE SCRIPTS -->
