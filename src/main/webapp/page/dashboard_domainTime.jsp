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
 
 <!-- 第六个图表 基本数据 -->
 <div class="row">
  <div class="col-lg-6 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <a href="javascript:gotoHistoryPage(-1);"> <i class="icon-action-undo"></i></a>
                  <i class=" icon-info font-green"></i>
                  <span class="caption-subject font-green bold uppercase">基本数据</span>
                          <!-- caption-subject font-dark bold uppercase -->
                  <span class="caption-helper">广告入口</span>
              </div>
               <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
             <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
              <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
              <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
              	  <i class=" icon-clock font-green"></i>
                  <span class="caption-subject font-green bold uppercase">页面停留时长</span>
                  <span class="caption-helper">广告入口</span>
              </div>
              <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
              <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
               <div class="actions" style="margin-right: 15px;">
                <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
               <div class="actions" style="margin-right: 15px;">
                <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
               <div class="actions" style="margin-right: 15px;">
                <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
               <div class="actions" style="margin-right: 15px;">
                <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
               <div class="actions" style="margin-right: 15px;">
                <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
               <div class="actions" style="margin-right: 15px;">
                <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
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
	 function refre(){
	 	 refreshPage('${pageContext.request.contextPath}/dashboard_domainTime.jhtm?domainId=${domainId}');
	 }
	 function graphicLoading(obj) {
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
				url : "${pageContext.request.contextPath}/ajaxdashboard_domainTime.do?pageNo=" + pageNo+"&domainId="+${domainId},
				success : function(data) {
					var json = eval('(' + data + ')');
					if (json.success) {
						jQuery("a[a-type=lastPage]").attr("page-data",json.lastPage);
						jQuery("a[a-type=nextPage]").attr("page-data",json.nextPage);
						
						chart_1("ad_chart_1",json.ad_chart_1);
					    chart_1("notad_chart_1",json.notad_chart_1);
					    chart_6("ad_chart_6",json.ad_chart_6);
					    chart_6("notad_chart_6",json.notad_chart_6);
					    
					    chart_2("ada_ad-chart_2",json.ad_chart_3);//stayeTime
					    chart_2("ada_notad-chart_2",json.notad_chart_3);
					    chart_3("ada_ad-chart_3",json.ad_chart_2);//click
					    chart_3("ada_notad-chart_3",json.notad_chart_2);
					    chart_4("ada_ad-chart_4",json.ad_chart_4);//soroll
					    chart_4("ada_notad-chart_4",json.notad_chart_4);
					    chart_5("ada_ad-chart_5",json.ad_chart_5);//move
					    chart_5("ada_notad-chart_5",json.notad_chart_5);
					} else {
						toastr.success(json.message);
					}
				}
			});
		}
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
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.st1);
            d3.push(item.st2);
            d4.push(item.st3);
            d5.push(item.st4);
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
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8'], //图例颜色 #48C0D8 #17C7E3 #ef3f3f
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
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.c1);
            d3.push(item.c2);
            d4.push(item.c3);
            d5.push(item.c4);
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
	   	      color:['#48C0D8','#6ccce0','#96dbe9','#F04848'], //图例颜色
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
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.s1);
            d3.push(item.s2);
            d4.push(item.s3);
            d5.push(item.s4);
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
	   	      color:['#48C0D8','#6ccce0','#96dbe9','#c0e9f2'], //图例颜色
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
    	$.each(data, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.m1);
            d3.push(item.m2);
            d4.push(item.m3);
            d5.push(item.m4);
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
	   	      color:['#48C0D8','#6ccce0','#96dbe9','#c0e9f2'], //图例颜色
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
	   	          }
	   	      ]
	   	  });
      }
    
     /**以下为 amcharts 做法, 但最终结果与 echarts 相同
	 function chart_2(divid,json) {
		 var e = AmCharts.makeChart(divid, {
			    "type": "serial",
				"theme": "none",
				"fontFamily": "Microsoft YaHei",
			    "legend": {
			        "horizontalGap": 5,
			        "maxColumns": 1,
			        "position": "right",
					"useGraphSettings": true,
					"equalWidths": false,
					"markerSize": 10
			    },
			    dataProvider: json,
			    "valueAxes": [{
			        "stackType": "regular",
			        "axisAlpha": 0.3,
			        "gridAlpha": 0
			    }],
			    "graphs": [{
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:12px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "5~30s",
			        "type": "column",
					"color": "#000000",
					"lineColor": "#08a3cc",
			        "valueField": "st1",
			        "sequencedAnimation": true, 
			        "balloonText": "5~30s :[[value]]"
			    }, {
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:12px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "31~120s",
			        "type": "column",
			        "lineColor": "#e26a6a",
					"color": "#000000",
			        "valueField": "st2",
			        "sequencedAnimation": true, 
			        "balloonText": "31~120s :[[value]]"
			    }, {
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:12px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "121~300s",
			        "type": "column",
			        "lineColor": "blue",
					"color": "#000000",
			        "valueField": "st3",
			        "sequencedAnimation": true, 
			        "balloonText": "121~300s :[[value]]"
			    }, {
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:12px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "300+s",
			        "type": "column",
			        "lineColor": "green",
					"color": "#000000",
			        "valueField": "st4",
			        "sequencedAnimation": true, 
			        "balloonText": "300+s :[[value]]"
			    }],
			    "categoryField": "date",
			    "categoryAxis": {
			        "gridPosition": "start",
			        "axisAlpha": 0,
			        "gridAlpha": 0,
			        //"axisColor": "blue",
			        "position": "left"
			    }
			});
	 }
	 
	 function chart_3(divid,json) {
		 var e = AmCharts.makeChart(divid, {
			    "type": "serial",
				"theme": "none",
				"fontFamily": "Microsoft YaHei",
			    "legend": {
			        "horizontalGap": 10,
			        "maxColumns": 1,
			        "position": "right",
					"useGraphSettings": true,
					"markerSize": 10
			    },
			    dataProvider: json,
			    "valueAxes": [{
			        "stackType": "regular",
			        "axisAlpha": 0.3,
			        "gridAlpha": 0
			    }],
			    "graphs": [{
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "1~2次",
			        "type": "column",
			        "lineColor": "#08a3cc",
					"color": "#000000",
			        "valueField": "c1",
			        "balloonText": "1~2次 :[[value]]"
			    }, {
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "3~5次",
			        "type": "column",
			        "lineColor": "#e26a6a",
					"color": "#000000",
			        "valueField": "c2",
			        "balloonText": "3~5次 :[[value]]"
			    }, {
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "6~10次",
			        "type": "column",
			        "lineColor": "blue",
					"color": "#000000",
			        "valueField": "c3",
			        "balloonText": "6~10次 :[[value]]"
			    }, {
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "10+次",
			        "type": "column",
			        "lineColor": "green",
					"color": "#000000",
			        "valueField": "c4",
			        "balloonText": "10+次 :[[value]]"
			    }],
			    "categoryField": "date",
			    "categoryAxis": {
			        "gridPosition": "start",
			        "axisAlpha": 0,
			        "gridAlpha": 0,
			        "position": "left"
			        
			    }
			});
	 }
	 
	 function chart_4(divid,json) {
		 var e = AmCharts.makeChart(divid, {
			    "type": "serial",
				"theme": "none",
				"fontFamily": "Microsoft YaHei",
			    "legend": {
			        "horizontalGap": 10,
			        "maxColumns": 1,
			        "position": "right",
					"useGraphSettings": true,
					"markerSize": 10
			    },
			    dataProvider: json,
			    "valueAxes": [{
			        "stackType": "regular",
			        "axisAlpha": 0.3,
			        "gridAlpha": 0
			    }],
			    "graphs": [{
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "1~2次",
			        "type": "column",
			        "lineColor": "#08a3cc",
					"color": "#000000",
			        "valueField": "s1",
			        "balloonText": "1~2次 :[[value]]"
			    }, {
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "3~5次",
			        "type": "column",
			        "lineColor": "#e26a6a",
					"color": "#000000",
			        "valueField": "s2",
			        "balloonText": "3~5次 :[[value]]"
			    }, {
			       // "balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "6~10次",
			        "type": "column",
			        "lineColor": "blue",
					"color": "#000000",
			        "valueField": "s3",
			        "balloonText": "6~10次 :[[value]]"
			    }, {
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "10+次",
			        "type": "column",
			        "lineColor": "green",
					"color": "#000000",
			        "valueField": "s4",
			        "balloonText": "10+次 :[[value]]"
			    }],
			    "categoryField": "date",
			    "categoryAxis": {
			        "gridPosition": "start",
			        "axisAlpha": 0,
			        "gridAlpha": 0,
			        "position": "left"
			    }
			});
	 }
	 
	 function chart_5(divid,json) {
		 var e = AmCharts.makeChart(divid, {
			    "type": "serial",
				"theme": "none",
				"fontFamily": "Microsoft YaHei",
			    "legend": {
			        "horizontalGap": 10,
			        "maxColumns": 1,
			        "position": "right",
					"useGraphSettings": true,
					"markerSize": 10
			    },
			    dataProvider: json,
			    "valueAxes": [{
			        "stackType": "regular",
			        "axisAlpha": 0.3,
			        "gridAlpha": 0
			    }],
			    "graphs": [{
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "1~2次",
			        "type": "column",
			        "lineColor": "#08a3cc",
					"color": "#000000",
			        "valueField": "m1",
			        "balloonText": "1~2次 :[[value]]"
			    }, {
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "3~5次",
			        "type": "column",
			        "lineColor": "#e26a6a",
					"color": "#000000",
			        "valueField": "m2",
			        "balloonText": "3~5次 :[[value]]"
			    }, {
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "6~10次",
			        "type": "column",
			        "lineColor": "blue",
					"color": "#000000",
			        "valueField": "m3",
			        "balloonText": "6~10次 :[[value]]"
			    }, {
			        //"balloonText": "<b>[[title]]</b><br><span style='font-size:14px'>[[category]]: <b>[[value]]</b></span>",
			        "fillAlphas": 0.8,
			        "labelText": "[[value]]",
			        "lineAlpha": 0.3,
			        "title": "10+次",
			        "type": "column",
			        "lineColor": "green",
					"color": "#000000",
			        "valueField": "m4",
			        "balloonText": "10+次 :[[value]]"
			    }],
			    "categoryField": "date",
			    "categoryAxis": {
			        "gridPosition": "start",
			        "axisAlpha": 0,
			        "gridAlpha": 0,
			        "position": "left"
			    }
			});
	 }
	 **/
		
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

		jQuery(document).ready(function() {
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
		    
		    
		    //chart2(chartdata.adstlist);
            //chart2(chartdata.notadstlist);
            /** 修改  chart3("ada_notad-chart_3",chartdata.adclist);
		    chart3("ada_notad-chart_3",chartdata.notadclist);
            **/
		    jQuery("a[a-type=lastPage]").attr("page-data",chartdata.lastPage);
		    jQuery("a[a-type=nextPage]").attr("page-data",chartdata.nextPage);
		});
</script>

<!-- END PAGE SCRIPTS -->
