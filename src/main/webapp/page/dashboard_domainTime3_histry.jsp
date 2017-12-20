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
  <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <a href="javascript:gotoPage('${pageContext.request.contextPath}/dashboardHistry.jhtm?dataType=${dataType}');"> <i class="icon-action-undo"></i></a>
                  <i class=" icon-info font-green"></i>
                  <span class="caption-subject font-green bold uppercase">IP&PV&UV</span>
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
</div>  
 <!-- 第一个图表 用户分析-->
<div class="row">
  <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class=" icon-users font-green"></i>
                  <span class="caption-subject font-green bold uppercase">登录用户&目标页</span>
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
</div>
<div class="row">
  <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
                  <i class=" icon-users font-green"></i>
                  <span class="caption-subject font-green bold uppercase">老用户&老ip</span>
              </div>
              <div class="actions" style="margin-right: 15px;">
                   <a href="javascript:graphicLoading(1);" a-type="lastPage" page-data="" class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-rewind"></i></a>
                   <a href="javascript:graphicLoading(-1);" a-type="nextPage" page-data=""  class="btn btn-circle btn-icon-only btn-default"> <i class="icon-control-forward"></i></a>
               </div>
          </div>
          <div class="portlet-body">
              <div id="ad_chart_1-2" class="chart" style="height: 300px;"> </div>
          </div>
      </div>
      <!-- END PORTLET-->
  </div>
</div>
<!-- 第三个图表 -->
<div class="row">
  <div class="col-lg-12 col-xs-12 col-sm-12">
      <!-- BEGIN PORTLET-->
      <div class="portlet light bordered">
          <div class="portlet-title">
              <div class="caption" style="margin-left: 15px;">
              	  <i class=" icon-clock font-green"></i>
                  <span class="caption-subject font-green bold uppercase">页面停留时长</span>
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
</div>
<!-- 第三个图表-->
 <div class="row">
   <div class="col-lg-12 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-layers font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标点击</span>
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
</div>
<!-- 第四个图表-->
 <div class="row">
   <div class="col-lg-12 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-refresh font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标滚动</span>
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
</div>
<!-- 第五个图表-->
 <div class="row">
   <div class="col-lg-12 col-xs-12 col-sm-12">
       <div class="portlet light bordered">
           <div class="portlet-title">
               <div class="caption">
               	 <i class=" icon-cursor-move font-green"></i>
                   <span class="caption-subject font-green bold uppercase">鼠标移动</span>
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
</div>

