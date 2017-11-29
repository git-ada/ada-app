
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

</style>
<div class="page-bar">
    <ul class="page-breadcrumb" style="width: 100%">
        <li>
            <i class="icon-home"></i>
            	首页
            <i class="fa fa-angle-right"></i>
        </li>
         <li>
            <span>实时数据</span>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
        	<span>${domain}</span>
        </li>
    </ul>
</div>



<!--数据列表-->

<!-- 渠道数据列表     -->
<div class="portlet-body " style="margin-top: 25px;">
	<table id="channelscrolltable" class="table table-striped table-bordered table-hover order-column">
            <thead>
                <tr>
					<th scope="col" style="min-width: 120px;">渠道匹配串</th>
					<th scope="col" style="min-width: 80px">IP</th>			
					<th scope="col" style="min-width: 80px">PV</th>
					<th scope="col" style="min-width: 80px">登录用户数</th>	
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
            <tbody id="tbody">
               <c:forEach var="item" items="${ChannelStat_list}" varStatus="number">
                <tr>
					<td style="">${item.channelStr}</td>
					<td style="">${item.ip}</td>
					<td style="">${item.pv}</td>
					<td style="">${item.olduserip} (${item.old}%)</td>
					<td style="">${item.clickip1} (${item.c1}%)</td>
					<td style="">${item.clickip2} (${item.c2}%)</td>
					<td style="">${item.clickip3} (${item.c3}%)</td>
					<td style="">${item.clickip4} (${item.c4}%)</td>
					<td style="">${item.targetpageip} (${item.tgp}%)</td>
					<td style="">${item.staytimeip1} (${item.s1}%)</td>
					<td style="">${item.staytimeip2} (${item.s2}%)</td>
					<td style="">${item.staytimeip3} (${item.s3}%)</td>
					<td style="">${item.staytimeip4} (${item.s4}%)</td>
					<td style="">${item.scrollip1} (${item.sc1}%)</td>
					<td style="">${item.scrollip2} (${item.sc2}%)</td>
					<td style="">${item.scrollip3} (${item.sc3}%)</td>
					<td style="">${item.scrollip4} (${item.sc4}%)</td>
					<td style="">${item.moveip1} (${item.m1}%)</td>
					<td style="">${item.moveip2} (${item.m2}%)</td>
					<td style="">${item.moveip3} (${item.m3}%)</td>
					<td style="">${item.moveip4} (${item.m4}%)</td>
					
                </tr>
                </c:forEach>
                
            </tbody>
        </table>
</div>
<!-- START PAGE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/graphic-data.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">

var initTable1 = function () {
    var table = $('#channelscrolltable');

    var oTable = table.dataTable({

        // Internationalisation. For more info refer to http://datatables.net/manual/i18n
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
        scrollY:        window.screen.height-350,
        deferRender:    true,
        "ordering": false,
        scroller:       true,
        scrollX:        true,
        
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
	});
	 
	 var ajaxTime = 2000;
	 
	 var t = window.setTimeout('ajaxRefreshPage()',ajaxTime); 
	  
	 function ajaxRefreshPage(){
		 jQuery.ajax({
				url : "${pageContext.request.contextPath}/ajax_channelList.do?domainId=${domainId}&domain=${domain}",
				success : function(data) {
					if (data!=null) {
						var json = eval('(' + data + ')');
						/** 渠道数据列表 **/
						var list = json.ChannelStat_list;
						var open = "";
						var lefttale = "";
						for(var i=0;i<list.length;i++){
							var tr = "";
							 tr+="<tr>" + 
							      "<td >"+list[i].channelStr+"</td>"+
								  "<td >"+list[i].ip+"</td>"+
								  "<td >"+list[i].pv+"</td>"+
								  "<td >"+list[i].olduserip+" ("+list[i].old+"%)</td>"+
								  "<td >"+list[i].clickip1+" ("+list[i].c1+"%)</td>"+
								  "<td >"+list[i].clickip2+" ("+list[i].c2+"%)</td>"+
								  "<td >"+list[i].clickip3+" ("+list[i].c3+"%)</td>"+
								  "<td >"+list[i].clickip4+" ("+list[i].c4+"%)</td>"+
								  "<td >"+list[i].targetpageip+" ("+list[i].tgp+"%)</td>"+
								  "<td >"+list[i].staytimeip1+" ("+list[i].s1+"%)</td>"+
								  "<td >"+list[i].staytimeip2+" ("+list[i].s2+"%)</td>"+
								  "<td >"+list[i].staytimeip3+" ("+list[i].s3+"%)</td>"+
								  "<td >"+list[i].staytimeip4+" ("+list[i].s4+"%)</td>"+
								  "<td >"+list[i].scrollip1+" ("+list[i].sc1+"%)</td>"+
								  "<td >"+list[i].scrollip2+" ("+list[i].sc2+"%)</td>"+
								  "<td >"+list[i].scrollip3+" ("+list[i].sc3+"%)</td>"+
								  "<td >"+list[i].scrollip4+" ("+list[i].sc4+"%)</td>"+
								  "<td >"+list[i].moveip1+" ("+list[i].m1+"%)</td>"+
								  "<td >"+list[i].moveip2+" ("+list[i].m2+"%)</td>"+
								  "<td >"+list[i].moveip3+" ("+list[i].m3+"%)</td>"+
								  "<td >"+list[i].moveip4+" ("+list[i].m4+"%)</td>"+
								  
								  "</tr>";
							open+=tr;
							
							var tr2 = "";
								tr2+="<tr>"+
								  "<td >"+list[i].channelStr+"</td>"+
								  "<td >"+list[i].ip+"</td>"+
								  "<td >"+list[i].pv+"</td>"+
									"<tr>";
								lefttale+=tr2;
							
						}
						
						jQuery("#tbody").empty();
						jQuery("#tbody").append(open);
						
						jQuery(".DTFC_LeftBodyWrapper #tbody").empty();
						jQuery(".DTFC_LeftBodyWrapper #tbody").append(lefttale);
						
					}
					clearTimeout(t);
					if(browsingHistory[browsingHistory.length-1].indexOf("/dashboard_channelList.jhtm")>=0){
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
