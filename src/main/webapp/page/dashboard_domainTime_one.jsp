<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
.portlet.light > .portlet-title {
    min-height: 40px;
    padding: 0;
}
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
 

 <div class="row">
  <!-- 第一个图表 基本数据 -->
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <a style="color: #333;" onclick="gotoHistoryPage(-1)"> <i class="icon-action-undo"></i></a>
                  <span class="caption-subject font-dark bold uppercase">基本数据</span>
                  <span class="caption-helper"></span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="1" id="date_chart1" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
               <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="1" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="1" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="chart_1" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
   <!-- 第二个图表 用户分析-->
   <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">用户分析</span>
                  <span class="caption-helper"></span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="2" id="date_chart2" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="2" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="2" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
          </div>
          <div class="portlet-body">
              <div id="chart_2" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>



<div class="row">
<!-- 第三个图表 -->
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">页面停留时长</span>
                  <span class="caption-helper"></span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="3" id="date_chart3" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="3" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="3" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
          </div>
          <div class="portlet-body">
              <div id="chart_3" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <!-- 第四个图表 -->
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">鼠标点击</span>
                  <span class="caption-helper"></span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="4" id="date_chart4" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="4" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="4" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
          </div>
          <div class="portlet-body">
              <div id="chart_4" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>


<div class="row">
<!-- 第五个图表 -->
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">鼠标滚动</span>
                  <span class="caption-helper"></span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="5" id="date_chart5" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="5" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="5" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
          </div>
          <div class="portlet-body">
              <div id="chart_5" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <!-- 第六个图表 -->
 <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">鼠标移动</span>
                  <span class="caption-helper"></span>
              </div>
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="6" id="date_chart6" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="6" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="6" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
          </div>
          <div class="portlet-body">
              <div id="chart_6" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	