<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/echarts.js" type="text/javascript" ></script>
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
	 function refre(){
	 	 refreshPage('${pageContext.request.contextPath}/dashboard_domainTime3_histry.jhtm?domainId=${domainId}');
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
				url : "${pageContext.request.contextPath}/ajaxdashboard_domainTime3.do?pageNo=" + pageNo+"&domainId="+${domainId},
				success : function(data) {
					var json = eval('(' + data + ')');
					if (json.success) {
						jQuery("a[a-type=lastPage]").attr("page-data",json.lastPage);
						jQuery("a[a-type=nextPage]").attr("page-data",json.nextPage);
						
					    chart_1("ad_chart_1",json.ad_chart_1,json.notad_chart_1);//用户分析1
					    chart_7("ad_chart_1-2",json.ad_chart_1,json.notad_chart_1);//用户分析2
					    chart_6("ad_chart_6",json.ad_chart_6,json.notad_chart_6);//基本信息
					    
					    chart_2("ada_ad-chart_2",json.ad_chart_3,json.notad_chart_3);//stayeTime
					    chart_3("ada_ad-chart_3",json.ad_chart_2,json.notad_chart_2);//click
					    chart_4("ada_ad-chart_4",json.ad_chart_4,json.notad_chart_4);//soroll
					    chart_5("ada_ad-chart_5",json.ad_chart_5,json.notad_chart_5);//move
					} else {
						toastr.success(json.message);
					}
				}
			});
		}
	} 
	
	/**以下为 echarts 做法 line:352~827**/
	/** 页面停留时间 **/
    function chart_2(divid,data1,data2){
    	//X轴数据
    	/***************广告***************/
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	//Y轴ip
    	var d6 = [];
    	/****************非广告**************/
    	var d7 = [];
    	//Y轴2区间数据
    	var d8 = [];
    	//Y轴3区间数据
    	var d9 = [];
    	//Y轴4区间数据
    	var d10 = [];
    	//Y轴ip
    	var d11 = [];
    	//Y轴ip
    	var d12 = [];
    	var d13 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.st1);
            d3.push(item.st2);
            d4.push(item.st3);
            d5.push(item.st4);
            d6.push(item.ip);
            d7.push(item.adstTotal);
        });
    	//alert("d7: -->"+d7);
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            //d1.push(item.date);
            d8.push(item.st1);
            d9.push(item.st2);
            d10.push(item.st3);
            d11.push(item.st4);
            d12.push(item.ip + d6[index]);
            d13.push(item.notAdstTotal + d7[index]);
        });
    	//alert("d13: -->"+d13);
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
	   	          axisPointer : {          
	   	              type : 'shadow'      
	   	          }
	   	      },
	   	      //color:['#81d4e4','#57c5db','#2db7d2','#2492a8','red'], //图例颜色 
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','#ff6666','#ff3333','#ff0000','#e60000','red','blue'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',//图例x方向移动距离
	   	    	  y : '85%', //图例y方向移动距离
	   	    	  //默认横向布局，纵向布局值为'vertical'
	   	          //orient:'vertical',
	   	          itemWidth: 32,  // 图例高    
				  itemHeight: 16, // 图例宽    
				  //itemGap: 25,    // 每个图例间的间隔
				  itemBorderRadius:0,// 图例圆角
	   	          data:[{
	   	        	  //自定义图例
	                  name:'广告5~30秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告31~120秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告121~300秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告5分钟以上',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }/****************非广告**************/
	              },{
	                  name:'非广告5~30秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告31~120秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告121~300秒',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告5分钟以上',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总停留数',
	                  icon : 'line',
	                  textStyle:{}
	              },{
	                  name:'总IP数',
	                  icon : 'line',
	                  textStyle:{}
	              }],
	              selected: {
	                    '总IP数': false  
	                } 
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
		   	              interval: 1 //interval 指间隔少类别画栅格
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
	   	              name:'广告5~30秒',
	   	              type:'bar',
	   	        	  stack: '广告页面停留时长',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'广告31~120秒',
	   	              type:'bar',
	   	         	  stack: '广告页面停留时长',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'广告121~300秒',
	   	              type:'bar',
	   	         	  stack: '广告页面停留时长',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'广告5分钟以上',
	   	              type:'bar',
	   	         	  stack: '广告页面停留时长',
	   	              data:d5
	   	          },{
	   	              name:'非广告5~30秒',/****************非广告**************/
	   	              type:'bar',
	   	        	  stack: '非广告页面停留时长',
	   	              data:d8
	   	          },
	   	          {
	   	              name:'非广告31~120秒',
	   	              type:'bar',
	   	         	  stack: '非广告页面停留时长',
	   	              data:d9
	   	          },
	   	          {
	   	              name:'非广告121~300秒',
	   	              type:'bar',
	   	         	  stack: '非广告页面停留时长',
	   	              data:d10
	   	          },
	   	          {
	   	              name:'非广告5分钟以上',
	   	              type:'bar',
	   	         	  stack: '非广告页面停留时长',
	   	              data:d11
	   	          },
	   	          {
	   	              name:'总停留数',
	   	              type:'line',
	   	         	  stack: '总停留数',
	   	              data:d13
	   	          },
	   	          {
	   	              name:'总IP数',
	   	              type:'line',
	   	         	  stack: '总IP数',
	   	              data:d12
	   	          }
	   	      ]
	   	});
          
    }
	
	
    /** 鼠标点击 **/
    function chart_3(divid,data1,data2){
    	//X轴数据
    	/***************广告***************/
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	//Y轴ip
    	var d6 = [];
    	/****************非广告**************/
    	var d7 = [];
    	//Y轴2区间数据
    	var d8 = [];
    	//Y轴3区间数据
    	var d9 = [];
    	//Y轴4区间数据
    	var d10 = [];
    	//Y轴ip
    	var d11 = [];
    	//Y轴ip
    	var d12 = [];
    	var d13 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.c1);
            d3.push(item.c2);
            d4.push(item.c3);
            d5.push(item.c4);
            d6.push(item.ip);
            d7.push(item.adcTotal);
        });
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            //d1.push(item.date);
            d8.push(item.c1);
            d9.push(item.c2);
            d10.push(item.c3);
            d11.push(item.c4);
            d12.push(item.ip + d6[index]);
            d13.push(item.notAdcTotal + d7[index]);
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
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','#ff6666','#ff3333','#ff0000','#e60000','red','blue'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  borderRadius:0,
	   	          data:[{
	                  name:'广告1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总点击数',
	                  icon : 'line',
	                  textStyle:{}
	              },{
	                  name:'总IP数',
	                  icon : 'line',
	                  textStyle:{}
	              }],
	              selected: {
	                    '总IP数': false  
	                } 
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
		   	              interval: 1
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
	   	              name:'广告1~2次',
	   	              type:'bar',
	   	        	  stack: '广告鼠标点击',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'广告3~5次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标点击',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'广告6~10次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标点击',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'广告10+次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标点击',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'非广告1~2次',
	   	              type:'bar',
	   	        	  stack: '非广告鼠标点击',
	   	              data:d8
	   	          },
	   	          {
	   	              name:'非广告3~5次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标点击',
	   	              data:d9
	   	          },
	   	          {
	   	              name:'非广告6~10次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标点击',
	   	              data:d10
	   	          },
	   	          {
	   	              name:'非广告10+次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标点击',
	   	              data:d11
	   	          },
	   	          {
	   	              name:'总点击数',
	   	              type:'line',
	   	         	  stack: '总点击数',
	   	              data:d13
	   	          },
	   	          {
	   	              name:'总IP数',
	   	              type:'line',
	   	         	  stack: '总IP数',
	   	              data:d12
	   	          }
	   	          
	   	      ]
	   	});
	          
	}
    /** 鼠标滚动 **/
    function chart_4(divid,data1,data2){
    	//X轴数据
    	/***************广告***************/
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	//Y轴ip
    	var d6 = [];
    	/****************非广告**************/
    	var d7 = [];
    	//Y轴2区间数据
    	var d8 = [];
    	//Y轴3区间数据
    	var d9 = [];
    	//Y轴4区间数据
    	var d10 = [];
    	//Y轴ip
    	var d11 = [];
    	//Y轴ip
    	var d12 = [];
    	var d13 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.s1);
            d3.push(item.s2);
            d4.push(item.s3);
            d5.push(item.s4);
            d6.push(item.ip);
            d7.push(item.adsTotal);
        });
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            //d1.push(item.date);
            d8.push(item.s1);
            d9.push(item.s2);
            d10.push(item.s3);
            d11.push(item.s4);
            d12.push(item.ip + d6[index]);
            d13.push(item.notAdsTotal + d7[index]);
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
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','#ff6666','#ff3333','#ff0000','#e60000','red','blue'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  borderRadius:0,
	   	          data:[{
	                  name:'广告1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总滚动数',
	                  icon : 'line',
	                  textStyle:{}
	              },{
	                  name:'总IP数',
	                  icon : 'line',
	                  textStyle:{}
	              }],
	              selected: {
	                    '总IP数': false  
	                } 
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
		   	              interval: 1
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
	   	              name:'广告1~2次',
	   	              type:'bar',
	   	        	  stack: '广告鼠标滚动',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'广告3~5次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标滚动',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'广告6~10次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标滚动',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'广告10+次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标滚动',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'非广告1~2次',
	   	              type:'bar',
	   	        	  stack: '非广告鼠标滚动',
	   	              data:d8
	   	          },
	   	          {
	   	              name:'非广告3~5次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标滚动',
	   	              data:d9
	   	          },
	   	          {
	   	              name:'非广告6~10次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标滚动',
	   	              data:d10
	   	          },
	   	          {
	   	              name:'非广告10+次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标滚动',
	   	              data:d11
	   	          },
	   	          {
	   	              name:'总滚动数',
	   	              type:'line',
	   	         	  stack: '总滚动数',
	   	              data:d13
	   	          },
	   	          {
	   	              name:'总IP数',
	   	              type:'line',
	   	         	  stack: '总IP数',
	   	              data:d12
	   	          }
	   	      ]
	   	});
	          
	}
    /** 鼠标移动 **/
    function chart_5(divid,data1,data2){
    	//X轴数据
    	/***************广告***************/
    	var d1 = [];
    	//Y轴1区间数据
    	var d2 = [];
    	//Y轴2区间数据
    	var d3 = [];
    	//Y轴3区间数据
    	var d4 = [];
    	//Y轴4区间数据
    	var d5 = [];
    	//Y轴ip
    	var d6 = [];
    	/****************非广告**************/
    	var d7 = [];
    	//Y轴2区间数据
    	var d8 = [];
    	//Y轴3区间数据
    	var d9 = [];
    	//Y轴4区间数据
    	var d10 = [];
    	//Y轴ip
    	var d11 = [];
    	//Y轴ip
    	var d12 = [];
    	var d13 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.m1);
            d3.push(item.m2);
            d4.push(item.m3);
            d5.push(item.m4);
            d6.push(item.ip);
            d7.push(item.admTotal);
        });
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            d8.push(item.m1);
            d9.push(item.m2);
            d10.push(item.m3);
            d11.push(item.m4);
            d12.push(item.ip + d6[index]);
            d13.push(item.notAdmTotal + d7[index]);
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
	   	      color:['#81d4e4','#57c5db','#2db7d2','#2492a8','#ff6666','#ff3333','#ff0000','#e60000','red','blue'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  borderRadius:0,
	   	    	  data:[{
	                  name:'广告1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告1~2次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告3~5次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告6~10次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告10+次',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总移动数',
	                  icon : 'line',
	                  textStyle:{}
	              },{
	                  name:'总IP数',
	                  icon : 'line',
	                  textStyle:{}
	              }],
	              selected: {
	                    '总IP数': false  
	                } 
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
		   	              interval: 1
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
	   	              name:'广告1~2次',
	   	              type:'bar',
	   	        	  stack: '广告鼠标移动',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'广告3~5次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标移动',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'广告6~10次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标移动',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'广告10+次',
	   	              type:'bar',
	   	         	  stack: '广告鼠标移动',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'非广告1~2次',
	   	              type:'bar',
	   	        	  stack: '非广告鼠标移动',
	   	              data:d8
	   	          },
	   	          {
	   	              name:'非广告3~5次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标移动',
	   	              data:d9
	   	          },
	   	          {
	   	              name:'非广告6~10次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标移动',
	   	              data:d10
	   	          },
	   	          {
	   	              name:'非广告10+次',
	   	              type:'bar',
	   	         	  stack: '非广告鼠标移动',
	   	              data:d11
	   	          },
	   	          {
	   	              name:'总移动数',
	   	              type:'line',
	   	         	  stack: '总移动数',
	   	              data:d13
	   	          },
	   	          {
	   	              name:'总IP数',
	   	              type:'line',
	   	         	  stack: '总IP数',
	   	              data:d12
	   	          }
	   	      ]
	   	  });
     }
     
    function chart_6(divid,data1,data2){
    	var d1 = [];
    	var d2 = [];
    	var d3 = [];
    	var d4 = [];
    	var d5 = [];
    	var d6 = [];
    	var d7 = [];
    	var d8 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.ip);
            d3.push(item.pv);
            d4.push(item.uv);
        });
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            d5.push(item.ip);
            d6.push(item.pv);
            d7.push(item.uv);
            d8.push(item.pv + d3[index]);
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
	   	      color:['#2492a8','#e60000','#2db6d2','#ff3333','red','blue','green'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  borderRadius:0,
	   	    	  data:[{
	                  name:'广告ip',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告ip',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告uv',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告uv',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总pv',
	                  icon : 'line',
	                  textStyle:{}
	              },{
	                  name:'广告pv',
	                  icon : 'line',
	                  textStyle:{}
	              },{
	                  name:'非广告pv',
	                  icon : 'line',
	                  textStyle:{}
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
		   	              interval: 1
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
	   	              name:'广告ip',
	   	              type:'bar',
	   	        	  stack: 'ip',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'非广告ip',
	   	              type:'bar',
	   	         	  stack: 'ip',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'广告uv',
	   	              type:'bar',
	   	         	  stack: 'uv',
	   	              data:d4
	   	          },
	   	          {
	   	              name:'非广告uv',
	   	              type:'bar',
	   	         	  stack: 'uv',
	   	              data:d7
	   	          },
	   	          {
	   	              name:'总pv',
	   	              type:'line',
	   	         	  stack: '广告总pv',
	   	              data:d8
	   	          },
	   	          {
	   	              name:'广告pv',
	   	              type:'line',
	   	         	  stack: '广告pv',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'非广告pv',
	   	              type:'line',
	   	         	  stack: '非广告pv',
	   	              data:d6
	   	          }
	   	      ]
	   	  });
     }
    
    function chart_1(divid,data1,data2){
    	var d1 = [];
    	var d2 = [];
    	var d3 = [];
    	var d4 = [];
    	var d5 = [];
    	var d6 = [];
    	var d7 = [];
    	var d8 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.loginip);
            d3.push(item.targetpageip);
            d4.push(item.ip);
        });
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            d5.push(item.loginip);
            d6.push(item.targetpageip);
            d7.push(item.ip);
            d8.push(item.ip + d4[index]);
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
	   	      color:['#2492a8','#e60000','#2db6d2','#ff3333','red'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  borderRadius:0,
	   	    	  data:[{
	                  name:'广告登录用户数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告登录用户数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告目标页数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告目标页数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总IP数',
	                  icon : 'line',
	                  textStyle:{ borderRadius:0 }
	              }],
	              selected: {
	                    '总IP数': false  
	                } 
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
		   	              interval: 1
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
	   	              name:'广告登录用户数',
	   	              type:'bar',
	   	        	  stack: '登录用户数',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'非广告登录用户数',
	   	              type:'bar',
	   	         	  stack: '登录用户数',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'广告目标页数',
	   	              type:'bar',
	   	         	  stack: '目标页数',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'非广告目标页数',
	   	              type:'bar',
	   	         	  stack: '目标页数',
	   	              data:d6
	   	          },
	   	          {
	   	              name:'总IP数',
	   	              type:'line',
	   	         	  stack: '总IP数',
	   	              data:d8
	   	          }
	   	      ]
	   	  });
     }
    
    function chart_7(divid,data1,data2){
    	var d1 = [];
    	var d2 = [];
    	var d3 = [];
    	var d4 = [];
    	var d5 = [];
    	var d6 = [];
    	var d7 = [];
    	var d8 = [];
    	$.each(data1, function (index, item) {
    		//将数据推到坐标轴展示
            d1.push(item.date);
            d2.push(item.olduser);
            d3.push(item.oldip);
            d4.push(item.ip);
        });
    	$.each(data2, function (index, item) {
    		//将数据推到坐标轴展示
            d5.push(item.olduser);
            d6.push(item.oldip);
            d7.push(item.ip);
            d8.push(item.ip + d4[index]);
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
	   	      //color:['#2db6d2','#2492a8','#ff0000','#e60000'], //图例颜色 
	   	      color:['#2492a8','#e60000','#2db6d2','#ff3333','red'], //图例颜色 
	   	      legend: {
	   	    	  x : '5.5%',
	   	    	  y : '85%',
	   	          itemWidth: 32,         
				  itemHeight: 16, 
				  borderRadius:0,
	   	    	  data:[{
	                  name:'广告老用户数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告老用户数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'广告老IP数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'非广告老IP数',
	                  icon : 'bar',
	                  textStyle:{ borderRadius:0 }
	              },{
	                  name:'总IP数',
	                  icon : 'line',
	                  textStyle:{ }
	              }],
	              selected: {
	                    '总IP数': false  
	                } 
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
		   	              interval: 1
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
	   	              name:'广告老用户数',
	   	              type:'bar',
	   	        	  stack: '老用户数',
	   	              data:d2
	   	          },
	   	          {
	   	              name:'非广告老用户数',
	   	              type:'bar',
	   	         	  stack: '老用户数',
	   	              data:d5
	   	          },
	   	          {
	   	              name:'广告老IP数',
	   	              type:'bar',
	   	         	  stack: '老IP数',
	   	              data:d3
	   	          },
	   	          {
	   	              name:'非广告老IP数',
	   	              type:'bar',
	   	         	  stack: '老IP数',
	   	              data:d6
	   	          },
	   	          {
	   	              name:'总IP数',
	   	              type:'line',
	   	         	  stack: '老IP数',
	   	              data:d8
	   	          }
	   	      ]
	   	  });
     }
     
	jQuery(document).ready(function() {
	    var chartdata = ${json};
	    chart_1("ad_chart_1",chartdata.ad_chart_1,chartdata.notad_chart_1);//用户分析1
	    chart_7("ad_chart_1-2",chartdata.ad_chart_1,chartdata.notad_chart_1);//用户分析2
	    chart_6("ad_chart_6",chartdata.ad_chart_6,chartdata.notad_chart_6);//基本信息
	    
	    chart_2("ada_ad-chart_2",chartdata.ad_chart_3,chartdata.notad_chart_3);//stayeTime
	    chart_3("ada_ad-chart_3",chartdata.ad_chart_2,chartdata.notad_chart_2);//click
	    chart_4("ada_ad-chart_4",chartdata.ad_chart_4,chartdata.notad_chart_4);//soroll
	    chart_5("ada_ad-chart_5",chartdata.ad_chart_5,chartdata.notad_chart_5);//move
	    
	    jQuery("a[a-type=lastPage]").attr("page-data",chartdata.lastPage);
	    jQuery("a[a-type=nextPage]").attr("page-data",chartdata.nextPage);
	});
</script>

<!-- END PAGE SCRIPTS -->
