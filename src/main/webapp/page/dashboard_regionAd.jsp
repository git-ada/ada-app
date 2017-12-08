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

<div class="portlet light portlet-fit bordered">
	<div class="portlet-title" style="padding-bottom: 0;margin-bottom: 0;padding-top: 5px;padding-right: 5px;">
		<div class="caption" style="padding-bottom: 0px;">
            <i class="icon-directions font-green hide"></i>
            <span class="caption-subject bold font-dark  ">地域统计（广告入口） </span>
            <span class="caption-helper" id="lasttime">${domain}</span>
        </div>
        <div class="inputs">
            <!-- <div class="input-icon right" style="float: left;margin-right: 10px;">
                   <i class="icon-magnifier"></i>
            	<input type="text" class="form-control form-control-solid input-circle" placeholder="搜索...">
            </div> -->
            
            <div class="actions" style="float: left;">
				<a class="btn btn-circle btn-icon-only btn-default pause" onclick="gotoHistoryPage(-1)" ><i class="icon-action-undo"></i></a>
				<!-- 
				<a class="btn btn-circle btn-icon-only btn-default" href="javascript:;"><i class="icon-control-pause"></i></a>  icon-control-pause
				 -->
				<a class="btn btn-circle btn-icon-only btn-default fullscreen"  id="fullscreenOractual"><i class="icon-size-fullscreen"></i></a>
			</div>
        </div>
		
	</div>
	
	<!-- 渠道和域名数据列表                           ---------------------------------------------------------------- -->
	<div class="portlet-body" style="margin: 0px;padding: 0;">
		<table id="dashboard_regionAd" class="table table-striped table-bordered table-hover order-column" style="border: 0">
	            <thead>
	                <tr>
						<th scope="col" style="min-width: 120px;">地域</th>
						<th scope="col" style="min-width: 80px">IP</th>			
						<th scope="col" style="min-width: 80px">PV</th>
						<th scope="col" style="min-width: 80px">UV</th>
						<th scope="col" style="min-width: 80px">老IP数</th>
						<th scope="col" style="min-width: 80px">用户登录数</th>
						<th scope="col" style="min-width: 80px">老用户数</th>	
						<th scope="col" style="min-width: 80px">1-2次点击</th>			
						<th scope="col" style="min-width: 80px">3-5次点击</th>			
						<th scope="col" style="min-width: 80px">6-10次点击</th>			
						<th scope="col" style="min-width: 80px">10+次点击</th>			
						<th scope="col" style="min-width: 80px">进入目标页</th>
						<th scope="col" style="min-width: 80px">5-30秒停留</th>
						<th scope="col" style="min-width: 80px">31-120秒</th>
						<th scope="col" style="min-width: 80px">121-300秒</th>
						<th scope="col" style="min-width: 80px">300+秒停留</th>
						<th scope="col" style="min-width: 80px">1-2次滚动</th>
						<th scope="col" style="min-width: 80px">3-5次滚动</th>
						<th scope="col" style="min-width: 80px">6-10次滚动</th>
						<th scope="col" style="min-width: 80px">10+次滚动</th>
						<th scope="col" style="min-width: 80px">1-2次移动</th>
						<th scope="col" style="min-width: 80px">3-5次移动</th>
						<th scope="col" style="min-width: 80px">6-10次移动</th>
						<th scope="col" style="min-width: 80px">10+次移动</th>
				     </tr>
	            </thead>
	            <tbody id="dashboard_regionAd_tbody">
	                	<c:forEach var="item" items="${regionAd_list}" varStatus="number">
	                <tr>
	                	<td style="min-width: 120px">${item.regionName}</td>
						<td style="min-width: 80px">${item.ip}</td>
						<td style="min-width: 80px">${item.pv}</td>
						<td style="min-width: 80px">${item.uv}</td>
						<td style="min-width: 80px">${item.oldip} (${item.oldi}%)</td>
						<td style="min-width: 80px">${item.loginip} (${item.log}%)</td>
						<td style="min-width: 80px">${item.olduserip} (${item.old}%)</td>
						<td style="min-width: 80px">${item.clickip1} (${item.c1}%)</td>
						<td style="min-width: 80px">${item.clickip2} (${item.c2}%)</td>
						<td style="min-width: 80px">${item.clickip3} (${item.c3}%)</td>
						<td style="min-width: 80px">${item.clickip4} (${item.c4}%)</td>
						<td style="min-width: 80px">${item.targetpageip} (${item.tgp}%)</td>
						<td style="min-width: 80px">${item.staytimeip1} (${item.s1}%)</td>
						<td style="min-width: 80px">${item.staytimeip2} (${item.s2}%)</td>
						<td style="min-width: 80px">${item.staytimeip3} (${item.s3}%)</td>
						<td style="min-width: 80px">${item.staytimeip4} (${item.s4}%)</td>
						<td style="min-width: 80px">${item.scrollip1} (${item.sc1}%)</td>
						<td style="min-width: 80px">${item.scrollip2} (${item.sc2}%)</td>
						<td style="min-width: 80px">${item.scrollip3} (${item.sc3}%)</td>
						<td style="min-width: 80px">${item.scrollip4} (${item.sc4}%)</td>
						<td style="min-width: 80px">${item.moveip1} (${item.m1}%)</td>
						<td style="min-width: 80px">${item.moveip2} (${item.m2}%)</td>
						<td style="min-width: 80px">${item.moveip3} (${item.m3}%)</td>
						<td style="min-width: 80px">${item.moveip4} (${item.m4}%)</td>
	                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	</div>
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
var t;
var oTable;
var oTable2;
var table;
var initTable1 = function () {
     table = $('#dashboard_regionAd');
     oTable = table.dataTable({
        "language": {
            "aria": {
                "sortAscending": ": activate to sort column ascending",
                "sortDescending": ": activate to sort column descending"
            },
            "emptyTable": "暂无数据",
            "info": "",
            "infoEmpty": "",
            "infoFiltered": "(filtered1 from _MAX_ total entries)",
            "lengthMenu": "_MENU_ entries",
            "search": "Search:",
            "zeroRecords": "No matching records found"
        },
        buttons: [
        ],
        scrollY:        document.documentElement.clientHeight-175,
        deferRender:    true,
        "ordering": false,
        scroller:       true,
        scrollX:        true,
        "info": false,
        stateSave:      true,
        "searching": false,
        fixedColumns:   {
            leftColumns: 3
        },
        "order": [
            [0, 'asc']
        ],
        "lengthMenu": [
            [10, 15, 20, -1],
            [10, 15, 20, "All"] // change per page values here
        ],
        "pageLength": 10,
        "dom": "<'row' <'col-md-12'B>><'row'<'col-md-6 col-sm-12'l><'col-md-6 col-sm-12'f>r><'table-scrollable't><'row'<'col-md-5 col-sm-12'i><'col-md-7 col-sm-12'p>>", // horizobtal scrollable datatable
    });
}

	jQuery(document).ready(function() {
	    initTable1();
	     jQuery("#pauseOrplay").click(function(){
	    	 if(jQuery("#pauseOrplay i").attr("class")=="icon-control-pause"){
	    		 jQuery("#pauseOrplay i").removeClass("icon-control-pause");
	    		 jQuery("#pauseOrplay i").addClass("icon-control-play");
	    		 clearTimeout(t);
	    	 }else if(jQuery("#pauseOrplay i").attr("class")=="icon-control-play"){
	    		 jQuery("#pauseOrplay i").removeClass("icon-control-play");
	    		 jQuery("#pauseOrplay i").addClass("icon-control-pause");
				 ajaxRefreshPage();
	    	 }
	     });
	    
	    jQuery("#fullscreenOractual").click(function(){
	    	 if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-fullscreen"){
	    		 
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-95);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-55);
	    		 
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-111);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-111);
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-fullscreen");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-actual");
	    		 
	    		   
	    	 }else if(jQuery("#fullscreenOractual i").attr("class")=="icon-size-actual"){
	    		 jQuery(".dataTables_scrollBody").css("height",document.documentElement.clientHeight-190);
	    		 jQuery(".DTFC_ScrollWrapper").css("height",document.documentElement.clientHeight-135);
	    		
	    		 jQuery(".DTFC_LeftBodyWrapper").css("height",document.documentElement.clientHeight-190);
	    		 jQuery(".DTFC_LeftBodyLiner").css("height",document.documentElement.clientHeight-190);
	    		 
	    		 jQuery("#fullscreenOractual i").removeClass("icon-size-actual");
	    		 jQuery("#fullscreenOractual i").addClass("icon-size-fullscreen");
	    		 
	    	 }
	     });  
	});
	
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
	 
	 var ajaxTime = 2000;
	 
	// t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
	  
	 function ajaxRefreshPage_Ad(){
		 jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajaxRefreshPage.do",
				success : function(data) {
					if (data!=null) {
						var json = eval('(' + data + ')');
						$("#ip").html(json.siteStat.ip);
						$("#pv").html(json.siteStat.pv);
						$("#cip").html(json.channelSumIP);
						$("#cpv").html(json.channelSumPV);
						
						/** 渠道数据列表 **/
						var list = json.ChannelStat_list;
						var open = "";
						var lefttale = "";
						
						/** 域名数据列表 **/
						var domainList = json.DomainStat_list;
						var domain = "";
						for(var i=0;i<domainList.length;i++){
							var tr = "";
						    var tr2 = "";
						  	if(domainList[i].channelNum>0){
						  		tr+="<tr>" + 
							      "<td  title='"+domainList[i].domain+"'><a href='javascript:void(0);' onclick='gotoPage(\"${pageContext.request.contextPath}/dashboard_channelList.jhtm?domainId="+domainList[i].id+"&domain="+domainList[i].domain+"\")'>"+domainList[i].subDomain+"</a></td>"+
								  "<td >"+domainList[i].ip+"</td>"+
								  "<td >"+domainList[i].pv+"</td>"+
								  "<td >"+domainList[i].uv+"</td>"+
								  "<td >"+domainList[i].oldip+" ("+domainList[i].oldi+"%)</td>"+
								  "<td >"+domainList[i].loginip+" ("+domainList[i].log+"%)</td>"+
								  "<td >"+domainList[i].olduserip+" ("+domainList[i].old+"%)</td>"+
								  "<td >"+domainList[i].clickip1+" ("+domainList[i].c1+"%)</td>"+
								  "<td >"+domainList[i].clickip2+" ("+domainList[i].c2+"%)</td>"+
								  "<td >"+domainList[i].clickip3+" ("+domainList[i].c3+"%)</td>"+
								  "<td >"+domainList[i].clickip4+" ("+domainList[i].c4+"%)</td>"+
								  "<td >"+domainList[i].targetpageip+" ("+domainList[i].tgp+"%)</td>"+
								  "<td >"+domainList[i].staytimeip1+" ("+domainList[i].s1+"%)</td>"+
								  "<td >"+domainList[i].staytimeip2+" ("+domainList[i].s2+"%)</td>"+
								  "<td >"+domainList[i].staytimeip3+" ("+domainList[i].s3+"%)</td>"+
								  "<td >"+domainList[i].staytimeip4+" ("+domainList[i].s4+"%)</td>"+
								  "<td >"+domainList[i].scrollip1+" ("+domainList[i].sc1+"%)</td>"+
								  "<td >"+domainList[i].scrollip2+" ("+domainList[i].sc2+"%)</td>"+
								  "<td >"+domainList[i].scrollip3+" ("+domainList[i].sc3+"%)</td>"+
								  "<td >"+domainList[i].scrollip4+" ("+domainList[i].sc4+"%)</td>"+
								  "<td >"+domainList[i].moveip1+" ("+domainList[i].m1+"%)</td>"+
								  "<td >"+domainList[i].moveip2+" ("+domainList[i].m2+"%)</td>"+
								  "<td >"+domainList[i].moveip3+" ("+domainList[i].m3+"%)</td>"+
								  "<td >"+domainList[i].moveip4+" ("+domainList[i].m4+"%)</td>"+
								  "</tr>";
								  open+=tr;
								  
						  		tr2+="<tr>"+
						          "<td  title='"+domainList[i].domain+"'><a style='text-decoration:underline;color: #333;' href='javascript:void(0);' onclick='gotoPage(\"${pageContext.request.contextPath}/dashboard_channelList.jhtm?domainId="+domainList[i].id+"&domain="+domainList[i].domain+"\")'>"+domainList[i].subDomain+"</a></td>"+
								  "<td style='min-width: 80px'>"+domainList[i].ip+"</td>"+
								  "<td style='min-width: 80px'>"+domainList[i].pv+"</td>"+
									"</tr>";
									lefttale+=tr2;
						  	}else{
						  		tr+="<tr>" + 
							      "<td  title='"+domainList[i].domain+"'>"+domainList[i].subDomain+"</td>"+
								  "<td >"+domainList[i].ip+"</td>"+
								  "<td >"+domainList[i].pv+"</td>"+
								  "<td >"+domainList[i].uv+"</td>"+
								  "<td >"+domainList[i].oldip+" ("+domainList[i].oldi+"%)</td>"+
								  "<td >"+domainList[i].loginip+" ("+domainList[i].log+"%)</td>"+
								  "<td >"+domainList[i].olduserip+" ("+domainList[i].old+"%)</td>"+
								  "<td >"+domainList[i].clickip1+" ("+domainList[i].c1+"%)</td>"+
								  "<td >"+domainList[i].clickip2+" ("+domainList[i].c2+"%)</td>"+
								  "<td >"+domainList[i].clickip3+" ("+domainList[i].c3+"%)</td>"+
								  "<td >"+domainList[i].clickip4+" ("+domainList[i].c4+"%)</td>"+
								  "<td >"+domainList[i].targetpageip+" ("+domainList[i].tgp+"%)</td>"+
								  "<td >"+domainList[i].staytimeip1+" ("+domainList[i].s1+"%)</td>"+
								  "<td >"+domainList[i].staytimeip2+" ("+domainList[i].s2+"%)</td>"+
								  "<td >"+domainList[i].staytimeip3+" ("+domainList[i].s3+"%)</td>"+
								  "<td >"+domainList[i].staytimeip4+" ("+domainList[i].s4+"%)</td>"+
								  "<td >"+domainList[i].scrollip1+" ("+domainList[i].sc1+"%)</td>"+
								  "<td >"+domainList[i].scrollip2+" ("+domainList[i].sc2+"%)</td>"+
								  "<td >"+domainList[i].scrollip3+" ("+domainList[i].sc3+"%)</td>"+
								  "<td >"+domainList[i].scrollip4+" ("+domainList[i].sc4+"%)</td>"+
								  "<td >"+domainList[i].moveip1+" ("+domainList[i].m1+"%)</td>"+
								  "<td >"+domainList[i].moveip2+" ("+domainList[i].m2+"%)</td>"+
								  "<td >"+domainList[i].moveip3+" ("+domainList[i].m3+"%)</td>"+
								  "<td >"+domainList[i].moveip4+" ("+domainList[i].m4+"%)</td>"+
								  
								  "</tr>";
								  open+=tr;
						  		tr2+="<tr>"+
						          "<td  title='"+domainList[i].domain+"'>"+domainList[i].subDomain+" </td>"+
								  "<td style='min-width: 80px'>"+domainList[i].ip+"</td>"+
								  "<td style='min-width: 80px'>"+domainList[i].pv+"</td>"+
									"</tr>";
									lefttale+=tr2;
						  	}
									
						}
						
						jQuery("#dashboard_regionAd_tbody").empty();
						jQuery("#dashboard_regionAd_tbody").append(open);
						jQuery(".DTFC_LeftBodyWrapper #dashboard_regionAd_tbody").empty();
						jQuery(".DTFC_LeftBodyWrapper #dashboard_regionAd_tbody").append(lefttale);
						jQuery("#lasttime").html("最后一次更新时间  "+json.lasttime);
						
						//DTFC_LeftBodyWrapper
						//initTable1();
						//jQuery("#domain").empty();
						//jQuery("#domain").append(domain);
					}
					clearTimeout(t);
					if(browsingHistory[browsingHistory.length-1].indexOf("/dashboard.jhtm")>=0){
						ajaxTime=2000;
						t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
					}
					
				},
				error: function (data) {
					clearTimeout(t);
					ajaxTime=ajaxTime*2;
					t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
				}
			});
	 }
	 
</script>

<!-- END PAGE SCRIPTS -->
