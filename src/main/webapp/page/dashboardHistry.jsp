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
    padding-left:  10px !important;
    border-bottom: none !important;
}
.dataTables_scrollBody tbody td {
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
}

table.dataTable{
    clear: both;
    margin:0px !important;
    border-collapse: separate;
    border-spacing: 0;
}

<!--  -->
.portlet.light .portlet-body {
    padding-top: 5px;
}
.portlet.bordered>.portlet-title{
	padding-right:0px;
	padding-bottom:0px;
	margin-bottom: 0px;
	min-height: 35px;
}
.portlet.light>.portlet-title>.actions {
    padding: 6px 0 0px;
    height: 35px;
    
    
}
.portlet.light {
    padding: 0px 10px 2px;
    background-color: #fff;
}

.portlet-title {
    padding-left: 10px !important;
}
.input-medium {
    width: 100px!important;
}

.input-group.input-medium{
	display: inline;
	float: left;
}

/**
.fa-chevron-right::before {
    width: 11.43px;
	height: 16px;
}
**/



</style>

<div class="portlet light bordered">
    <div class="portlet-title" style="padding-bottom: 0;margin-bottom: 0;padding-top: 5px;padding-right: 5px;padding-left: 0px !important;">
    <!--  -->
         <div class="caption">
             <!-- <i class=" icon-info font-green"></i> -->
             <span class="caption-subject bold font-dark uppercase ">历史统计</span>
             <span class="caption-helper" >站点历史走势</span>
         </div>
     	 
         <div class="actions" style="margin-right: 0px;">
             <a href="javascript:graphicLoadingHistry(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
             <a href="javascript:graphicLoadingHistry(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
         </div>
    </div>
    <div class="portlet-body">
       <div id="ad_chart_1" class="chart" style="height: 250px;"></div>
       <!--
        <a href="javascript:graphicLoading(-1)" data-value="${lastMonth}" id="backoff" title="" class="tubiao-btn-left"><i class="fa fa-chevron-left"></i> </a> 
       <a href="javascript:graphicLoading(1)" data-value="${nextMonth}" id="forward" title="" class="tubiao-btn-right"> <i class="fa fa-chevron-right"></i></a>
        -->
	      
   </div>
</div>

<div class="portlet light portlet-fit bordered">
	<div class="portlet-title" style="padding-bottom: 0;margin-bottom: 0;padding-top: 5px;padding-right: 5px;">
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
           <!-- style="display: block;float: right;" 
           <span class="caption-helper" id="lasttime">历史数据更新时间  ${lasttime}</span> 
            <a href="javascript:graphicLoading(-1)" data-value="${lastMonth}" id="backoff" title="" class="tubiao-btn-left"><i class="fa fa-chevron-left"></i></a>
		<a href="javascript:graphicLoading(1)" data-value="${nextMonth}" id="forward" title="" class="tubiao-btn-right"><i class="fa fa-chevron-right"></i></a>
           -->
           
           <button type="button" onclick="loadBeforeTime(-1)"><span style="font-size: 14px;">昨天</span></button>
           <button type="button" onclick="loadBeforeTime(-2)"><span style="font-size: 14px;">前天</span></button>
           <!-- 
           <a href="javascript:loadNextTime(-1)" title="" class="tubiao-btn-left"><i class="fa fa-chevron-left"></i></a>
                
                 -->
           <a href="javascript:loadNextTime(-1);"  a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
        </div>
        <div class="col-md-3 col-sm-12" style="margin-top: 10px;">
       		<div class="input-group input-medium" >
           		<input type="text" id="selectTime" class="form-control daterangepick" placeholder="日期" >
                <input type="hidden" name="search_GTE_date" value="${search_GTE_date}">
            </div>
            <div class="input-group input-medium" style="left: 15px;top:3px; ">
                <!-- 
                                <a href="javascript:loadNextTime(1)"  title="" class="tubiao-btn-right"><i class="fa fa-chevron-right"></i></a>
                
                 -->
                <a href="javascript:loadNextTime(1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
                
            </div>
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
	                        <li onclick="changeTop(this,50)" <c:if test="${ipTop==2}">class="active"</c:if>>
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
				<a class="btn btn-circle btn-icon-only btn-default fullscreen"  id="fullscreenOractual"><i class="icon-size-fullscreen"></i></a>
			</div>
        </div>
        
	</div>
	
	<!-- 渠道和域名数据列表                           ---------------------------------------------------------------- -->
	<div class="portlet-body" style="margin: 0px;padding: 0;">
		<table id="scrolltableHistry" class="table table-striped table-bordered table-hover order-column" style="border: 0;">
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
	            <tbody id="tbodyhistry">
	                	
	            </tbody>
	        </table>
	</div>
