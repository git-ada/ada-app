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
	<div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
          <!-- -->
               <div class="caption" style="margin-left: 0px;">
                   <i class=" icon-info font-green"></i>
                   <span class="caption-subject font-green bold uppercase">历史统计</span>
               </div>
           
               <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoadinghistry(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoadinghistry(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_1" class="chart" style="height: 150px;"> </div>
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

			     <c:if test="${dataType=='domain'}">
			     	<li>
			       <a href="javascript:;" id="oneTime">分时统计1</a>
			     </li>
			     	<li>
			       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainTime_histry.jhtm?domainId=${item[23]}&domain=${item[24]}&clickDate=${lasttime}')">分时统计2</a>
			     </li>
			     <li>
			       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/dashboard_domainTime3_histry.jhtm?domainId=${item[23]}&domain=${item[24]}&clickDate=${lasttime}')">分时统计3</a>
			     </li>
				     <li>
				         <a href="javascript:;" onclick="changeDataType('domainRegion',${item[23]})">地域统计</a>
				     </li>
			     </c:if>
			     <c:if test="${dataType=='domainAd'}">
			     	<li>
			       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/domainTimechartList_one_histry.jhtm?domainId=${item[23]}&dataType=${dataType}')">分时统计</a>
			     </li>
				     <li>
				         <a href="javascript:;" onclick="changeDataType('domainRegionAd',${item[23]})">地域统计</a>
				     </li>
			     </c:if>
			     <c:if test="${dataType=='domainNotAd'}">
			     	<li>
			       <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/domainTimechartList_one_histry.jhtm?domainId=${item[23]}&dataType=${dataType}')">分时统计</a>
			     </li>
				     <li>
				         <a href="javascript:;" onclick="changeDataType('domainRegionNotAd',${item[23]})">地域统计</a>
				     </li>
			     </c:if>
	
			 </ul>
		</div>
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/echarts.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var clickDate = "";
     function getClickDate(){
    	 var clickDate = ${lasttime};
    	 return clickDate;
     }
    /** 图表拉动 **/
	function graphicLoadinghistry(obj) {
		var pageNo = 1;
		if (obj == 1) { //表示前一段时间的数据
			pageNo = jQuery("a[a-type=lastPage]").attr("page-data");
		} else if (obj == -1) { //表示后一段时间的数据
			pageNo = jQuery("a[a-type=nextPage]").attr("page-data");
		} else {
			//表示被人客户端恶意修改参数
			return;
		}
		if (null == pageNo || "" == pageNo) {
			toastr.success("已经没有数据了！");
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
				}
			});
		}
	}
	
	/** 
	 *点击图表区域获取x轴时间作为参数以加载下面的域名列表 
	 **/
	function byClickLoadTableData(clickDate){
		jQuery.ajax({
			url : "${pageContext.request.contextPath}/clickLoadHistryData.do?dataType=domain&clickDate="+clickDate,
			success : function(data) {
				if (data!=null) {
					var json = eval('(' + data + ')');
					loadTbody(json,2);
					getClickDate();
				}
			},
			error: function (data) {
				alert("数据加载异常!!!");
			}
		});
	}
	
	/** 全站历史数据图表 **/
	function histryChart(divid, data1, data2){
		var d1 = [];
		var d2 = [];
		var d3 = [];
		var d4 = [];
		var d5 = [];
		var d6 = '';
		$.each(data1, function (index, item) {
	        d1.push(item.date);
	        d2.push(item.adip);
	        d3.push(item.pv);
	    });
		$.each(data2, function (index, item) {
	        d4.push(item.notadip);
	    });

		var myChart = echarts.init(document.getElementById(divid));
		myChart.on('click', function (params) {
			console.log("date: "+params.name);
			byClickLoadTableData(params.name);
			console.log("请求完成--");
		});
		myChart.setOption({
	   	      tooltip : {
	   	          trigger: 'axis',
	   	       	  borderWidth: 1.5,
	   	       	  backgroundColor: 'rgba(255,255,255,0.85)',
	   	          borderColor: '#48C0D8',
	   	          textStyle: {
	   	        	  fontSize:12,
	   	        	  fontFamily: "Microsoft YaHei",
	   	        	  color: '#000033'
	   	          },
	   	          axisPointer : {          
	   	              type : 'shadow'      
	   	          }
	   	      },
	   	      color:['#2db7d2','#2492a8','red'], 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%', 
	   	          itemWidth: 32, 
				  itemHeight: 16,
				  itemBorderRadius:0,
	   	          data:[{
	                  name:'广告IP',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告IP',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总PV数',
	                  icon : 'line',
	                  textStyle:{}
	              }]
	   	      },
	   	      grid: {
	   	    	  y:'5%',
	   	    	  height:'75%',
	   	          left: '3%',
	   	          right: '4%',
	   	          bottom: '0%',
	   	          containLabel: true
	   	      },
	   	      xAxis : [
	   	          {
	   	              type : 'category',
	   	              splitLine:{     
	   	            	  show: true
	   	              },
		   	          axisLabel: {
		   	              interval: 1 
		   	          },
	   	              data : d1
	   	          }
	   	      ],
	   	      yAxis : [
		   	       {
		   	            type: 'value',
		   	            name: 'IP统计',
			   	        splitLine:{   
		  	           		show: false
		  	           	},
		   	            axisLabel: {
		   	                formatter: '{value} '
		   	            }
		   	        },
		   	        {
		   	            type: 'value',
		   	            name: '总PV数',
		   	            
			   	        splitLine:{     
		 	           		show: false
		 	           	},
		   	            axisLabel: {
		   	                formatter: '{value} '
		   	            }
		   	        }
	   	      ],
	   	      series : [
	   	          {
	   	              name:'广告IP',
	   	              type:'bar',
	   	        	  stack: 'IP统计',
	   	              data:d2
	   	          },{
	   	              name:'非广告IP',
	   	              type:'bar',
	   	        	  stack: 'IP统计',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'总PV数',
	   	              type:'line',
	   	              yAxisIndex: 1,
	   	         	  stack: '总PV数',
	   	              data:d3
	   	          }
	   	      ]
	   	});
	}