//window.setTimeout('refre()',300000); 
var dataType = '${dataType}';//页面数据类型
var amchart_1;
var amchart_2;
var amchart_3;
var amchart_4;
var amchart_5;
var amchart_6;
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
    
	chart_1("chart_1",chartdata.chart_1);
	chart_2("chart_2",chartdata.chart_2);
	chart_3("chart_3",chartdata.chart_3);
	chart_4("chart_4",chartdata.chart_4);
	chart_5("chart_5",chartdata.chart_5);
	chart_6("chart_6",chartdata.chart_6);
    jQuery("a[a-type=lastPage]").attr("page-data",chartdata.lastPage);
    jQuery("a[a-type=nextPage]").attr("page-data",chartdata.nextPage);
    
    jQuery("input[id^=date_chart]").change(function(){
    	isTodayAndHave(jQuery(this).val(),jQuery(this).attr("num"))
    });
    
    console.log("domainTime_one 初始化完成！");
});	
function graphicLoading(obj,a) {
		 App.startPageLoading({animate: !0});//开启 加载 动画
		var search_date = "";
		var num = jQuery(a).attr("num");
		if (obj == -1) { //表示前一段时间的数据
			search_date = jQuery(a).attr("page-data");
			
		} else if (obj == 1) { //表示后一段时间的数据
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
		var sessionData = sessionStorage.getItem(search_date);
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
function ajax_Refresh(search_date,num,isRefresh){
	jQuery.ajax({
		url : "${pageContext.request.contextPath}/ajaxdashboard_domainTime.do?pageNo=&domainId="+${domainId}+"&dataType="+dataType+"&search_date="+search_date,
		success : function(data) {
			var json = eval('(' + data + ')');
			if (json.success) {
				if(isRefresh==0){//不刷新chart 只缓存数据
					
				}else{
					refreshChart(json,num);
				}
				sessionStorage.setItem(search_date, JSON.stringify(json));//把数据存到session中
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

function refreshChart(json,num){
		if(num==1){
			jQuery("#date_chart1").val(json.search_date);
			jQuery("a[num=1][a-type=lastPage]").attr("page-data",json.lastPage);
			jQuery("a[num=1][a-type=nextPage]").attr("page-data",json.nextPage);
			amchart_1.dataProvider = json.chart_1;//设置数据
			amchart_1.write();
    		amchart_1.validateNow();
    		amchart_1.validateData();
		}else if(num==2){
			jQuery("#date_chart2").val(json.search_date);
			jQuery("a[num=2][a-type=lastPage]").attr("page-data",json.lastPage);
		jQuery("a[num=2][a-type=nextPage]").attr("page-data",json.nextPage);
			amchart_2.dataProvider = json.chart_2;
			amchart_2.write();
    	amchart_2.validateNow();
    	amchart_2.validateData();
		}else if(num==3){
			jQuery("#date_chart3").val(json.search_date);
			jQuery("a[num=3][a-type=lastPage]").attr("page-data",json.lastPage);
		jQuery("a[num=3][a-type=nextPage]").attr("page-data",json.nextPage);
			amchart_3.dataProvider = json.chart_3;
			amchart_3.write();
    	amchart_3.validateNow();
    	amchart_3.validateData();
		}else if(num==4){
			jQuery("#date_chart4").val(json.search_date);
			jQuery("a[num=4][a-type=lastPage]").attr("page-data",json.lastPage);
		jQuery("a[num=4][a-type=nextPage]").attr("page-data",json.nextPage);
			amchart_4.dataProvider = json.chart_4;
			amchart_4.write();
    	amchart_4.validateNow();
    	amchart_4.validateData();
		}else if(num==5){
			jQuery("#date_chart5").val(json.search_date);
			jQuery("a[num=5][a-type=lastPage]").attr("page-data",json.lastPage);
		jQuery("a[num=5][a-type=nextPage]").attr("page-data",json.nextPage);
			amchart_5.dataProvider = json.chart_5;
			amchart_5.write();
    	amchart_5.validateNow();
    	amchart_5.validateData();
		}else if(num==6){
			jQuery("#date_chart6").val(json.search_date);
			jQuery("a[num=6][a-type=lastPage]").attr("page-data",json.lastPage);
		jQuery("a[num=6][a-type=nextPage]").attr("page-data",json.nextPage);
			amchart_6.dataProvider = json.chart_6;
    	amchart_6.write();
    	amchart_6.validateNow();
    	amchart_6.validateData();
		}
		
		App.stopPageLoading();//关闭 加载动画
}
	 function chart_1(divid,json) {
			 amchart_1 =   AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
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
			            id: "g2",
		                valueField: "ip",
		                classNameField: "bulletClass",
		                title: "IP",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "red",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计: [[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "red",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
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
		                bullet: "round",
		                bulletBorderColor: "blue",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
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
	 
	 function chart_2(divid,json) {
			 amchart_2 = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
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
						title: "老用户",
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
		                title: "老IP数",
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
		                title: "登录用户",
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
		                balloonText: "登录用户 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                id: "g4",
		                valueField: "targetpageip",
		                classNameField: "bulletClass",
		                title: "目标页",
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
		                balloonText: "目标页 :[[value]]",
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
	 function chart_3(divid,json) {
			 amchart_3 = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
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
						valueField: "st1",
						title: "5-30秒",
						type: "column",
						fillAlphas: .7,
						valueAxis: "a1",
						balloonText: "5-30秒：[[value]] ",
						legendValueText: "[[value]] ",
						legendPeriodValueText: "总计: [[value.sum]] ",
						lineColor: "#08a3cc",
						alphaField: "alpha",
						colorField: "color",
						lineAlpha: 0,
					 },{
		                id: "g2",
		                valueField: "st2",
		                classNameField: "bulletClass",
		                title: "31-120秒",
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
		                balloonText: "31-120秒 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "st3",
		                classNameField: "bulletClass",
		                title: "121-300秒",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "blue",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "blue",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "121-300秒:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                id: "g4",
		                valueField: "st4",
		                classNameField: "bulletClass",
		                title: "300+秒",
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
		                balloonText: "300+秒:[[value]]",
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
	 
	 function chart_4(divid,json) {
			 amchart_4 = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
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
						valueField: "c1",
						title: "1-2次",
						type: "column",
						fillAlphas: .7,
						valueAxis: "a1",
						balloonText: "1-2次：[[value]] ",
						legendValueText: "[[value]] ",
						legendPeriodValueText: "总计: [[value.sum]] ",
						lineColor: "#08a3cc",
						alphaField: "alpha",
						colorField: "color",
						lineAlpha: 0,
					 },{
		                id: "g2",
		                valueField: "c2",
		                classNameField: "bulletClass",
		                title: "3-5次",
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
		                balloonText: "3-5次 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "c3",
		                classNameField: "bulletClass",
		                title: "6-10次",
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
		                balloonText: "6-10次 :[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                id: "g4",
		                valueField: "c4",
		                classNameField: "bulletClass",
		                title: "10+次",
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
		                balloonText: "10+次 :[[value]]",
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
	 
	 
	 
	 function chart_5(divid,json) {
			 amchart_5 = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
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
						valueField: "s1",
						title: "1-2次",
						type: "column",
						fillAlphas: .7,
						valueAxis: "a1",
						balloonText: "1-2次:[[value]] ",
						legendValueText: "[[value]] ",
						legendPeriodValueText: "总计:[[value.sum]] ",
						lineColor: "#08a3cc",
						alphaField: "alpha",
						colorField: "color",
						lineAlpha: 0,
					 },{
		                id: "g2",
		                valueField: "s2",
		                classNameField: "bulletClass",
		                title: "3-5次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "#e26a6a",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "red",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "3-5次:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "s3",
		                classNameField: "bulletClass",
		                title: "6-10次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "blue",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "blue",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "6-10次:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                id: "g4",
		                valueField: "s4",
		                classNameField: "bulletClass",
		                title: "10+次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "green",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "green",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "10+次:[[value]]",
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
			 amchart_6 = AmCharts.makeChart(divid, {
				type: "serial",
				fontSize: 12,
				fontFamily: "Microsoft YaHei",
				dataDateFormat: "HH:mm:ss",
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
						valueField: "m1",
						title: "1-2次",
						type: "column",
						fillAlphas: .7,
						valueAxis: "a1",
						balloonText: "1-2次:[[value]] ",
						legendValueText: "[[value]] ",
						legendPeriodValueText: "总计:[[value.sum]] ",
						lineColor: "#08a3cc",
						alphaField: "alpha",
						colorField: "color",
						lineAlpha: 0,
					 },{
						id: "g2",
		                valueField: "m2",
		                classNameField: "bulletClass",
		                title: "3-5次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "#e26a6a",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "red",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "3-5次:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "m3",
		                classNameField: "bulletClass",
		                title: "6-10次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "blue",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "blue",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "6-10次:[[value]]",
		                showBalloon: !0,
		                animationPlayed: !0
		            },{
		                valueField: "m4",
		                classNameField: "bulletClass",
		                title: "10+次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "green",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
		                bullet: "round",
		                bulletBorderColor: "green",
		                bulletBorderAlpha: 1,
		                bulletBorderThickness: 2,
		                bulletColor: "#fff",
		                labelPosition: "right",
		                balloonText: "10+次:[[value]]",
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