</div>
<div id="menu">
		<div id="context-menu" style="z-index: 999;position:absolute;">
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
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/echarts.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>

<script type="text/javascript" >
	//初始化时间器
	//initatepicker();
	domaininitatepicker();
    var histryData = '${histryJson}';
	var dataType = '${dataType}';//页面数据类型
	var search = '${search}';//搜索
	var ipTop = '${ipTop}';// 总ip TOP
	var isRefresh = '${isRefresh}';
	var isRetrun = '${isRetrun}';
	var tbodydata = '${tbodydata}';
	var webPath = '${pageContext.request.contextPath}';
	var clickDate = '${lasttime}';  
	var XClickDate = ''; 
	var selectTime = '';
	
	function domaininitatepicker(){
		$('.datepick').datepicker({autoclose:true});
		$('.datetimepick').datetimepicker({language:'zh-CN',defaultTime:false,autoclose:true});
		
		$(".daterangepick").each(function(){
			var _startDate = $(this).next().val();
			var _endDate = $(this).next().next().val();

			if(_startDate==""){
				_startDate = moment().subtract("days", 29);
				_endDate = moment();
			}
			
			var dp = $(this).daterangepicker({
		        opens: App.isRTL() ? "left" : "right",
		        dateLimit: {
		            days: 92
		        },
		        autoclose:true,
		        autoApply:true,
		        autoUpdateInput:true,
		        maxDate:moment().subtract("days", 1),
		        
		        startDate:_startDate,
		        ranges: {
		        	今天: [moment()],
		           	 昨天: [moment().subtract("days", 1)],
		            "前天": [moment().subtract("days", 2)],
		            "大前天": [moment().subtract("days", 3)]
		        },
		        locale: {
		        	format:"YYYY-MM-DD",
		            separator: " - ",
		            applyLabel: "应用",
		            cancelLabel: '取消',
		            fromLabel: "提交",
		            toLabel: "To",
		            customRangeLabel: "其他",
		            daysOfWeek: ["日", "一", "二", "三", "四", "五", "六"],
		            monthNames: ["一月", "二月", "三月", "四月", "五月", "六月", "七月", "八月", "九月", "十月", "十一月", "十二月"],
		            firstDay: 1
		        },
		        singleDatePicker: true
		    }, function(start, end , label) {
		      //console.log(start,end,label);
		      //this.element.val(start.format("YYYY-MM-DD") + " -> " + end.format("YYYY-MM-DD"));
		      var _startDate = this.element.next();
		      //var _endDate = this.element.next().next();
		      _startDate.val(start.format("YYYY-MM-DD"));
		     // _endDate.val(end.format("YYYY-MM-DD"));
		      
		      //this.element.val(start.format("MM-DD") + " -> " + end.format("MM-DD"));
		    });

			if( $(this).next().val() == ""){
				$(this).val("");
			}
		});
	}
	
	/** 获取前天、昨天、今天、明天、后天……的时间  **/
	function getDateStr(AddDayCount,date) {
		date.setDate(date.getDate()+AddDayCount);//获取AddDayCount天后的日期
	    var y = date.getFullYear();
	    var m = date.getMonth()+1;//获取当前月份的日期
	    var d = date.getDate();
	    return y+"-"+m+"-"+d;
	}

	/** 字符串转日期格式  **/
	function getDate(strDate) {
	    var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
	    return date;
	}

	/** 通过点击昨天/前天按钮，加载历史数据 **/
	function loadBeforeTime(num){
		clickDate = getDateStr(num, new Date());
		ajaxRefreshPage();
		jQuery("#selectTime").val(''+clickDate+'');
	}

	/** 通过点击日期前进或后退按钮，加载历史数据 **/
	function loadNextTime(num){
		var now = jQuery("#selectTime").val();
		if(num == 1 && now == getDateStr(-1, new Date())){
			//console.log("不能再走了！！！");
		}else{
			clickDate = getDateStr(num,getDate(now));
			ajaxRefreshPage();
			jQuery("#selectTime").val(''+clickDate+'');
		}
	}
	
	/** 获取前天、昨天、今天、明天、后天……的时间  **/
	function getDateStr(AddDayCount,date) {
		date.setDate(date.getDate()+AddDayCount);//获取AddDayCount天后的日期
	    var y = date.getFullYear();
	    var m = date.getMonth()+1;//获取当前月份的日期
	    var d = date.getDate();
	    return y+"-"+m+"-"+d;
	}

	/** 字符串转日期格式  **/
	function getDate(strDate) {
	    var date = eval('new Date(' + strDate.replace(/\d+(?=-[^-]+$)/,function (a) { return parseInt(a, 10) - 1; }).match(/\d+/g) + ')');
	    return date;
	}

	/** 通过点击昨天/前天按钮，加载历史数据 **/
	function loadBeforeTime(num){
		clickDate = getDateStr(num, new Date());
		ajaxRefreshPage();
		jQuery("#selectTime").val(''+clickDate+'');
	}

	/** 通过点击日期前进或后退按钮，加载历史数据 **/
	function loadNextTime(num){
		var now = jQuery("#selectTime").val();
		if(num == 1 && now == getDateStr(-1, new Date())){
			//console.log("不能再走了！！！");
		}else{
			clickDate = getDateStr(num,getDate(now));
			ajaxRefreshPage();
			jQuery("#selectTime").val(''+clickDate+'');
		}
	}
	
	function graphicLoadingHistry(obj) {
		App.startPageLoading({animate: !0});//开启 加载 动画
		var pageNo = 1;
		if (obj == 1) { //表示前一段时间的数据
			pageNo = jQuery("a[a-type=lastPage]").attr("page-data");
		} else if (obj == -1) { //表示后一段时间的数据
			pageNo = jQuery("a[a-type=nextPage]").attr("page-data");
		} else {
			//表示被人客户端恶意修改参数
			return;
		}
		//alert("pageNo : "+pageNo);
		if (null == pageNo || "" == pageNo) {
			toastr.success("暂无数据, 请稍后重试 !");
			return;
		} else {
			if(pageNo==0)pageNo=1;
			//ajax读取 上一月的数据
			jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxLoadDashboardHistry.do?pageNo=" + pageNo,
				success : function(data) {
					var json = eval('(' + data + ')');
					if (json.success) {
						jQuery("a[a-type=lastPage]").attr("page-data",json.lastPage);
						jQuery("a[a-type=nextPage]").attr("page-data",json.nextPage);
						
						histryChart("ad_chart_1", json.ad_chart_1,json.notad_chart_1);
					} else {
						toastr.success(json.message);
					}
					App.stopPageLoading();//关闭 加载动画
				}
			});
		}
	} 
	
	
	
</script>
<script src="${pageContext.request.contextPath}/assets/js/dashboard_zx.js?time=<%=new Date() %>" type="text/javascript" charset="utf-8"></script>
<!-- END PAGE SCRIPTS -->
