<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- <link href="asset/global/css/components.min.css" rel="stylesheet" id="style_components" type="text/css">
<link href="asset/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css">
        <link href="asset/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<script src="asset/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="asset/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="asset/global/scripts/app.min.js" type="text/javascript"></script>
 -->
<style>
.portlet > .portlet-title {
    border-bottom: 1px solid #eee;
    border-radius: 4px 4px 0 0;
    margin-bottom: 0px !important;
    min-height: 41px;
    padding: 0;
}
.portlet.light {
    background-color: #fff;
    padding: 0px 0px 0px !important;
    
}
.portlet > .portlet-title::after {
    clear: left !important;
}
/**
.portlet > .portlet-body > .ada_ad-chart_2 > .amcharts-main-div > .amcharts-chart-div{
	height:194px;
	width: 605px;
	
}

.portlet > .portlet-body > .ada_ad-chart_2 > .amcharts-main-div > .amChartsLegend.amcharts-legend-div {
	
	width: 107px;
	
}
**/

</style>
 
 <div class="page-bar" style="border: none;">
    <ul class="page-breadcrumb" style="width: 100%">
        <li>
            <i class="icon-home"></i>
            	首页
            <i class="fa fa-angle-right"></i>
        </li>
         <li>
            <span>${domain}</span>
        </li>
    </ul>
</div> 
 <!-- 第六个图表 基本数据 -->
 <div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <a onclick="gotoHistoryPage(-1)"> <i class="icon-action-undo"></i></a>
                  <i class=" icon-info font-green"></i>
                  <span class="caption-subject font-green bold uppercase">基本数据</span>
                          <!-- caption-subject font-dark bold uppercase -->
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="ad6" id="date_chartad6" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="ad6" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="ad6" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_6" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
              	  <i class=" icon-info font-green"></i>
                  <span class="caption-subject font-green bold uppercase">基本数据</span>
                          <!-- caption-subject font-dark bold uppercase -->
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="notad6" id="date_chartnotad6" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
             <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="notad6" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="notad6" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_6" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
 <!-- 第一个图表 用户分析-->
<div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class=" icon-users font-green"></i>
                  <span class="caption-subject font-green bold uppercase">用户分析</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="ad1" id="date_chartad1" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
              <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="ad1" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="ad1" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_1" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
              	  <i class=" icon-users font-green"></i>
                  <span class="caption-subject font-green bold uppercase">用户分析</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="notad1" id="date_chartnotad1" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
              <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="notad1" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="notad1" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_1" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- 第二个图表 -->
<div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
              	  <i class=" icon-clock font-green"></i>
                  <span class="caption-subject font-green bold uppercase">页面停留时长</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="ad2" id="date_chartad2" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
              <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="ad2" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="ad2" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ada_ad-chart_2" class="ada_ad-chart_2" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
              	  <i class=" icon-clock font-green"></i>
                  <span class="caption-subject font-green bold uppercase">页面停留时长</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="notad2" id="date_chartnotad2" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
              <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="notad2" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="notad2" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="ada_notad-chart_2" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- 第三个图表-->
 <div class="row">
   <div class="col-lg-6 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-layers font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标点击</span>
                   <span class="caption-helper">广告入口</span>
               </div>
               <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="ad3" id="date_chartad3" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                <a onclick="graphicLoading(1,this)" num="ad3" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a onclick="graphicLoading(-1,this)" num="ad3" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
            </div>
           </div>
           <div class="portlet-body">
               <div id="ada_ad-chart_3" class="chart" style="height: 300px; padding: 0px; position: relative;"> </div>
           </div>
       </div>
   </div>
   <div class="col-lg-6 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-layers font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标点击</span>
                   <span class="caption-helper">非广告入口</span>
               </div>
               <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="notad3" id="date_chartnotad3" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                <a onclick="graphicLoading(1,this)" num="notad3" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a onclick="graphicLoading(-1,this)" num="notad3" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
            </div>
           </div>
           <div class="portlet-body">
               <div id="ada_notad-chart_3" class="chart" style="height: 300px; padding: 0px; position: relative;"> </div>
           </div>
        </div>
    </div>
