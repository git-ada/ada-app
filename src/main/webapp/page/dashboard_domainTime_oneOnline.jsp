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
  <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <a style="color: #333;" onclick="gotoHistoryPage(-1)"> <i class="icon-action-undo"></i></a>
                  <span class="caption-subject font-dark bold uppercase">基本数据</span>
                  <span class="caption-helper"></span>
              </div>
             
               <div class="actions" style="margin-right: 15px;">
                   <a onclick="graphicLoading(1,this)" num="1" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a onclick="graphicLoading(-1,this)" num="1" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
               
                <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="1" id="date_chart1" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
          </div>
          <div class="portlet-body">
              <div id="chart_1" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
   <!-- 第二个图表 用户分析-->
   <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">用户分析</span>
                  <span class="caption-helper"></span>
              </div>
              
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="2" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="2" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
              
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="2" id="date_chart2" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
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
  <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">页面停留时长</span>
                  <span class="caption-helper"></span>
              </div>
              
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="3" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="3" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
              
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="3" id="date_chart3" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
          </div>
          <div class="portlet-body">
              <div id="chart_3" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <!-- 第四个图表
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">鼠标点击</span>
                  <span class="caption-helper"></span>
              </div>
              
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="4" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="4" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
              
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="4" id="date_chart4" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
          </div>
          <div class="portlet-body">
              <div id="chart_4" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
  </div>
</div>


<div class="row">
 第五个图表 
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">鼠标滚动</span>
                  <span class="caption-helper"></span>
              </div>
              
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="5" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="5" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
              
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="5" id="date_chart5" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
          </div>
          <div class="portlet-body">
              <div id="chart_5" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
  </div>
   第六个图表
 <div class="col-lg-6 col-xs-12 col-sm-12">
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <span class="caption-subject font-dark bold uppercase">鼠标移动</span>
                  <span class="caption-helper"></span>
              </div>
              
              <div class="actions" style="margin-right: 15px;">
                  <a onclick="graphicLoading(1,this)" num="6" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                  <a onclick="graphicLoading(-1,this)" num="6" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
              </div>
              
              <div class="mt-repeater-input actions" style="width: 100px;margin-right: 15px;margin-top: -4px;">
              	<input num="6" id="date_chart6" style="cursor: pointer;" class="input-group form-control form-control-inline date date-picker" size="16" type="text" value="${search_date}" name="date-input" data-date-format="yyyy-mm-dd" />
              </div> 
          </div>
          <div class="portlet-body">
              <div id="chart_6" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      
  </div>
  -->
</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/echarts.js" type="text/javascript" ></script>
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
        endDate : new Date(),
        autoclose: true
    });
    var chartdata = ${json};
    
	chart_1("chart_1",chartdata.chart_1);
	chart_2("chart_2",chartdata.chart_2);
	chart_3("chart_3",chartdata.chart_3);
	/**
	chart_4("chart_4",chartdata.chart_4);
	chart_5("chart_5",chartdata.chart_5);
	chart_6("chart_6",chartdata.chart_6);
	**/
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
			var   a=new   Date(Date.parse(search_date .replace(/-/g,"/")));
			var   curDate=new  Date();
			if(a>=curDate){
				App.stopPageLoading();//关闭 加载动画
				return ;
			}
			
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
		//console.log("sessionData--->"+sessionData);
		if(sessionData!=null && sessionData!=""){//判断本地是否存有数据 如果有 则直接使用
			//console.log("直接用session中的数据");
			refreshChart(JSON.parse(sessionData),num);
		}else{//没有则从数据库中 查询数据
			//console.log("异步加载数据 并预加载三天的数据");
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
			/* amchart_3.dataProvider = json.chart_3;
			amchart_3.write();
    		amchart_3.validateNow();
    		amchart_3.validateData(); */
			chart_3("chart_3",json.chart_3);
			
		}else if(num==4){
			jQuery("#date_chart4").val(json.search_date);
			jQuery("a[num=4][a-type=lastPage]").attr("page-data",json.lastPage);
			jQuery("a[num=4][a-type=nextPage]").attr("page-data",json.nextPage);
			/* amchart_4.dataProvider = json.chart_4;
			amchart_4.write();
    		amchart_4.validateNow();
    		amchart_4.validateData(); */
			chart_4("chart_4",json.chart_4);
			
		}else if(num==5){
			jQuery("#date_chart5").val(json.search_date);
			jQuery("a[num=5][a-type=lastPage]").attr("page-data",json.lastPage);
			jQuery("a[num=5][a-type=nextPage]").attr("page-data",json.nextPage);
			/* amchart_5.dataProvider = json.chart_5;
			amchart_5.write();
    		amchart_5.validateNow();
    		amchart_5.validateData(); */
			chart_5("chart_5",json.chart_5);
			
		}else if(num==6){
			jQuery("#date_chart6").val(json.search_date);
			jQuery("a[num=6][a-type=lastPage]").attr("page-data",json.lastPage);
			jQuery("a[num=6][a-type=nextPage]").attr("page-data",json.nextPage);
			/* amchart_6.dataProvider = json.chart_6;
    		amchart_6.write();
    		amchart_6.validateNow();
    		amchart_6.validateData(); */
			chart_6("chart_6",json.chart_6);
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
	 /** 页面停留时间 **/
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
	    /** 鼠标点击
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
	    鼠标滚动
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
	    鼠标移动 
	    function chart_6(divid,data){
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
	    **/
	 /* function chart_3(divid,json) {
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
		} */
//获取某个日期的前一天的日期 yyyy-MM-dd
 function getPreDay(s){

     var y = parseInt(s.substr(0,4), 10);

     var m = parseInt(s.substr(5,2), 10)-1;

     var d = parseInt(s.substr(8,2), 10);

     var dt = new Date(y, m, d-1);

     y = dt.getFullYear();

     m = dt.getMonth()+1;

     d = dt.getDate();

     m = m<10? "-0"+m : "-"+m;

     d = d<10? "-0"+d : "-"+d;

     return y + "" + m + "" + d;

 }
</script>

<!-- END PAGE SCRIPTS -->
