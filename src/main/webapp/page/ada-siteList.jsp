<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	@media (min-width: 992px){
		.search-field {padding-right:0!important;}
	}
	
.table {
    width: 100%;
     margin-bottom: 0px!important; 
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
	<!-- 渠道和域名数据列表                           ---------------------------------------------------------------- -->
	<div class="portlet-body" style="margin: 0px;padding: 0;">
		<table id="siteList" class="table table-striped table-bordered table-hover order-column" style="border: 0;">
	            <thead>
	                <tr>
						<th scope="col" style="min-width: 70px">用户名</th>			
						<th scope="col" style="min-width: 70px">站点</th>
						<th scope="col" style="min-width: 70px">操作</th>
						
				     </tr>
	            </thead>
	            <tbody id="sitetbody">
	            	<c:forEach var="item" items="${objs}" varStatus="number">
	            		<tr>
	            			<td>${item.userId }</td>
	            			<td>${item.siteName }</td>
	            			<td><a onclick="changeSite('${item.id}','${item.siteName}')">查看统计数据</a></td>
	            		</tr>
	            	</c:forEach>
	            </tbody>
	            
	            
	        </table>
	</div>
</div>


<!-- START PAGE SCRIPTS -->
<script type="text/javascript">


//渲染table
var initTable2 = function () {
     table = $('#siteList');
     oTable = table.dataTable({
   
  
        paging: false,
        scrollY:        document.documentElement.clientHeight-295,
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
jQuery(document).ready(function() {
	//firstAppend();
	//initTable2();
});

function firstAppend(){
	var str = "";
	for(var i=0;i<15;i++){
		var tr = "<tr>" +
		"<td ><span class='tdonly'></span></td>" +
		"<td></td>" +
		"<td></td>" +
		"</tr>";
		
		str +=tr;
	}
	
	jQuery("#sitetbody").append(str);
	
}

function changeSite(siteId,siteName){
	jQuery("#siteName").html(siteName);
	jQuery(".nav-item").removeClass("active");
	jQuery(".nav-item").first().next().addClass("active");
	gotoPage("${pageContext.request.contextPath}/dashboard.jhtm?dataType=domain&firstTd=&top=&isRefresh=true&isRetrun=false&siteId="+siteId);
}
</script>

<!-- END PAGE SCRIPTS -->
