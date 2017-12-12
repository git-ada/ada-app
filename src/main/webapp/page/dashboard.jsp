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
				<c:if test="${dataType=='domain'}"><div class="desc" id="SUMIP">今日全站独立IP数</div></c:if>
				<c:if test="${dataType=='domainAd'}"><div class="desc" id="SUMIP">今日广告入口独立IP数</div></c:if>
				<c:if test="${dataType=='domainNotAd'}"><div class="desc" id="SUMIP">今日非广告入口独立IP数</div></c:if>
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
				<c:if test="${dataType=='domain'}"><div class="desc" id="SUMPV">今日全站访问量</div></c:if>
				<c:if test="${dataType=='domainAd'}"><div class="desc" id="SUMPV">今日广告入口访问量</div></c:if>
				<c:if test="${dataType=='domainNotAd'}"><div class="desc" id="SUMPV">今日非广告入口访问量</div></c:if>
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
            <span class="caption-subject bold font-dark uppercase "> 今日实时统计</span>
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
						<c:if test="${dataType=='domainAd'}"><th scope="col" style="min-width: 150px;" id="firstTh">域名（广告入口）</th></c:if>
						<c:if test="${dataType=='domainNotAd'}"><th scope="col" style="min-width: 150px;" id="firstTh">域名（非广告入口）</th></c:if>
						<th scope="col" style="min-width: 80px">IP</th>			
						<th scope="col" style="min-width: 80px">PV</th>
						<th scope="col" style="min-width: 80px">UV</th>
						<th scope="col" style="min-width: 80px">登录用户数</th>
						<th scope="col" style="min-width: 80px">老IP数</th>
						<th scope="col" style="min-width: 80px">老用户数</th>	
						<th scope="col" style="min-width: 80px">进入目标页</th>
						
						<th scope="col" style="min-width: 80px">停留</th>
						<th scope="col" style="min-width: 80px">点击</th>
						<th scope="col" style="min-width: 80px">滚动</th>
						<th scope="col" style="min-width: 80px">移动</th>
						
						<th scope="col" style="min-width: 80px">5-30秒停留</th>
						<th scope="col" style="min-width: 80px">31-120秒</th>
						<th scope="col" style="min-width: 80px">121-300秒</th>
						<th scope="col" style="min-width: 80px">300+秒停留</th>
						
						<th scope="col" style="min-width: 80px">1-2次点击</th>			
						<th scope="col" style="min-width: 80px">3-5次点击</th>			
						<th scope="col" style="min-width: 80px">6-10次点击</th>			
						<th scope="col" style="min-width: 80px">10+次点击</th>			
						
						
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
	                	<c:forEach var="domain" items="${DomainStat_list}" varStatus="number">
	                <tr>
                		<td style="min-width: 150px;" title="${domain.domain}">
                			<c:if test="${dataType=='domain'}"><a id="dropdown" style="text-decoration:underline;color: #333;"  data-target="#context-menu${domain.id}" data-toggle="dropdown" onclick="openMenu(this)">${domain.subDomain}</a></c:if>
                			<c:if test="${dataType=='domainAd'}">${domain.subDomain}</c:if>
                			<c:if test="${dataType=='domainNotAd'}">${domain.subDomain}</c:if>
                		</td>
						<td style="min-width: 80px">${domain.ip}</td>
						<td style="min-width: 80px">${domain.pv}</td>
						<td style="min-width: 80px">${domain.uv}</td>
						<td style="min-width: 80px">${domain.loginip} (${domain.log}%)</td>
						<td style="min-width: 80px">${domain.oldip} (${domain.oldi}%)</td>
						<td style="min-width: 80px">${domain.olduserip} (${domain.old}%)</td>
						<td style="min-width: 80px">${domain.targetpageip} (${domain.tgp}%)</td> 
						
						<c:set var="sumST" scope="session" value="${domain.staytimeip1+domain.staytimeip2+domain.staytimeip3+domain.staytimeip4}"/>
						<c:set var="sumC" scope="session" value="${domain.clickip1+domain.clickip2+domain.clickip3+domain.clickip4}"/>
						<c:set var="sumS" scope="session" value="${domain.scrollip1+domain.scrollip2+domain.scrollip3+domain.scrollip4}"/>
						<c:set var="sumM" scope="session" value="${domain.moveip1+domain.moveip2+domain.moveip3+domain.moveip4}"/>
						
						<td style="min-width: 80px">${sumST} (<fmt:formatNumber type="number" value="${sumST / domain.ip}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px">${sumC} (<fmt:formatNumber type="number" value="${sumC / domain.ip}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px">${sumS} (<fmt:formatNumber type="number" value="${sumS / domain.ip}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						<td style="min-width: 80px">${sumM} (<fmt:formatNumber type="number" value="${sumM / domain.ip}" pattern="0.00" maxFractionDigits="2"/>%)</td>
						
						<td style="min-width: 80px">${domain.staytimeip1} (${domain.s1}%)</td>
						<td style="min-width: 80px">${domain.staytimeip2} (${domain.s2}%)</td>
						<td style="min-width: 80px">${domain.staytimeip3} (${domain.s3}%)</td>
						<td style="min-width: 80px">${domain.staytimeip4} (${domain.s4}%)</td>
						
						<td style="min-width: 80px">${domain.clickip1} (${domain.c1}%)</td>
						<td style="min-width: 80px">${domain.clickip2} (${domain.c2}%)</td>
						<td style="min-width: 80px">${domain.clickip3} (${domain.c3}%)</td>
						<td style="min-width: 80px">${domain.clickip4} (${domain.c4}%)</td>
						
						
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
	                
	                 <c:forEach var="domain" items="${DomainStat_list}" varStatus="number">
						<div id="context-menu${domain.id}" style="z-index: 999;position:absolute;">
							<ul class="dropdown-menu" role="menu" style="z-index: 99999;"  >
								<li>
							       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId=${domain.id}')">分时统计</a>
							     </li>
							<!--      <li>
							         <a href="javascript:;" onclick="changeDataType('domainAd')">域名统计（广告入口）</a>
							     </li>
							     <li>
							         <a href="javascript:;" onclick="changeDataType('domainNotAd')">域名统计（非广告入口）</a>
							     </li> -->
							    <li>
							         <a href="javascript:;" onclick="changeDataType('domainRegionAd',${domain.id})">地域统计（广告入口）</a>
							     </li>
							     <li>
							         <a href="javascript:;" onclick="changeDataType('domainRegionNotAd',${domain.id})">地域统计（非广告入口）</a>
							     </li>
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
        scrollY:        document.documentElement.clientHeight-275,
        deferRender:    true,
        "ordering": false,
        scroller:       true,
        scrollX:        true,
        "info": false,
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
							SUMIP = "今日全站独立IP数";
							SUMPV = "今日全站访问量";
						}else if(dataType=="domainAd"){
							SUMIP = "今日广告入口独立IP数";
							SUMPV = "今日广告入口访问量";
							firstTh = "域名（广告入口）";
						}else if(dataType=="domainNotAd"){
							SUMIP = "今日非广告入口独立IP数";
							SUMPV = "今日非广告入口访问量";
							firstTh = "域名（非广告入口）";
						}else if(dataType=="domainRegionAd"){
							SUMIP = "地域广告入口独立IP数";
							SUMPV = "地域广告入口访问量";
							firstTh = "地域（广告入口）<a onclick='changeDataType(\"domain\")'><i class='icon-action-undo'></i></a>";
						}else if(dataType=="domainRegionNotAd"){
							SUMIP = "地域非广告入口独立IP数";
							SUMPV = "地域非广告入口访问量";
							firstTh = "地域（非广告入口）<a onclick='changeDataType(\"domain\")'><i class='icon-action-undo'></i></a>";
						}
						if(dataList!=null && dataList.length>0){
							for(var i=0;i<dataList.length;i++){
								var firstTd = "";
								var tr = "";
							    var tr2 = "";
							    var tr3 = "";
							    if(dataType=="domain"){
							    	firstTd="<td style='min-width: 150px;'  title='"+dataList[i].domain+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu"+dataList[i].id+"' data-toggle='dropdown' onclick='openMenu(this)'>"+dataList[i].subDomain+"</a></td>";
							    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
									"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
										"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId="+dataList[i].id+"\")'>分时统计</a></li>"+
										 /* "<li><a href='javascript:;' onclick='changeDataType(\"domainAd\")'>域名统计（广告入口）</a></li>"+
								     	 "<li><a href='javascript:;' onclick='changeDataType(\"domainNotAd\")'>域名统计（非广告入口）</a></li>"+ */
	                                	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionAd,"+dataList[i].id+"\")'>地域统计（广告入口）</a></li>"+
	                                 	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionNotAd,"+dataList[i].id+"\")'>地域统计（非广告入口）</a></li>"+ 
							      	"</ul></div>";
							      	menu+=tr3;
							    }else if(dataType=="domainAd"){
							    	firstTd = "<td style='min-width: 130px;'  title='"+dataList[i].domain+"'>"+dataList[i].subDomain+"</td>";
							    }else if(dataType=="domainNotAd"){
							    	firstTd = "<td style='min-width: 130px;'  title='"+dataList[i].domain+"'>"+dataList[i].subDomain+"</td>";
							    }else if(dataType=="domainRegionAd"){
							    	firstTd = "<td style='min-width: 150px;'  >"+dataList[i].regionName+"</td>";
							    }else if(dataType=="domainRegionNotAd"){
							    	firstTd = "<td style='min-width: 150px;'  >"+dataList[i].regionName+"</td>";
							    }
							    var sumST = dataList[i].staytimeip1+dataList[i].staytimeip2+dataList[i].staytimeip3+dataList[i].staytimeip4;
							    var sumC = dataList[i].clickip1+dataList[i].clickip2+dataList[i].clickip3+dataList[i].clickip4;
							    var sumS = dataList[i].scrollip1+dataList[i].scrollip2+dataList[i].scrollip3+dataList[i].scrollip4;
							    var sumM = dataList[i].moveip1+dataList[i].moveip2+dataList[i].moveip3+dataList[i].moveip4;
							    var IP = dataList[i].ip;
						  		tr+="<tr>" + firstTd+
								  "<td >"+IP+"</td>"+
								  "<td >"+dataList[i].pv+"</td>"+
								  "<td >"+dataList[i].uv+"</td>"+
								  "<td >"+dataList[i].loginip+" ("+dataList[i].log+"%)</td>"+
								  "<td >"+dataList[i].oldip+" ("+dataList[i].oldi+"%)</td>"+
								  "<td >"+dataList[i].olduserip+" ("+dataList[i].old+"%)</td>"+
								  "<td >"+dataList[i].targetpageip+" ("+dataList[i].tgp+"%)</td>"+
								  
								  "<td >"+sumST+" ("+Percentage(sumST,IP)+")</td>"+
								  "<td >"+sumC+" ("+Percentage(sumC,IP)+")</td>"+
								  "<td >"+sumS+" ("+Percentage(sumS,IP)+")</td>"+
								  "<td >"+sumM+" ("+Percentage(sumM,IP)+")</td>"+
								  
								  "<td >"+dataList[i].staytimeip1+" ("+dataList[i].s1+"%)</td>"+
								  "<td >"+dataList[i].staytimeip2+" ("+dataList[i].s2+"%)</td>"+
								  "<td >"+dataList[i].staytimeip3+" ("+dataList[i].s3+"%)</td>"+
								  "<td >"+dataList[i].staytimeip4+" ("+dataList[i].s4+"%)</td>"+
								  
								  "<td >"+dataList[i].clickip1+" ("+dataList[i].c1+"%)</td>"+
								  "<td >"+dataList[i].clickip2+" ("+dataList[i].c2+"%)</td>"+
								  "<td >"+dataList[i].clickip3+" ("+dataList[i].c3+"%)</td>"+
								  "<td >"+dataList[i].clickip4+" ("+dataList[i].c4+"%)</td>"+
								  
								  
								  "<td >"+dataList[i].scrollip1+" ("+dataList[i].sc1+"%)</td>"+
								  "<td >"+dataList[i].scrollip2+" ("+dataList[i].sc2+"%)</td>"+
								  "<td >"+dataList[i].scrollip3+" ("+dataList[i].sc3+"%)</td>"+
								  "<td >"+dataList[i].scrollip4+" ("+dataList[i].sc4+"%)</td>"+
								  "<td >"+dataList[i].moveip1+" ("+dataList[i].m1+"%)</td>"+
								  "<td >"+dataList[i].moveip2+" ("+dataList[i].m2+"%)</td>"+
								  "<td >"+dataList[i].moveip3+" ("+dataList[i].m3+"%)</td>"+
								  "<td >"+dataList[i].moveip4+" ("+dataList[i].m4+"%)</td>"+
								  "</tr>";
								  table+=tr;
							  
								tr2+="<tr>"+firstTd+
								  "<td style='min-width: 80px'>"+IP+"</td>"+
								  "<td style='min-width: 80px'>"+dataList[i].pv+"</td>"+
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
					
				},
				error: function (data) {
					clearTimeout(t);
					ajaxTime=ajaxTime*2;
					t = window.setTimeout("ajaxRefreshPage('"+dataType+"','"+domainId+"')",ajaxTime); 
				}
			});
	 }
	 
</script>

<!-- END PAGE SCRIPTS -->
