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
				<div class="desc">广告入口独立IP数<span id="adIpFormat"></span></div>
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
				<div class="desc">广告入口访问量<span id="adPvFormat"></span></div>
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
	            	<div class="portlet-input input-inline " >
	                    <div class="input-icon right">
	                        <i id="searchImg" class="icon-magnifier" style="cursor: auto;"></i>
	                        <input id="search" type="text" value="${search}"  class="form-control input-circle" name="firstTd" style="font-size: 12px;" placeholder="搜索域名..."> </div>
	                </div>
	                <div class="btn-group">
	                    <a href="" class="btn dark btn-outline btn-circle btn-sm dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true"> 
	                    	<span id="top" > TOP ${ipTop} &nbsp;</span> 
	                        <span class="fa fa-angle-down"> </span>
	                    </a>
	                    <ul class="dropdown-menu pull-right" id="topul">
	                        <li onclick="changeTop(this,50)" <c:if test="${ipTop==50}">class="active"</c:if>>
	                            <a ><span style="color: #333;"> TOP 50 &nbsp;</span></a>
	                        </li>
	                        <li onclick="changeTop(this,100)" <c:if test="${ipTop==100}">class="active"</c:if>>
	                            <a ><span style="color: #333;"> TOP 100 </span></a>
	                        </li>
	                        <li  onclick="changeTop(this,200)" <c:if test="${ipTop==200}">class="active"</c:if>>
	                            <a ><span style="color: #333;"> TOP 200 </span></a>
	                        </li>
	                        <li onclick="changeTop(this,500)" <c:if test="${ipTop==500}">class="active"</c:if>>
	                            <a ><span style="color: #333;"> TOP 500 </span></a>
	                        </li>
	                    </ul>
	                </div>
                &nbsp;
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
						
						<!--  
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
						-->
				     </tr>
	            </thead>
	            <tbody id="tbody">
	            	
	            </tbody>
	            
	            
	        </table>
	</div>
</div>

<div id="menu">
         <%-- <c:forEach var="item" items="${tbodydata.data_list}" varStatus="number"> --%>
		<div id="context-menu" style="z-index: 99999;position:absolute;">
			<ul class="dropdown-menu" role="menu" style="z-index: 99999;"  >
				 <%-- <li>
			       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainTime3.jhtm?domainId=${item[23]}&domain=${item[24]}')">分时统计3</a>
			     </li> --%>
			     <li>
			       <a href="javascript:;" id="onlyOne"><i class="icon-magnifier"></i>&nbsp;&nbsp;单独查看</a>
			     </li>
			    <!--  <li>
			       <a href="javascript:;" id="dynamic">实时动态</a>
			     </li> -->
			     
			     <!-- <li>
			       <a href="javascript:;" id="solo">单指标实时动态</a>
			     </li> -->
			     
			     <li>
			       <a href="javascript:;" id="oneTime"><i class="icon-speedometer"></i>&nbsp;&nbsp;分时统计</a>
			     </li>
			     	<li>
			       <a href="javascript:;" id="AdVSNotAd"><i class="icon-book-open"></i>&nbsp;&nbsp;广告与非广告对比</a>
			     </li>
			     <li>
			         <a href="javascript:;" id="region"><i class="icon-pointer"></i>&nbsp;&nbsp;地域统计</a>
			     </li>
			 </ul>
		</div>
	<%-- </c:forEach> --%>
</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript">
var dataType = '${dataType}';//页面数据类型
var search = '${search}';//搜索
var ipTop = '${ipTop}';// 总ip TOP
var isRefresh = '${isRefresh}';
var isRetrun = '${isRetrun}';
var tbodydata = '${tbodydata}';
var webPath = '${pageContext.request.contextPath}';
var jstimestamp = Date.parse(new Date());
</script>
<script  type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/assets/js/dashboardOnline_hgr.js?jstimestamp=<%=new Date()%>"></script>
<!-- END PAGE SCRIPTS -->