</div>
<!-- 第四个图表-->
 <div class="row">
   <div class="col-lg-6 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-refresh font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标滚动</span>
                   <span class="caption-helper">广告入口</span>
               </div>
               <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="ad4" id="date_chartad4" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                <a onclick="graphicLoading(1,this)" num="ad4" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a onclick="graphicLoading(-1,this)" num="ad4" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
            </div>
           </div>
           <div class="portlet-body">
               <div id="ada_ad-chart_4" class="chart" style="height: 300px; padding: 0px; position: relative;"> </div>
           </div>
       </div>
   </div>
   <div class="col-lg-6 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-refresh font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标滚动</span>
                   <span class="caption-helper">非广告入口</span>
               </div>
               <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="notad4" id="date_chartnotad4" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                <a onclick="graphicLoading(1,this)" num="notad4" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a onclick="graphicLoading(-1,this)" num="notad4" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
            </div>
           </div>
           <div class="portlet-body">
               <div id="ada_notad-chart_4" class="chart" style="height: 300px; padding: 0px; position: relative;"> </div>
           </div>
        </div>
    </div>
</div>
<!-- 第五个图表-->
 <div class="row">
   <div class="col-lg-6 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-cursor-move font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标移动</span>
                   <span class="caption-helper">广告入口</span>
               </div>
               <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="ad5" id="date_chartad5" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                <a onclick="graphicLoading(1,this)" num="ad5" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a onclick="graphicLoading(-1,this)" num="ad5" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
            </div>
           </div>
           <div class="portlet-body">
               <div id="ada_ad-chart_5" class="chart" style="height: 300px; padding: 0px; position: relative;"> </div>
           </div>
       </div>
   </div>
   <div class="col-lg-6 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-cursor-move font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标移动</span>
                   <span class="caption-helper">非广告入口</span>
               </div>
               <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="notad5" id="date_chartnotad5" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div>
               <div class="actions" style="margin-right: 15px;">
                <a onclick="graphicLoading(1,this)" num="notad5" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a onclick="graphicLoading(-1,this)" num="notad5" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
            </div>
           </div>
           <div class="portlet-body">
               <div id="ada_notad-chart_5" class="chart" style="height: 300px; padding: 0px; position: relative;"> </div>
           </div>
        </div>
    </div>
