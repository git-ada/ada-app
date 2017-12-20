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
.stdisplaynone{
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
thead th {
    padding-left: 10px!important;
}
.portlet-title {
    padding-left:  0px !important;
    border-bottom: none !important;
}
 tbody td {
    padding: 0px 0px !important;
    text-align: left;
    line-height: 35.2px;
}

.myprogress {
    border-radius: 4px;
    height: 35.2px;
    margin-bottom: 0px !important;
}
.only {
    border: 0 none;
    height: 1px;
    margin: -1px;
    padding: 0;
    position: absolute;
    line-height: 35.2px;
    padding-left:8px;
    width: 1px;
}
.tdonly{
	padding-left:8px;
	display: block;
	height: 35.2px;
	line-height: 35.2px;
}

table.dataTable{
    clear: both;
    margin:0px !important;
    border-collapse: separate;
    border-spacing: 0;
}
.ifsearch{
	display: none;
}
.nav-pills, .nav-tabs {
    margin-bottom: 0px !important;
}
.portlet.light > .portlet-title > .inputs {
    display: inline-block;
    float: right;
    padding-top: 12px !important;
}
.btn.btn-outline.dark {
    background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
    border-color: #c2cad8;
    color: #333;
}
.btn-group-sm > .btn, .btn-sm {
    border-radius: 3px;
    font-size: 12px;
    line-height: 1.9 !important;
    padding: 5px 10px;
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
					<span data-counter="counterup" data-value="${siteStat.ip}" id="ip">${siteStat.ip}</span>(个)
				</div>
				<div class="desc" id="SUMIP">全站独立IP数</div>
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
					<span data-counter="counterup" data-value="${siteStat.pv}" id="pv">${siteStat.pv}</span>(页)
				</div>
					<div class="desc" id="SUMPV">全站访问量</div>
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
					<span data-counter="counterup" data-value="${siteStat.adIP}" id="adIP">${siteStat.adIP}</span>(个)
				</div>
				<div class="desc">广告入口独立IP数</div>
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
					<span data-counter="counterup" data-value="${siteStat.adPv}" id="adPv">${siteStat.adPv}</span>(页)
				</div>
				<div class="desc">广告入口访问量</div>
			</div>
		</div>
	</div>
</div>

<div class="portlet light portlet-fit bordered">
	<div class="portlet-title" style="padding-bottom: 0;margin-bottom: 0;padding-top: 0px;padding-right: 5px;">
		<div class="caption" style="padding-bottom: 0px;">
		
            <div class="btn-group btn-group-devided" data-toggle="buttons">
            	<div class="tabbable-line">
	            	<ul class="nav nav-tabs ">
		                <li <c:if test="${dataType=='domain'}">class="active"</c:if>>
		                    <a href="#tab_15_1" data-toggle="tab" aria-expanded="true" onclick="changeDataType('all')">全站统计</a>
		                </li>
		                <li <c:if test="${dataType=='domainAd'}">class="active"</c:if>>
		                    <a href="#tab_15_2" data-toggle="tab" aria-expanded="false" onclick="changeDataType('Ad')">广告入口统计</a>
		                </li>
		                <li <c:if test="${dataType=='domainNotAd'}">class="active"</c:if>>
		                    <a href="#tab_15_3" data-toggle="tab" aria-expanded="false" onclick="changeDataType('NotAd')">非广告入口统计</a>
		                </li>
	           		 </ul>
	            </div>
           </div>
           <span class="caption-helper" id="lasttime">最后一次更新时间 ${lasttime}</span>
           
        </div>
        <div class="inputs">
            <div class="actions" style="float: left;" >
            	<div id="ifsearch" style="float: left;">
	            	<div class="portlet-input input-inline " >
	                    <div class="input-icon right">
	                        <i class="icon-magnifier"></i>
	                        <input id="search" type="text" class="form-control input-circle" name="firstTd" style="font-size: 12px;" placeholder="搜索域名..."> </div>
	                </div>
	                <div class="btn-group">
	                    <a href="" class="btn dark btn-outline btn-circle btn-sm dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 
	                    	<span id="top" > TOP 50 &nbsp;</span> 
	                        <span class="fa fa-angle-down"> </span>
	                    </a>
	                    <ul class="dropdown-menu pull-right" id="topul">
	                        <li class="active" onclick="changeTop(this,50)">
	                            <a ><span style="color: #333;"> TOP 50 &nbsp;</span></a>
	                        </li>
	                        <li onclick="changeTop(this,100)">
	                            <a ><span style="color: #333;"> TOP 100 </span></a>
	                        </li>
	                        <li  onclick="changeTop(this,200)">
	                            <a ><span style="color: #333;"> TOP 200 </span></a>
	                        </li>
	                        <li onclick="changeTop(this,500)">
	                            <a ><span style="color: #333;"> TOP 500 </span></a>
	                        </li>
	                    </ul>
	                </div>
                </div>&nbsp;
				<a class="btn btn-circle btn-icon-only btn-default pause" id="pauseOrplay"><i class="icon-control-pause" ></i></a>
				<a class="btn btn-circle btn-icon-only btn-default fullscreen"  id="fullscreenOractual"><i class="icon-size-fullscreen"></i></a>
			</div>
        </div>
	</div>
	
	<!-- 渠道和域名数据列表                           ---------------------------------------------------------------- -->
	<div class="portlet-body" style="margin: 0px;padding: 0;">
		<table id="scrolltable" class="table table-striped table-bordered table-hover order-column" style="border: 0;">
	            <thead>
	                <tr>
	                	<c:if test="${dataType=='domain'}"><th scope="col" style="min-width: 140px;" id="firstTh">域名</th></c:if>
						<c:if test="${dataType=='domainAd'}"><th scope="col" style="min-width: 140px;" id="firstTh">域名</th></c:if>
						<c:if test="${dataType=='domainNotAd'}"><th scope="col" style="min-width: 140px;" id="firstTh">域名</th></c:if>
						<th scope="col" style="min-width: 70px">IP</th>			
						<th scope="col" style="min-width: 70px">PV</th>
						<th scope="col" style="min-width: 70px">UV</th>
						<th scope="col" style="min-width: 70px">老用户</th>
						<th scope="col" style="min-width: 70px">老IP</th>	
						<th scope="col" style="min-width: 70px">登录用户</th>
						<th scope="col" style="min-width: 70px">目标页</th>
						
						<th scope="col" style="min-width: 70px">停留 <a style="color: #333;" onclick="changeDisplay(this,'st')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="st">5-30秒</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="st">31-120秒</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="st">121-300秒</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="st">300+秒</th>
						
						<th scope="col" style="min-width: 70px">点击<a style="color: #333;" onclick="changeDisplay(this,'c')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="c">1-2次</th>			
						<th scope="col" style="min-width: 70px" class="displaynone" event="c">3-5次</th>			
						<th scope="col" style="min-width: 70px" class="displaynone" event="c">6-10次</th>			
						<th scope="col" style="min-width: 70px" class="displaynone" event="c">10+次</th>
						
						<th scope="col" style="min-width: 70px">滚动<a style="color: #333;" onclick="changeDisplay(this,'s')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="s">1-2次</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="s">3-5次</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="s">6-10次</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="s">10+次</th>
						
						<th scope="col" style="min-width: 70px">移动<a style="color: #333;" onclick="changeDisplay(this,'m')" title=""> <i class="icon-magnifier-add"></i> </a></th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="m">1-2次</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="m">3-5次</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="m">6-10次</th>
						<th scope="col" style="min-width: 70px" class="displaynone" event="m">10+次</th>
				     </tr>
	            </thead>
	            <tbody id="tbody">
	            	
	            </tbody>
	            
	            
	        </table>
	</div>
</div>

<div id="menu">
         <%-- <c:forEach var="item" items="${tbodydata.data_list}" varStatus="number"> --%>
		<div id="context-menu" style="z-index: 999;position:absolute;">
			<ul class="dropdown-menu" role="menu" style="z-index: 99999;"  >
				 <%-- <li>
			       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainTime3.jhtm?domainId=${item[23]}&domain=${item[24]}')">分时统计3</a>
			     </li> --%>
			     <li>
			       <a href="javascript:;" id="onlyOne"><i class="icon-magnifier"></i>单独查看</a>
			     </li>
			     <li>
			       <a href="javascript:;" id="oneTime">分时统计</a>
			     </li>
			     	<li>
			       <a href="javascript:;" id="AdVSNotAd">广告与非广告对比</a>
			     </li>
			     <li>
			         <a href="javascript:;" id="region">地域统计</a>
			     </li>
			 </ul>
		</div>
	<%-- </c:forEach> --%>
</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var dataType = '${dataType}';//页面数据类型
var domainId = "";//域名ID
var search = "";//搜索
var stClick = false;
var cClick = false;
var sClick = false;
var mClick = false;
var ipTop = 50;// 总ip TOP
 

var t;
var isRefresh = true;
var oTable;
var oTable2;
var table;
//渲染table
var initTable1 = function () {
     table = $('#scrolltable');
     oTable = table.dataTable({
   
  
        paging: false,
        scrollY:        document.documentElement.clientHeight-295,
        "ordering": false,
        scrollX:        true,
        "info": false,
        stateSave:      true,
        "searching": false,
        fixedColumns:   {
            leftColumns: 2
        }
   
 
    });
}
/**--------------预加载-------------------- **/
	jQuery(document).ready(function() {
		var tbodydata = '${tbodydata}';
		var json = eval('(' + tbodydata + ')');
		loadTbody(json,1);
		
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
	    		 
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-100);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-60);
	    		 
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-118);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-118);
	    		 
	    		 //jQuery(".dataTables_scrollHeadInner").css("width","4000px");
	    		 //jQuery(".dataTables_scrollHeadInner table").css("width","100%");
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-fullscreen");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-actual");
	    		 
	    		   
	    	 }else if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-actual"){
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-295);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-240);
	    		
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-295);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-295);
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-actual");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-fullscreen");
	    		 
	    	 }
	     });  
	    //给搜索框添加 键盘按键的离开事件
	    jQuery("#search").keyup(function (){
	    	clearTimeout(t);
	    	App.startPageLoading({animate: !0});//开启 加载 动画
	    	search = jQuery(this).val();
	    	ajaxRefreshPage();
	    });
	});

	 
	 var ajaxTime = 2000;
	 //第一次异步刷新
	 t = window.setTimeout("ajaxRefreshPage('"+dataType+"')",ajaxTime); 
	  
	 function ajaxRefreshPage(){
		 jQuery.ajax({
			 	type:"post",
				url : "${pageContext.request.contextPath}/ajaxRefreshPage.do?dataType="+dataType+"&domainId="+domainId+"&firstTd="+search+"&top="+ipTop,
				success : function(data) {
					
					if (data!=null) {
						var json = eval('(' + data + ')');
						loadTbody(json,2);
					
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
	 /** js渲染tbody **/
	 function loadTbody(json,num){
		// domainId = json.domainId;//域名ID
			var table = "";
			var lefttable = "";
			var firstTh = "域名";
			/** 数据列表 **/
			var dataList = json.data_list;
			 
			if(dataType=="domainRegion"){
				firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domain\")'><i class='icon-action-undo'></i></a>";
			}else if(dataType=="domainRegionAd"){
				firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domainAd\")'><i class='icon-action-undo'></i></a>";
			}else if(dataType=="domainRegionNotAd"){
				firstTh = "地域  <a style='color: #333;' onclick='changeDataType(\"domainNotAd\")'><i class='icon-action-undo'></i></a>";
			}
			 var stDisplay = "";
		     var cDisplay = "";
		     var sDisplay = "";
		     var mtDisplay = "";
			    
		    if(num==1){
    	 	 stDisplay = "displaynone";
		     cDisplay = "displaynone";
		     sDisplay = "displaynone";
		     mtDisplay = "displaynone";
		    }else if(num==2){
		    	if(!stClick) stDisplay = "displaynone";
		    	if(!cClick) cDisplay = "displaynone";
		    	if(!sClick) sDisplay = "displaynone";
		    	if(!mClick) mtDisplay = "displaynone";
		    }
			if(dataList!=null && dataList.length>0){
				/* console.log("数据条数------>"+dataList.length); */
				var sumip = 1;
			    var sumpv = 1;
			    var sumuv = 1;
			    if(dataType=="domain"){
			    	sumip = json.siteStat.ip>0 ? json.siteStat.ip : 1;
			    	sumpv = json.siteStat.pv>0 ? json.siteStat.pv : 1;
			    	sumuv = json.siteStat.uv>0 ? json.siteStat.uv : 1;
			    }else if(dataType=="domainAd"){
			    	sumip = json.siteStat.adIP>0 ? json.siteStat.adIP : 1;
			    	sumpv = json.siteStat.adPv>0 ? json.siteStat.adPv : 1;
			    	sumuv = json.siteStat.aduv>0 ? json.siteStat.aduv : 1;
			    }else if(dataType=="domainNotAd"){
			    	sumip = json.siteStat.ip-json.siteStat.adIP>0 ? json.siteStat.ip-json.siteStat.adIP : 1;
			    	sumpv = json.siteStat.pv-json.siteStat.adPv>0 ? json.siteStat.pv-json.siteStat.adPv : 1;
			    	sumuv = json.siteStat.uv-json.siteStat.aduv>0 ? json.siteStat.uv-json.siteStat.aduv : 1;
			    }else if(dataType=="domainRegion"){
			    	sumip = json.domainStat.ip>0? json.domainStat.ip : 1;
			    	sumpv = json.domainStat.pv>0? json.domainStat.pv : 1;
			    	sumuv = json.domainStat.uv>0? json.domainStat.uv : 1;
			    }else if(dataType=="domainRegionAd"){
			    	sumip = json.domainAdStat.ip>0? json.domainAdStat.ip : 1;
			    	sumpv = json.domainAdStat.pv>0? json.domainAdSata.pv : 1;
			    	sumuv = json.domainAdStat.uv>0? json.domainAdStat.uv : 1;
			    }else if(dataType=="domainRegionNotAd"){
			    	sumip = json.domainNotAdStat.ip>0? json.domainNotAdStat.ip : 1;
			    	sumpv = json.domainNotAdStat.pv>0? json.domainNotAdStat.pv : 1;
			    	sumuv = json.domainNotAdStat.uv>0? json.domainNotAdStat.uv : 1;
			    }
			    
			    console.log("sumip----------->",sumip);
			    console.log("sumpv----------->",sumpv);
			    console.log("sumuv----------->",sumuv);
			    
				for(var i=0;i<dataList.length;i++){
					var item = dataList[i];
					var firstTd = "";
					var tr = "";
				    var tr2 = "";
				    if(dataType=="domain"){
				    	firstTd ="<td title='"+item[24]+"'><span class='tdonly'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></span></td>";
				    }else if(dataType=="domainAd"){
				    	firstTd ="<td title='"+item[24]+"'><span class='tdonly'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></span></td>";
				    }else if(dataType=="domainNotAd"){
				    	firstTd ="<td title='"+item[24]+"'><span class='tdonly'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></span></td>";
				    }else if(dataType=="domainRegion"){
				    	firstTd ="<td><span class='tdonly'>"+item[23]+"</span></td>";
				    }else if(dataType=="domainRegionAd"){
				    	firstTd ="<td><span class='tdonly'>"+item[23]+"</span></td>";
				    }else if(dataType=="domainRegionNotAd"){
				    	firstTd ="<td><span class='tdonly'>"+item[23]+"</span></td>";
				    }
				    
				    var sumST = item[7]+item[8]+item[9]+item[10];
				    var sumC = item[11]+item[12]+item[13]+item[14];
				    var sumS = item[15]+item[16]+item[17]+item[18];
				    var sumM = item[19]+item[20]+item[21]+item[22];
				    var IP = item[0];
				    if(IP<=0)IP = 1;
				    var ipTd = "";//ip
				    var pvTd = "";//pv
				    var uvTd = "";//uv
				    var olduserTd = "";//老用户
				    var oldipTd = "";//老ip
				    var loginTd = "";//登录用户
				    var targetTd = "";//目标页
				    var sumSTTd = "";//总停留
				    var st1Td = "";//停留第一区间
				    var st2Td = "";//停留第二区间
				    var st3Td = "";//停留第三区间
				    var st4Td = "";//停留第四区间
				    var sumCTd = "";//总点击
				    var c1Td = "";//1区间
				    var c2Td = "";//2区间
				    var c3Td = "";//3区间
				    var c4Td = "";//4区间
				    var sumSTd = "";//总滚动
				    var s1Td = "";//1区间
				    var s2Td = "";//2区间
				    var s3Td = "";//3区间
				    var s4Td = "";//4区间
				    var sumMTd = "";//总移动
				    var m1Td = "";//1区间
				    var m2Td = "";//2区间
				    var m3Td = "";//3区间
				    var m4Td = "";//4区间
				    if(Percentagemin(item[0],sumip)<1){
				    	ipTd = "<td title='"+Percentage(item[0],sumip)+"'><span class='tdonly'>"+item[0]+"</span></td>";
				    }else{
				    	ipTd = "<td title='"+Percentage(item[0],sumip)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[0],sumip)+" '>"+
					  	"<span class='only'> "+item[0]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[1],sumpv)<1){
				    	pvTd = "<td title='"+Percentage(item[1],sumpv)+"'><span class='tdonly'>"+item[1]+"</span></td>";
				    }else{
				    	pvTd = "<td title='"+Percentage(item[1],sumpv)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[1],sumpv)+" '>"+
					  	"<span class='only'> "+item[1]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[2],sumuv)<1){
				    	uvTd = "<td title='"+Percentage(item[2],sumuv)+"'><span class='tdonly'>"+item[2]+"</span></td>";
				    }else{
				    	uvTd = "<td title='"+Percentage(item[2],sumuv)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[2],sumuv)+" '>"+
					  	"<span class='only'> "+item[2]+" </span></div></div></td>";
				    }
				    
				    if(Percentagemin(item[3],IP)<1){
				    	olduserTd = "<td title='"+Percentage(item[3],IP)+"'><span class='tdonly'>"+item[3]+"</span></td>";
				    }else{
				    	olduserTd = "<td title='"+Percentage(item[3],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[3],IP)+" '>"+
					  	"<span class='only'> "+item[3]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[4],IP)<1){
				    	oldipTd = "<td title='"+Percentage(item[4],IP)+"'><span class='tdonly'>"+item[4]+"</span></td>";
				    }else{
				    	oldipTd = "<td title='"+Percentage(item[4],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[4],IP)+" '>"+
					  	"<span class='only'> "+item[4]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[5],IP)<1){
				    	loginTd = "<td title='"+Percentage(item[5],IP)+"'><span class='tdonly'>"+item[5]+"</span></td>";
				    }else{
				    	loginTd = "<td title='"+Percentage(item[5],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[5],IP)+" '>"+
					  	"<span class='only'> "+item[5]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[6],IP)<1){
				    	targetTd = "<td title='"+Percentage(item[6],IP)+"'><span class='tdonly'>"+item[6]+"</span></td>";
				    }else{
				    	targetTd = "<td title='"+Percentage(item[6],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[6],IP)+" '>"+
					  	"<span class='only'> "+item[6]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumST,IP)<1){
				    	sumSTTd = "<td  title='"+Percentage(sumST,IP)+"'><span class='tdonly'>"+sumST+"</span></td>";
				    }else{
				    	sumSTTd = "<td title='"+Percentage(sumST,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumST,IP)+" '>"+
					  	"<span class='only'> "+sumST+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[7],IP)<1){
				    	st1Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[7],IP)+"'><span class='tdonly'>"+item[7]+"</span></td>";
				    }else{
				    	st1Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[7],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[7],IP)+" '>"+
					  	"<span class='only'> "+item[7]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[8],IP)<1){
				    	st2Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[8],IP)+"'><span class='tdonly'>"+item[8]+"</span></td>";
				    }else{
				    	st2Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[8],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[8],IP)+" '>"+
					  	"<span class='only'> "+item[8]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[9],IP)<1){
				    	st3Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[9],IP)+"'><span class='tdonly'>"+item[9]+"</span></td>";
				    }else{
				    	st3Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[9],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[9],IP)+" '>"+
					  	"<span class='only'> "+item[9]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[10],IP)<1){
				    	st4Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[10],IP)+"'><span class='tdonly'>"+item[10]+"</span></td>";
				    }else{
				    	st4Td = "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[10],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[10],IP)+" '>"+
					  	"<span class='only'> "+item[10]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumC,IP)<1){
				    	sumCTd = "<td class='onlytd' title='"+Percentage(sumC,IP)+"'><span class='tdonly'>"+sumC+"</span></td>";
				    }else{
				    	sumCTd = "<td title='"+Percentage(sumC,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumC,IP)+" '>"+
					  	"<span class='only'> "+sumC+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[11],IP)<1){
				    	c1Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[11],IP)+"'><span class='tdonly'>"+item[11]+"</span></td>";
				    }else{
				    	c1Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[11],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[11],IP)+" '>"+
					  	"<span class='only'> "+item[11]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[12],IP)<1){
				    	c2Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[12],IP)+"'><span class='tdonly'>"+item[12]+"</span></td>";
				    }else{
				    	c2Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[12],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[12],IP)+" '>"+
					  	"<span class='only'> "+item[12]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[13],IP)<1){
				    	c3Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[13],IP)+"'><span class='tdonly'>"+item[13]+"</span></td>";
				    }else{
				    	c3Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[13],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[13],IP)+" '>"+
					  	"<span class='only'> "+item[13]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[14],IP)<1){
				    	c4Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[14],IP)+"'><span class='tdonly'>"+item[14]+"</span></td>";
				    }else{
				    	c4Td = "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[14],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[14],IP)+" '>"+
					  	"<span class='only'> "+item[14]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumS,IP)<1){
				    	sumSTd = "<td class='onlytd' title='"+Percentage(sumS,IP)+"'><span class='tdonly'>"+sumS+"</span></td>";
				    }else{
				    	sumSTd = "<td title='"+Percentage(sumS,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumS,IP)+" '>"+
					  	"<span class='only'> "+sumS+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[15],IP)<1){
				    	s1Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[15],IP)+"'><span class='tdonly'>"+item[15]+"</span></td>";
				    }else{
				    	s1Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[15],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[15],IP)+" '>"+
					  	"<span class='only'> "+item[15]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[16],IP)<1){
				    	s2Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[16],IP)+"'><span class='tdonly'>"+item[16]+"</span></td>";
				    }else{
				    	s2Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[16],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[16],IP)+" '>"+
					  	"<span class='only'> "+item[16]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[17],IP)<1){
				    	s3Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[17],IP)+"'><span class='tdonly'>"+item[17]+"</span></td>";
				    }else{
				    	s3Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[17],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[17],IP)+" '>"+
					  	"<span class='only'> "+item[17]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[18],IP)<1){
				    	s4Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[18],IP)+"'><span class='tdonly'>"+item[18]+"</span></td>";
				    }else{
				    	s4Td = "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[18],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[18],IP)+" '>"+
					  	"<span class='only'> "+item[18]+" </span></div></div></td>";
				    }
				    if(Percentagemin(sumM,IP)<1){
				    	sumMTd = "<td class='onlytd' title='"+Percentage(sumM,IP)+"'><span class='tdonly'>"+sumM+"</span></td>";
				    }else{
				    	sumMTd = "<td title='"+Percentage(sumM,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumM,IP)+" '>"+
					  	"<span class='only'> "+sumM+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[19],IP)<1){
				    	m1Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[19],IP)+"'><span class='tdonly'>"+item[19]+"</span></td>";
				    }else{
				    	m1Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[19],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[19],IP)+" '>"+
					  	"<span class='only'> "+item[19]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[20],IP)<1){
				    	m2Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[20],IP)+"'><span class='tdonly'>"+item[20]+"</span></td>";
				    }else{
				    	m2Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[20],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[20],IP)+" '>"+
					  	"<span class='only'> "+item[20]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[21],IP)<1){
				    	m3Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[21],IP)+"'><span class='tdonly'>"+item[21]+"</span></td>";
				    }else{
				    	m3Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[21],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[21],IP)+" '>"+
					  	"<span class='only'> "+item[21]+" </span></div></div></td>";
				    }
				    if(Percentagemin(item[22],IP)<1){
				    	m4Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[22],IP)+"'><span class='tdonly'>"+item[22]+"</span></td>";
				    }else{
				    	m4Td = "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[22],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[22],IP)+" '>"+
					  	"<span class='only'> "+item[22]+" </span></div></div></td>";
				    }
				    
			  		tr+="<tr num='"+i+"'>" + firstTd+
			  		  ipTd+pvTd+uvTd+ 
					  olduserTd+oldipTd+loginTd+targetTd+
					  sumSTTd+st1Td+st2Td+st3Td+st4Td+
					  sumCTd+c1Td+c2Td+c3Td+c4Td+
					  sumSTd+s1Td+s2Td+s3Td+s4Td+
					  sumMTd+m1Td+m2Td+m3Td+m4Td+
					  "</tr>";
					  table+=tr;
				  if(num==2){
					  tr2+="<tr>"+firstTd+
					  ipTd+
						"</tr>";
					lefttable+=tr2;
				  }
				}
			}
			
			if(browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0 && dataType==json.dataType && isRefresh){
				if(num==1){
					jQuery("#tbody").empty();
					jQuery("#tbody").append(table);
				}else if(num==2){
					jQuery("#ip").html(json.siteStat.ip);
					jQuery("#pv").html(json.siteStat.pv);
					jQuery("#adIP").html(json.siteStat.adIP);
					jQuery("#adPv").html(json.siteStat.adPv);
					jQuery(".DTFC_LeftHeadWrapper #firstTh").html(firstTh);
					jQuery("#tbody").empty();
					jQuery("#tbody").append(table);
					jQuery(".DTFC_LeftBodyWrapper #tbody").empty();
					jQuery(".DTFC_LeftBodyWrapper #tbody").append(lefttable);
					jQuery("#lasttime").html("最后一次更新时间  "+json.lasttime);
				}
				
				
			}
	 }
	 