var dataType = '${dataType}';//页面数据类型
var domainId = "";//域名ID
var stClick = false;
var cClick = false;
var sClick = false;
var mClick = false;
//打开菜单
function openMenu(a,event){
	
	var id = jQuery(a).attr("id");
	var domain = jQuery(a).attr("domain");
	 jQuery("#oneTime").attr("onclick","gotoPage('${pageContext.request.contextPath}/dashboard_domainTime_one_histry.jhtm?domainId="+id+"&dataType="+dataType+"&domain="+domain+"&clickDate="+clickDate+"')");
	//jQuery("#oneTime").attr("onclick","gotoPage('${pageContext.request.contextPath}/domainTimechartList_one.jhtm?domainId="+id+"&dataType="+dataType+"&domain="+domain+"')");
	//jQuery("#AdVSNotAd").attr("onclick","gotoPage('${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId="+id+"&domain="+domain+"')");
	if(dataType=="domain"){
		jQuery("#region").attr("onclick","changeDataType('domainRegion',"+id+")");
	}else if(dataType==""){
		jQuery("#region").attr("onclick","changeDataType('domainRegionAd',"+id+")");
	}else if(dataType==""){
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
function Percentage(num, total) { 
    return (Math.round(num / total * 10000) / 100.00 + "%");// 小数点后两位百分比
   
}

function PercentageMax(num, total){
	var p = Math.round(num / total * 10000) / 100.00 >100 ? 100 : Math.round(num / total * 10000) / 100.00;
	return (p+"%");
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
		
		  //jQuery("[event="+data+"]").toggleClass("displaynone");
		 /*  var aa = 0;
		  jQuery(".stdisplaynone").each(function (){
			  jQuery(this).show();
			  
			  aa++;
		  }); 
		  console.log(aa+"aa"); */
		  var aa = 0;
     	   jQuery("[event='"+data+"']").each(function (){
			  jQuery(this).toggleClass("displaynone");
			  aa++;
		  });  
     	  console.log("---->"+data);
		  console.log(aa+"aa"); 
	/* 	  var bb = 1;
		    jQuery("td").each(function(){
			   console.log(bb+"bbb");
			   bb++;
		   });  */
		  /* jQuery("[class=displaynone]").each(function(){
			  jQuery(this).show();
			  console.log("aaa");
		  }); */
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
 

var t;
var isRefresh = true;
var oTable;
var oTable2;
var table;
//渲染table
var initTable1 = function () {
     table = $('#scrolltableHistry');
     oTable = table.dataTable({
   
  
        paging: false,
        scrollY:        document.documentElement.clientHeight-290,
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
		//alert("进来了！！！");
		var tbodydata = '${tbodydata}';
		var json = eval('(' + tbodydata + ')');
		loadTbody(json,1);
		
		var histryData = '${histryJson}';
		var json2 = eval('(' + histryData + ')');
		histryChart("ad_chart_1", json2.ad_chart_1,json2.notad_chart_1);
		
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
	    		 
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-120);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-120);
	    		 
	    		 //jQuery(".dataTables_scrollHeadInner").css("width","4000px");
	    		 //jQuery(".dataTables_scrollHeadInner table").css("width","100%");
	    		 
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
				url : "${pageContext.request.contextPath}/ajaxLoadHistryData.do?pageNo=" + pageNo,
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
	 //t = window.setTimeout("ajaxRefreshPage('"+dataType+"')",ajaxTime); 
	  /**
	 function ajaxRefreshPage(type,domainId){
		 jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxRefreshHistryData.do?dataType="+dataType+"&domainId="+domainId,
				success : function(data) {
					
					if (data!=null) {
						var json = eval('(' + data + ')');
						loadTbody(json,2);
					
					}
					clearTimeout(t);
					if(browsingHistory[browsingHistory.length-1].indexOf("/dashboardHistry.jhtm")>=0 && isRefresh){
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
	  **/
	 /** js渲染tbody **/
	 function loadTbody(json,num){
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
				console.log("历史域名数据条数------>"+dataList.length);
				for(var i=0;i<dataList.length;i++){
					var item = dataList[i];
					var firstTd = "";
					var tr = "";
				    var tr2 = "";
				    var tr3 = "";
				    if(dataType=="domain"){
				    	firstTd="<td style='min-width: 140px;'  title='"+item[24]+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu' data-toggle='dropdown' onclick='openMenu(this)' id='"+item[23]+"' domain='"+item[24]+"'>"+item[25]+"</a></td>";
				    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
						"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
							"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/domainTimechartList_one.jhtm?domainId="+item[23]+"&dataType="+dataType+"\")'>分时统计</a></li>"+
                      	"<li><a href='javascript:;' onclick='changeDataType(\"domainRegion,"+item[23]+"\")'>地域统计</a></li>"+
				      	"</ul></div>";
				      	menu+=tr3;
				    }else if(dataType=="domainAd"){
				    	firstTd = "<td style='min-width: 140px;'  title='"+item[24]+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu"+item[23]+"' data-toggle='dropdown' onclick='openMenu(this)'>"+item[25]+"</a></td>";
				    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
						"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
							"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/domainTimechartList_one.jhtm?domainId="+item[23]+"&dataType="+dataType+"\")'>分时统计</a></li>"+
                     	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionAd,"+item[23]+"\")'>地域统计</a></li>"+
				      	"</ul></div>";
				      	menu+=tr3;
				    	
				    }else if(dataType=="domainNotAd"){
				    	firstTd = "<td style='min-width: 140px;'  title='"+item[24]+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' data-target='#context-menu"+item[23]+"' data-toggle='dropdown' onclick='openMenu(this)'>"+item[25]+"</a></td>";
				    	tr3+="<div id='context-menu"+dataList[i].id+"' style='position: absolute;z-index: 999;'>"+
						"<ul class='dropdown-menu' role='menu' style='z-index: 99999'>"+
							"<li><a href='javascript:;' onclick='gotoPage(\"${pageContext.request.contextPath}/domainTimechartList_one.jhtm?domainId="+item[23]+"&dataType="+dataType+"\")'>分时统计</a></li>"+
                     	 "<li><a href='javascript:;' onclick='changeDataType(\"domainRegionNotAd,"+item[23]+"\")'>地域统计</a></li>"+
				      	"</ul></div>";
				      	menu+=tr3;
				    }else if(dataType=="domainRegion"){
				    	firstTd = "<td style='min-width: 140px;'  >"+item[23]+"</td>";
				    }else if(dataType=="domainRegionAd"){
				    	firstTd = "<td style='min-width: 140px;'  >"+item[23]+"</td>";
				    }else if(dataType=="domainRegionNotAd"){
				    	firstTd = "<td style='min-width: 140px;'  >"+item[23]+"</td>";
				    }
				   
				    
				    var sumST = item[7]+item[8]+item[9]+item[10];
				    var sumC = item[11]+item[12]+item[13]+item[14];
				    var sumS = item[15]+item[16]+item[17]+item[18];
				    var sumM = item[19]+item[20]+item[21]+item[22];
				    var IP = item[0];
			  		tr+="<tr num='"+i+"'>" + firstTd+
					  "<td >"+IP+"</td>"+
					  "<td ><span class='tdonly'>"+item[1]+"</span></td>"+
					  "<td ><span class='tdonly'>"+item[2]+"</span></td>"+
					  
					  "<td title='"+Percentage(item[3],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[3],IP)+" '>"+
					  	"<span class='only'> "+item[3]+" </span></div></div></td>"+
				  	  "<td title='"+Percentage(item[4],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[4],IP)+" '>"+
				  	    "<span class='only'> "+item[4]+" </span></div></div></td>"+
				  	  "<td title='"+Percentage(item[5],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[5],IP)+" '>"+
				  	    "<span class='only'> "+item[5]+" </span></div></div></td>"+
				  	  "<td title='"+Percentage(item[6],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[6],IP)+" '>"+
				  	    "<span class='only'> "+item[6]+" </span></div></div></td>"+
				  	    
				  	  "<td title='"+Percentage(sumST,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumST,IP)+" '>"+
				  	    "<span class='only'> "+sumST+" </span></div></div></td>"+
				  	  "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[7],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[7],IP)+" '>"+
				  	    "<span class='only'> "+item[7]+" </span></div></div></td>"+
				  	  "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[8],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[8],IP)+" '>"+
				  	    "<span class='only'> "+item[8]+" </span></div></div></td>"+
				  	  "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[9],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[9],IP)+" '>"+
				  	    "<span class='only'> "+item[9]+" </span></div></div></td>"+
				  	  "<td class='"+stDisplay+"' event='st' title='"+Percentage(item[10],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[10],IP)+" '>"+
				  	    "<span class='only'> "+item[10]+" </span></div></div></td>"+
				  	    
				  	  "<td title='"+Percentage(sumC,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumC,IP)+" '>"+
				  	    "<span class='only'> "+sumC+" </span></div></div></td>"+
				  	  "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[11],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[11],IP)+" '>"+
				  	    "<span class='only'> "+item[11]+" </span></div></div></td>"+
				  	  "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[12],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[12],IP)+" '>"+
				  	    "<span class='only'> "+item[12]+" </span></div></div></td>"+
				  	  "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[13],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[13],IP)+" '>"+
				  	    "<span class='only'> "+item[13]+" </span></div></div></td>"+
				  	  "<td class='"+cDisplay+"' event='c' title='"+Percentage(item[14],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[14],IP)+" '>"+
				  	    "<span class='only'> "+item[14]+" </span></div></div></td>"+
				  	    
				  	  "<td title='"+Percentage(sumS,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumS,IP)+" '>"+
				  	    "<span class='only'> "+sumS+" </span></div></div></td>"+
				  	  "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[15],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[15],IP)+" '>"+
				  	    "<span class='only'> "+item[15]+" </span></div></div></td>"+
				  	  "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[16],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[16],IP)+" '>"+
				  	    "<span class='only'> "+item[16]+" </span></div></div></td>"+
				  	  "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[17],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[17],IP)+" '>"+
				  	    "<span class='only'> "+item[17]+" </span></div></div></td>"+
				  	  "<td class='"+sDisplay+"' event='s' title='"+Percentage(item[18],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[18],IP)+" '>"+
				  	    "<span class='only'> "+item[18]+" </span></div></div></td>"+
					  
				  	  "<td title='"+Percentage(sumM,IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(sumM,IP)+" '>"+
				  	    "<span class='only'> "+sumM+" </span></div></div></td>"+
				  	  "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[19],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[19],IP)+" '>"+
				  	    "<span class='only'> "+item[19]+" </span></div></div></td>"+
				  	  "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[20],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[20],IP)+" '>"+
				  	    "<span class='only'> "+item[20]+" </span></div></div></td>"+
				  	  "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[21],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[21],IP)+" '>"+
				  	    "<span class='only'> "+item[21]+" </span></div></div></td>"+
				  	  "<td class='"+mtDisplay+"' event='m' title='"+Percentage(item[22],IP)+"'><div class='myprogress'><div class='progress-bar progress-bar-success' role='progressbar' aria-valuenow='40' aria-valuemin='0' aria-valuemax='100' style='width:"+PercentageMax(item[22],IP)+" '>"+
				  	    "<span class='only'> "+item[22]+" </span></div></div></td>"+
					 
					  "</tr>";
					  table+=tr;
				  if(num==2){
					  tr2+="<tr>"+firstTd+
					  "<td style='min-width: 70px'>"+IP+"</td>"+
					  /* "<td style='min-width: 80px'>"+dataList[i].pv+"</td>"+ */
						"</tr>";
					lefttable+=tr2;
				  }
				}
			}
			
			if(browsingHistory[browsingHistory.length-1].indexOf("/dashboardHistry.jhtm")>=0 && dataType==json.dataType && isRefresh){
				if(num==1){
					//alert(table+menu);
					jQuery("#tbodyhistry").empty();
					jQuery("#tbodyhistry").append(table);
					//jQuery("#menu").append(menu);
				}else if(num==2){
					//jQuery("#SUMIP").html(SUMIP);
					//jQuery("#SUMPV").html(SUMPV);
					//jQuery("#ip").html(json.sumip);
					//jQuery("#pv").html(json.sumpv);
					jQuery(".DTFC_LeftHeadWrapper #firstTh").html(firstTh);
					jQuery("#tbodyhistry").empty();
					jQuery("#tbodyhistry").append(table);
					jQuery(".DTFC_LeftBodyWrapper #tbodyhistry").empty();
					jQuery(".DTFC_LeftBodyWrapper #tbodyhistry").append(lefttable+menu);
					jQuery("#lasttime").html("最后一次更新时间  "+json.lasttime);
					
					clickDate = json.lasttime;
				}
				
				
			}
	 }
	 
</script>

<!-- END PAGE SCRIPTS -->