</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/echarts.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
Date.prototype.format = function(fmt) {//js  格式化日期 
    var o = { 
       "M+" : this.getMonth()+1,                 //月份 
       "d+" : this.getDate(),                    //日 
       "h+" : this.getHours(),                   //小时 
       "m+" : this.getMinutes(),                 //分 
       "s+" : this.getSeconds(),                 //秒 
       "q+" : Math.floor((this.getMonth()+3)/3), //季度 
       "S"  : this.getMilliseconds()             //毫秒 
   }; 
   if(/(y+)/.test(fmt)) {
           fmt=fmt.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
   }
    for(var k in o) {
       if(new RegExp("("+ k +")").test(fmt)){
            fmt = fmt.replace(RegExp.$1, (RegExp.$1.length==1) ? (o[k]) : (("00"+ o[k]).substr((""+ o[k]).length)));
        }
    }
   return fmt; 
} 
/**---------预加载---------**/
jQuery(document).ready(function() {
	//初始化时间控件
	jQuery('.date-picker').datepicker({
        rtl: App.isRTL(),
        orientation: "left",
        autoclose: true
    });
    var chartdata = ${json};
    chart_1("ad_chart_1",chartdata.ad_chart_1);
    chart_1("notad_chart_1",chartdata.notad_chart_1);
    chart_6("ad_chart_6",chartdata.ad_chart_6);
    chart_6("notad_chart_6",chartdata.notad_chart_6);
    
    chart_2("ada_ad-chart_2",chartdata.ad_chart_3);//stayeTime
    chart_2("ada_notad-chart_2",chartdata.notad_chart_3);
    chart_3("ada_ad-chart_3",chartdata.ad_chart_2);//click
    chart_3("ada_notad-chart_3",chartdata.notad_chart_2);
    chart_4("ada_ad-chart_4",chartdata.ad_chart_4);//soroll
    chart_4("ada_notad-chart_4",chartdata.notad_chart_4);
    chart_5("ada_ad-chart_5",chartdata.ad_chart_5);//move
    chart_5("ada_notad-chart_5",chartdata.notad_chart_5);
    
    jQuery("a[a-type=lastPage]").attr("page-data",chartdata.lastPage);
    jQuery("a[a-type=nextPage]").attr("page-data",chartdata.nextPage);
    
    jQuery("input[id^=date_chart]").change(function(){
    	isTodayAndHave(jQuery(this).val(),jQuery(this).attr("num"))
    });
});

	 function graphicLoading(obj,a) {
		 App.startPageLoading({animate: !0});//开启 加载 动画
		 var search_date = "";
		 var num = jQuery(a).attr("num");
		if (obj == 1) { //表示前一段时间的数据
			search_date = jQuery(a).attr("page-data");
		} else if (obj == -1) { //表示后一段时间的数据
			search_date = jQuery(a).attr("page-data");
		} else {
			//表示被人客户端恶意修改参数
			return;
		}
		if (null == search_date || "" == search_date) {
			toastr.success("已经没有数据了！");
			App.stopPageLoading();//关闭 加载动画
			return;
		} else {//搜索日期不为空
			isTodayAndHave(search_date,num);
		}
	} 