//单独查看
function onlyOne(name){
	clearTimeout(t);
	App.startPageLoading({animate: !0});//开启 加载 动画
	search = name;
	jQuery("#search").val(name);
	ajaxRefreshPage();
	
}
/** ------改变页面数据类型-------------**/
function changeDataType(type,domain_Id){
	clearTimeout(t);
	App.startPageLoading({animate: !0});//开启 加载 动画
	if(type=="all"){
		if(dataType.indexOf("domainRegion")>=0){
			dataType = "domainRegion";
			jQuery("#ifsearch").hide();
		}else{
			dataType = "domain";
			jQuery("#ifsearch").show();
		}
	}else if(type=="Ad"){
		if(dataType.indexOf("domainRegion")>=0){
			dataType = "domainRegionAd";
			jQuery("#ifsearch").hide();
		}else{
			dataType = "domainAd";
			jQuery("#ifsearch").show();
		}
	}else if(type=="NotAd"){
		if(dataType.indexOf("domainRegion")>=0){
			dataType = "domainRegionNotAd";
			jQuery("#ifsearch").hide();
		}else{
			dataType = "domainNotAd";
			jQuery("#ifsearch").show();
		}
	}else{
		if(type.indexOf("domainRegion")>=0){
			domainId = domain_Id;
			jQuery("#ifsearch").hide();
		}else if(type.indexOf("domain")>=0){
			jQuery("#ifsearch").show();
		}
		
		dataType = type;
	}
	
	
	ajaxRefreshPage();
	
}
/** --------------分页查询 -------------**/
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
//打开菜单
function openMenu(a,event){
	
	var id = jQuery(a).attr("id");
	var domain = jQuery(a).attr("domain");
	 jQuery("#onlyOne").attr("onclick","onlyOne('"+domain+"')");
	jQuery("#oneTime").attr("onclick","gotoPage('${pageContext.request.contextPath}/domainTimechartList_one.jhtm?domainId="+id+"&dataType="+dataType+"&domain="+domain+"')");
	jQuery("#AdVSNotAd").attr("onclick","gotoPage('${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId="+id+"&domain="+domain+"&dataType="+dataType+"')");
	if(dataType=="domain"){
		jQuery("#region").attr("onclick","changeDataType('domainRegion',"+id+")");
	}else if(dataType=="domainAd"){
		jQuery("#region").attr("onclick","changeDataType('domainRegionAd',"+id+")");
	}else if(dataType=="domainNotAd"){
		jQuery("#region").attr("onclick","changeDataType('domainRegionNotAd',"+id+")");
	} 
	
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
function Percentagemin(num, total){
	return Math.round(num / total * 10000) / 100.00;
}
//百分比
function Percentage(num, total) { 
   return (Math.round(num / total * 10000) / 100.00 + "%");// 小数点后两位百分比
}
//百分比 （超过100 按100算）
function PercentageMax(num, total){
	var p = Math.round(num / total * 10000) / 100.00 >100 ? 100 : Math.round(num / total * 10000) / 100.00;
	return (p+"%");
}
/**------  改变top值  ------**/
function changeTop(a,num){
	jQuery("#topul li").removeClass("active");
	jQuery(a).addClass("active");
	clearTimeout(t);
	App.startPageLoading({animate: !0});//开启 加载 动画
	if(num==50){
		jQuery("#top").html(" TOP "+num +"&nbsp;&nbsp;");
	}else{
		jQuery("#top").html(" TOP "+num);
	}
	
	ipTop = num;
	ajaxRefreshPage();
}
/** 修改td样式 **/
function changeDisplay(a,data){
	 var i = jQuery(a).find("i");
	  if(jQuery(i).attr("class")=="icon-magnifier-add"){
		  if(data == "st"){
			  stClick = true;
		  }else if(data == "c"){
			  cClick = true;
		  }else if(data == "s"){
			  sClick = true;
		  }else if(data == "m"){
			  mClick = true;
		  }
		  jQuery(i).removeClass("icon-magnifier-add");
		  jQuery(i).addClass("icon-magnifier-remove");
	
    	   jQuery("[event='"+data+"']").each(function (){
			  jQuery(this).toggleClass("displaynone");
		  });  

		  jQuery(".dataTables_scrollHeadInner").css("width","4000px");
		  
		  var left =  jQuery(".dataTables_scrollBody").scrollLeft();
		  jQuery(".dataTables_scrollBody").scrollLeft(left+500);
	  }else if(jQuery(i).attr("class")=="icon-magnifier-remove"){
		  if(data == "st"){
			  stClick = false;
		  }else if(data == "c"){
			  cClick = false;
		  }else if(data == "s"){
			  sClick = false;
		  }else if(data == "m"){
			  mClick = false;
		  }
		  jQuery(i).removeClass("icon-magnifier-remove");
		  jQuery(i).addClass("icon-magnifier-add");
		  
		  //jQuery("[event="+data+"]").toggleClass("displaynone");
		   jQuery("[event='"+data+"']").each(function (){
				  jQuery(this).toggleClass("displaynone");
			  });  
	  }
	 
}
</script>

<!-- END PAGE SCRIPTS -->
