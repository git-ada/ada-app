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
 <!-- 第六个图表 基本数据 -->
 <div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">基本数据</span>
                  <span class="caption-helper">广告入口</span>
              </div>
               <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
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
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">基本数据</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
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
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">用户分析</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
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
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">用户分析</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_1" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- 第三个图表 -->
<div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">页面停留时长</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_3" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">页面停留时长</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_3" class="chart" style="height: 300px;"> </div>
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
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">鼠标点击</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_2" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">鼠标点击</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_2" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>

<!-- 第四个图表 -->
<div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">鼠标滚动</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_4" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">鼠标滚动</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_4" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- 第五个图表 -->
<div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">鼠标移动</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_5" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class="icon-bar-chart font-green-haze"></i>
                  <span class="caption-subject font-dark bold uppercase">鼠标移动</span>
                  <span class="caption-helper">非广告入口</span>
              </div>
              <div class="tools" style="margin-right: 15px;">
                   <a href="javascript:;" class="collapse"> </a>
                   <a href="javascript:;" class="fullscreen"> </a>
               </div>
          </div>
          <div class="portlet-body">
             <div id="notad_chart_5" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	
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
	 
	 function chart_1(divid,json) {
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
		                id: "g3",
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
			/* $("#chart_1").closest(".portlet").find(".fullscreen").click(function() {
				e.invalidateSize()
			}); */
		}
	 function chart_2(divid,json) {
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
		                id: "g3",
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
	 
	 function chart_3(divid,json) {
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
		                id: "g3",
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
		                id: "g3",
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
	  
	 function chart_5(divid,json) {
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
		                valueField: "m2",
		                classNameField: "bulletClass",
		                title: "3-5次",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "#e26a6a",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
		                legendPeriodValueText: "总计:[[value.sum]] ",
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
					valueField: "pv",
	                classNameField: "bulletClass",
	                title: "PV",
	                type: "line",
	                valueAxis: "a1",
	                lineColor: "#e26a6a",
	                lineThickness: 2,
	                legendValueText: "[[value]] ",
	                labelPosition: "right",
	                balloonText: "PV:[[value]]",
	                showBalloon: !0,
	                animationPlayed: !0
					 },{
		                valueField: "ip",
		                classNameField: "bulletClass",
		                title: "IP",
		                type: "line",
		                valueAxis: "a1",
		                lineColor: "green",
		                lineThickness: 2,
		                legendValueText: "[[value]] ",
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

		jQuery(document).ready(function() {
		    var chartdata = ${json};
		    chart_1("ad_chart_1",chartdata.ad_chart_1);
		    chart_1("notad_chart_1",chartdata.notad_chart_1);
		    chart_2("ad_chart_2",chartdata.ad_chart_2);
		    chart_2("notad_chart_2",chartdata.notad_chart_2);
		    chart_3("ad_chart_3",chartdata.ad_chart_3);
		    chart_3("notad_chart_3",chartdata.notad_chart_3);
		    chart_4("ad_chart_4",chartdata.ad_chart_4);
		    chart_4("notad_chart_4",chartdata.notad_chart_4);
		    chart_5("ad_chart_5",chartdata.ad_chart_5);
		    chart_5("notad_chart_5",chartdata.notad_chart_5);
		    chart_6("ad_chart_6",chartdata.ad_chart_6);
		    chart_6("notad_chart_6",chartdata.notad_chart_6);
		});
</script>

<!-- END PAGE SCRIPTS -->