//判断搜索日期是不是今天 以及 本地session中是否已有数据
function isTodayAndHave(search_date,num){
	var todayDate = new Date().format("yyyy-MM-dd");
	if(search_date==todayDate){//判断日期是不是今天  如果是则从数据库查询最新数据
		//异步读取 数据
		ajax_Refresh(search_date,num);
	}else{//如果不是 则从本地session 中取数据
		var sessionData = sessionStorage.getItem("domainTime"+search_date);
		console.log("sessionData--->"+sessionData);
		if(sessionData!=null && sessionData!=""){//判断本地是否存有数据 如果有 则直接使用
			console.log("直接用session中的数据");
			refreshChart(JSON.parse(sessionData),num);
		}else{//没有则从数据库中 查询数据
			console.log("异步加载数据 并预加载三天的数据");
			ajax_Refresh(search_date,num);//异步读取 数据
			/** 预加载三天的数据 **/
			var beforDate = getPreDay(search_date);
			for(var i=0;i<3;i++){
				ajax_Refresh(beforDate,num,0);
				beforDate = getPreDay(beforDate);
			}
			
		}
	}
}
//异步加载数据
function ajax_Refresh(search_date,num,isRefresh){
	jQuery.ajax({
		url : "${pageContext.request.contextPath}/ajaxdashboard_domainTime.do?pageNo=&domainId="+${domainId}+"&dataType=AdAndNotAd&search_date="+search_date,
		success : function(data) {
			var json = eval('(' + data + ')');
			if (json.success) {
				if(isRefresh==0){//不刷新chart 只缓存数据
					
				}else{
					refreshChart(json,num);
				}
				sessionStorage.setItem("domainTime"+search_date, JSON.stringify(json));//把数据存到session中
			} else {
				toastr.success(json.message);
			}
			App.stopPageLoading();//关闭 加载动画
		},
		error:function(data){
			App.stopPageLoading();//关闭 加载动画
		}
	});
}
//更新chart
function refreshChart(json,num){
   
    jQuery("#date_chart"+num).val(json.search_date);
	jQuery("a[num="+num+"][a-type=lastPage]").attr("page-data",json.lastPage);
	jQuery("a[num="+num+"][a-type=nextPage]").attr("page-data",json.nextPage);
	if(num=="ad1"){
		chart_1("ad_chart_1",json.ad_chart_1);
	}else if(num=="notad1"){
		 chart_1("notad_chart_1",json.notad_chart_1);
	}else if(num=="ad2"){
		chart_2("ada_ad-chart_2",json.ad_chart_3);//stayeTime
	}else if(num=="notad2"){
		chart_2("ada_notad-chart_2",json.notad_chart_3);
	}else if(num=="ad3"){
		 chart_3("ada_ad-chart_3",json.ad_chart_2);//click
	}else if(num=="notad3"){
		chart_3("ada_notad-chart_3",json.notad_chart_2);
	}else if(num=="ad4"){
		chart_4("ada_ad-chart_4",json.ad_chart_4);//soroll
	}else if(num=="notad4"){
		chart_4("ada_notad-chart_4",json.notad_chart_4);
	}else if(num=="ad5"){
		 chart_5("ada_ad-chart_5",json.ad_chart_5);//move
	}else if(num=="notad5"){
		chart_5("ada_notad-chart_5",json.notad_chart_5);
	}else if(num=="ad6"){
		 chart_6("ad_chart_6",json.ad_chart_6);
	}else if(num=="notad6"){
		chart_6("notad_chart_6",json.notad_chart_6);
	}
	
	App.stopPageLoading();//关闭 加载动画
}
	
	/**以下为 echarts 做法 line:352~827**/
	/** 页面停留时间 **/
    function chart_2(divid,data){
    	//X轴数据
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	var d6 = [];
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.st1);
            d3.push(item.st2);
            d4.push(item.st3);
            d5.push(item.st4);
            d6.push(item.ip);
        });
    	var myChart = echarts.init(document.getElementById(divid));
    	myChart.setOption({
	   	      tooltip : {
	   	          trigger: 'axis',
	   	       	  borderWidth: 1.5,
	   	       	  backgroundColor: 'rgba(255,255,255,0.85)',//'White',
	   	          borderColor: '#48C0D8',
	   	          textStyle: {
	   	        	  fontSize:12,
	   	        	  fontFamily: "Microsoft YaHei",
	   	        	  color: '#000033'
	   	          },
	   	          axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	   	              type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow' 
	   	          }
	   	      },
	   	      //color:['#48C0D8','#00E3E3','#00FFFF','#80FFFF'], //图例颜色 #48C0D8 #17C7E3
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','red'], //图例颜色 #48C0D8 #17C7E3 #ef3f3f
	   	      legend: {
	   	    	  x : '5.5%',//图例x方向移动距离
	   	    	  y : '85%', //图例y方向移动距离
	   	    	  //默认横向布局，纵向布局值为'vertical'
	   	          //orient:'vertical',
	   	          itemWidth: 32,  // 图例高    
				  itemHeight: 16, // 图例宽    
				  itemGap: 25,    // 每个图例间的间隔
				  itemBorderRadius:0,// 图例圆角
	   	          data:[{
	   	        	  //自定义图例
	                  name:'5~30秒',
	                  icon : 'bar',
	                  //icon:'image://${pageContext.request.contextPath}/assets/img/.png', //自定义图标
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'31~120秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'121~300秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'5分钟以上',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'IP',
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
	   	              splitLine:{      //是否展示网格线
	   	            	  show: true
	   	              },
		   	          axisLabel: {
		   	              interval: 2 //interval 指间隔少类别画栅格
		   	          },
	   	              data : d1
	   	          }
	   	      ],
	   	      yAxis : [
	   	          {
	   	              type : 'value',
	   	           	  splitLine:{      //是否展示网格线
	   	           		  show: false
	   	           	  }
	   	          }
	   	      ],
	   	      series : [
	   	          {
	   	              name:'5~30秒',
	   	              type:'bar',
	   	        	  stack: '页面停留时长',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'31~120秒',
	   	              type:'bar',
	   	         	  stack: '页面停留时长',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'121~300秒',
	   	              type:'bar',
	   	         	  stack: '页面停留时长',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'5分钟以上',
	   	              type:'bar',
	   	         	  stack: '页面停留时长',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'IP',
	   	              type:'line',
	   	         	  stack: 'ip',
	   	              data:d6
	   	          }
	   	      ]
	   	});
          
    }
    /** 鼠标点击 **/
    function chart_3(divid,data){
    	//X轴数据
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	var d6 = [];
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.c1);
            d3.push(item.c2);
            d4.push(item.c3);
            d5.push(item.c4);
            d6.push(item.ip);
        });
    	var myChart = echarts.init(document.getElementById(divid));
    	myChart.setOption({
    		  tooltip : {
	   	          trigger: 'axis',
	   	       	  borderWidth: 1.5,
	   	          backgroundColor: 'rgba(255,255,255,0.85)',//'White',
	   	          borderColor: '#48C0D8',
	   	          textStyle: {
	   	        	  fontSize:12,
	   	        	  fontFamily: "Microsoft YaHei",
	   	        	  color: '#000033'
	   	          },
	   	          axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	   	              type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
	   	          }
	   	      },//#F04848
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','red'], //图例颜色
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  itemGap: 25,
				  borderRadius:0,
	   	          data:[{
	                  name:'1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'IP',
	                  icon : 'line',
	                  textStyle:{  }
	              }]
	   	      },
	   	      grid: {
	   	    	  y:'5%',
	   	    	  height:'75%',
	   	          left: '3%',
	   	          right: '4%',
	   	          bottom: '3%',
	   	          containLabel: true
	   	      },
	   	      xAxis : [
	   	          {
	   	              type : 'category',
	   	              splitLine:{      //网格线
	   	            	  show: true
	   	              },
		   	          axisLabel: {
		   	              interval: 2
		   	          },
	   	              data : d1
	   	          }
	   	      ],
	   	      yAxis : [
	   	          {
	   	              type : 'value',
	   	              splitLine:{      //网格线
	   	            	  show: false
	   	              }
	   	          }
	   	      ],
	   	      series : [
	   	          {
	   	              name:'1~2次',
	   	              type:'bar',
	   	        	  stack: '鼠标点击',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'3~5次',
	   	              type:'bar',
	   	         	  stack: '鼠标点击',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'6~10次',
	   	              type:'bar',
	   	         	  stack: '鼠标点击',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'10+次',
	   	              type:'bar',
	   	         	  stack: '鼠标点击',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'IP',
	   	              type:'line',
	   	         	  stack: 'ip',
	   	              data:d6
	   	          }
	   	      ]
	   	});
	          
	}
    /** 鼠标滚动 **/
    function chart_4(divid,data){
    	//X轴数据
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	var d6 = [];
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.s1);
            d3.push(item.s2);
            d4.push(item.s3);
            d5.push(item.s4);
            d6.push(item.ip);
        });
    	var myChart = echarts.init(document.getElementById(divid));
    	myChart.setOption({
    		  tooltip : {
	   	          trigger: 'axis',
	   	       	  borderWidth: 1.5,
	   	          backgroundColor: 'rgba(255,255,255,0.85)',//'White',
	   	          borderColor: '#48C0D8',
	   	          textStyle: {
	   	        	  fontSize:12,
	   	        	  fontFamily: "Microsoft YaHei",
	   	        	  color: '#000033'
	   	          },
	   	          axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	   	              type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow' 
	   	          }
	   	      },
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','red'], //图例颜色
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  itemGap: 25,
				  borderRadius:0,
	   	          data:[{
	                  name:'1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'IP',
	                  icon : 'line',
	                  textStyle:{ }
	              }]
	   	      },
	   	      grid: {
	   	      	  y:'5%',
	   	    	  height:'75%',
	   	          left: '3%',
	   	          right: '4%',
	   	          bottom: '3%',
	   	          containLabel: true
	   	      },
	   	      xAxis : [
	   	          {
	   	              type : 'category',
	   	              splitLine:{      //网格线
	   	            	  show: true
	   	              },
		   	          axisLabel: {
		   	              interval: 2
		   	          },
	   	              data : d1
	   	          }
	   	      ],
	   	      yAxis : [
	   	          {
	   	              type : 'value',
	   	              splitLine:{      //网格线
	   	            	  show: false
	   	              }
	   	          }
	   	      ],
	   	      series : [
	   	          {
	   	              name:'1~2次',
	   	              type:'bar',
	   	        	  stack: '鼠标滚动',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'3~5次',
	   	              type:'bar',
	   	         	  stack: '鼠标滚动',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'6~10次',
	   	              type:'bar',
	   	         	  stack: '鼠标滚动',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'10+次',
	   	              type:'bar',
	   	         	  stack: '鼠标滚动',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'IP',
	   	              type:'line',
	   	         	  stack: 'ip',
	   	              data:d6
	   	          }
	   	      ]
	   	});
	          
	}
    /** 鼠标移动 **/
    function chart_5(divid,data){
    	//X轴数据
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	var d6 = [];
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.m1);
            d3.push(item.m2);
            d4.push(item.m3);
            d5.push(item.m4);
            d6.push(item.ip);
        });
    	var myChart = echarts.init(document.getElementById(divid));
    	myChart.setOption({
    		  tooltip : {
	   	          trigger: 'axis',
	   	       	  borderWidth: 1.5,
	   	          backgroundColor: 'rgba(255,255,255,0.85)',//'White',
	   	          borderColor: '#48C0D8',
	   	          textStyle: {
	   	        	  fontSize:12,
	   	        	  fontFamily: "Microsoft YaHei",
	   	        	  color: '#000033'
	   	          },
	   	          axisPointer : {            // 坐标轴指示器，坐标轴触发有效
	   	              type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow' 
	   	          }
	   	      },
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','red'], //图例颜色
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  itemGap: 25,
				  borderRadius:0,
	   	    	  data:[{
	                  name:'1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'IP',
	                  icon : 'line',
	                  textStyle:{ }
	              }]
	   	      },
	   	      grid: {
	   	    	  y:'5%',
	   	    	  height:'75%',
	   	          left: '3%',
	   	          right: '4%',
	   	          bottom: '3%',
	   	          containLabel: true
	   	      },
	   	      xAxis : [
	   	          {
	   	              type : 'category',
	   	              splitLine:{      //网格线
	   	            	  show: true
	   	              },
		   	          axisLabel: {
		   	              interval: 2
		   	          },
	   	              data : d1
	   	          }
	   	      ],
	   	      yAxis : [
	   	          {
	   	              type : 'value',
	   	              splitLine:{      //网格线
	   	            	  show: false
	   	              }
	   	          }
	   	      ],
	   	      series : [
	   	          {
	   	              name:'1~2次',
	   	              type:'bar',
	   	        	  stack: '鼠标移动',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'3~5次',
	   	              type:'bar',
	   	         	  stack: '鼠标移动',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'6~10次',
	   	              type:'bar',
	   	         	  stack: '鼠标移动',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'10+次',
	   	              type:'bar',
	   	         	  stack: '鼠标移动',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'IP',
	   	              type:'line',
	   	         	  stack: 'ip',
	   	              data:d6
	   	          }
	   	      ]
	   	  });
      }
		
	 function chart_1(divid,json) {
		 var e  = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
				dataProvider: e,
				addClassNames: !0,
				startDuration: 1,
				color: "#6c7b88",
				marginLeft: 0,
				legend: {
						bulletType: "round",
						equalWidths: !1,
						valueWidth: 120,
						useGraphSettings: !0,
						color: "#6c7b88"
					},
				dataProvider: json,
				valueAxes: [{
					id: "a1",
					gridAlpha: 0,
					axisAlpha: 0,
				}],
				graphs: [{
						id: "g1",
						valueField: "olduser",
						title: "老用户(个)",
						type: "column",
						fillAlphas: .7,
						valueAxis: "a1",
						balloonText: "老用户：[[value]] ",
						legendValueText: "[[value]] ",
						legendPeriodValueText: "总计: [[value.sum]] ",
						lineColor: "#08a3cc",
						alphaField: "alpha",
						colorField: "color",
						lineAlpha: 0,
					 },{
		                id: "g2",
		                valueField: "oldip",
		                classNameField: "bulletClass",
		                title: "老IP数(个)",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "#e26a6a",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计: [[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "red",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "老IP数 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "loginip",
		                classNameField: "bulletClass",
		                title: "用户登录数(个)",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "blue",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计: [[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "blue",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "用户登录数 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                id: "g4",
		                valueField: "targetpageip",
		                classNameField: "bulletClass",
		                title: "进入目标页(个)",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "green",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计: [[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "green",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "进入目标页 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            }
					 
					 ],
				chartCursor: {
						zoomable: !1,
						categoryBalloonDateFormat: "HH:mm:ss",
						cursorAlpha: 0,
						categoryBalloonColor: "#e26a6a",
						categoryBalloonAlpha: .8,
						valueBalloonsEnabled: !1
				},
				categoryField: "date",
				
				exportConfig: {
					menuBottom: "20px",
					menuRight: "22px",
					menuItems: [{
						icon: App.getGlobalPluginsPath() + "amcharts/amcharts/images/export.png",
						format: "png"
					}]
				}
			});
		}
	 function chart_6(divid,json) {
		 var e = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
				dataProvider: e,
				addClassNames: !0,
				startDuration: 1,
				color: "#6c7b88",
				marginLeft: 0,
				legend: {
						bulletType: "round",
						equalWidths: !1,
						valueWidth: 120,
						useGraphSettings: !0,
						color: "#6c7b88"
					},
				dataProvider: json,
				valueAxes: [{
					id: "a1",
					gridAlpha: 0,
					axisAlpha: 0,
				}],
				graphs: [{
					id: "g1",
					valueField: "pv",
					title: "PV",
					type: "column",
					fillAlphas: .7,
					valueAxis: "a1",
					balloonText: "PV：[[value]] ",
					legendValueText: "[[value]] ",
					legendPeriodValueText: "总计: [[value.sum]] ",
					lineColor: "#08a3cc",
					alphaField: "alpha",
					colorField: "color",
					lineAlpha: 0,
					 },{
		                valueField: "ip",
		                classNameField: "bulletClass",
		                title: "IP",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "red",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计: [[value.sum]] ",
		                labelPosition: "right",
		                balloonText: "IP:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "uv",
		                classNameField: "bulletClass",
		                title: "UV",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "blue",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计: [[value.sum]] ",
		                labelPosition: "right",
		                balloonText: "UV:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            }
					 ],
				chartCursor: {
						zoomable: !1,
						categoryBalloonDateFormat: "HH:mm:ss",
						cursorAlpha: 0,
						categoryBalloonColor: "#e26a6a",
						categoryBalloonAlpha: .8,
						valueBalloonsEnabled: !1
				},
				categoryField: "date",
				
			});
		}
//获取某个日期的前一天的日期 yyyy-MM-dd
 function getPreDay(s){

     var y = parseInt(s.substr(0,4), 10);

     var m = parseInt(s.substr(5,2), 10)-1;

     var d = parseInt(s.substr(8,2), 10);

     var dt = new Date(y, m, d-1);

     y = dt.getFullYear();

     m = dt.getMonth()+1;

     d = dt.getDate();

     m = m<10?m:"-"+m;

     d = d<10?d:"-"+d;

     return y + "" + m + "" + d;

 }
</script>

<!-- END PAGE SCRIPTS -->
