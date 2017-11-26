<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
	@media (min-width: 992px){
		.search-field {padding-right:0!important;}
	}
</style>
<!-- 顶部导航 BGEIN -->
<div class="page-bar">
    <ul class="page-breadcrumb" style="width: 100%">
        <li>
            <i class="icon-home"></i>
            <a href="index.jsp">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <span>域名统计</span>
        </li>
    </ul>
</div>
<!-- 顶部导航 END-->
<div class="portlet light">
	<div class="portlet-title">
		<!-- 顶部搜索栏 BEGIN -->
		<div class="row">
			<div class="col-md-10 col-sm-12 left">
		    <div class="caption">
				<div class="clearfix ">
				    <form id="search_from" class="form-horizontal" action="${pageContext.request.contextPath}/ada-domain-stat/list.jhtm" method="get">
				    	<!--
				    		支持操作符 :EQ, NOTEQ , LIKE, LLIKE, RLIKE, NLIKE, GT, LT, GTE, LTE, IN, NOTIN, NULL, NOTNULL,
				    		如:search_EQ_name 会自动添加条件，like '%value%';
				    	-->
				    	<!-- 页码  -->
					    <input type="hidden" id="page" name="page">
						<div class="row">
							<div class="col-md-3 col-sm-12">
						         <div class="input-group input-medium">
                                      <input type="text" class="form-control daterangepick"  placeholder="日期" readonly="readonly">
                                      <input type="hidden" name="search_GTE_date" value="${param.search_GTE_date}">
                                      <input type="hidden" name="search_LTE_date" value="${param.search_LTE_date}">
                                 </div>
						    </div>
						    <div class="col-md-1 col-sm-12 right">
						    	<button class="btn  btn-default opt-search" type="button" >&nbsp;&nbsp;搜索&nbsp;&nbsp;<i class="fa fa-search">&nbsp;&nbsp;</i></button>
						    </div>
						</div>
				    </form>
				 </div>
		    </div>
		    </div>
		    <!-- 顶部搜索栏 END -->
		    
		    <!-- 右上角工具栏 BEGIN -->
		    <div class="col-md-2 col-sm-12 right">
	            <!-- <a class="buttons-excel buttons-html5 btn purple btn-outline opt-export" data-opt-key="/ada-domain-stat/export"><span>导出表格</span></a>
	            <a class="buttons-collection buttons-colvis btn green btn-outline opt-refresh" ><span>刷新</span></a> -->
		    </div>
	    </div>
	    <!-- 右上角工具栏 END -->
	</div>
	<div class="portlet-body">
		<!-- 数据列表 BEGIN -->
	    <div class="table-scrollable">
	        <table class="table table-striped dataTableg table-bordered table-hover data-table">
	            <thead style="display:block;border-bottom:1px solid #eee;">
	                <tr>
	                    <th scope="col" style="min-width: 100px;">日期</th>		
						<th scope="col" style="min-width: 150px;">域名</th>			
						<th scope="col" style="min-width: 120px;">IP</th>			
						<th scope="col" style="min-width: 120px;">PV</th>
						<th scope="col" style="min-width: 120px;">老用户数</th>			
						<th scope="col" style="min-width: 120px;">1-2次点击</th>			
						<th scope="col" style="min-width: 120px;">3-5次点击</th>			
						<th scope="col" style="min-width: 120px;">6-10次点击</th>			
						<th scope="col" style="min-width: 120px;">10+次点击</th>			
						<th scope="col" style="min-width: 120px;">目标页访问</th>
						<th scope="col" style="min-width: 120px;">5-30秒停留</th>
						<th scope="col" style="min-width: 120px;">31-120秒停留</th>
						<th scope="col" style="min-width: 120px;">121-300秒停留</th>
						<th scope="col" style="min-width: 120px;">300+秒停留</th>
						<th scope="col" style="min-width: 120px;">1-2次滚动</th>
						<th scope="col" style="min-width: 120px;">3-5次滚动</th>
						<th scope="col" style="min-width: 120px;">6-10次滚动</th>
						<th scope="col" style="min-width: 120px;">10+次滚动</th>
						<th scope="col" style="min-width: 120px;">1-2次移动</th>
						<th scope="col" style="min-width: 120px;">3-5次移动</th>
						<th scope="col" style="min-width: 120px;">6-10次移动</th>
						<th scope="col" style="min-width: 120px;">10+次移动</th>
											
				     </tr>
	            </thead>
	            <tbody id="domainStatHistory" style="overflow-y: scroll;display: block;">
	               <c:forEach var="item" items="${domainstatList}" varStatus="number">
	                <tr>
                   		<td style="min-width: 100px;"><fmt:formatDate value="${item.date}" pattern="yyyy-MM-dd"/></td>
						<td style="min-width: 150px;" title="${item.domain}">${item.subdoamin}</td>
						<td style="min-width: 120px;">${item.ip}</td>
						<td style="min-width: 120px;">${item.pv}</td>
						<td style="min-width: 120px;">${item.olduserip} (${item.old}%)</td>
						<td style="min-width: 120px;">${item.clickip1} (${item.c1}%)</td>
						<td style="min-width: 120px;">${item.clickip2} (${item.c2}%)</td>
						<td style="min-width: 120px;">${item.clickip3} (${item.c3}%)</td>
						<td style="min-width: 120px;">${item.clickip4} (${item.c4}%)</td>
						<td style="min-width: 120px;">${item.targetpageip} (${item.tgp}%)</td>
						<td style="min-width: 120px;">${item.staytimeip1} (${item.s1}%)</td>
						<td style="min-width: 120px;">${item.staytimeip2} (${item.s2}%)</td>
						<td style="min-width: 120px;">${item.staytimeip3} (${item.s3}%)</td>
						<td style="min-width: 120px;">${item.staytimeip4} (${item.s4}%)</td>
						<td style="min-width: 120px;">${item.scrollip1} (${item.sc1}%)</td>
						<td style="min-width: 120px;">${item.scrollip2} (${item.sc2}%)</td>
						<td style="min-width: 120px;">${item.scrollip3} (${item.sc3}%)</td>
						<td style="min-width: 120px;">${item.scrollip4} (${item.sc4}%)</td>
						<td style="min-width: 120px;">${item.moveip1} (${item.m1}%)</td>
						<td style="min-width: 120px;">${item.moveip2} (${item.m2}%)</td>
						<td style="min-width: 120px;">${item.moveip3} (${item.m3}%)</td>
						<td style="min-width: 120px;">${item.moveip4} (${item.m4}%)</td>
	                </tr>
	                </c:forEach>
	                <c:if test="${empty domainstatList}">
	            		<tr><td colspan="20" >暂无数据</td></tr>
	            	</c:if>
	            </tbody>
	        </table>
	    </div>
	    <!-- 数据列表 END -->
	    
	    <!-- 底部功能区 BEGIN -->
	    <%-- <div class="row">
	        <!-- 底部分页 -->
	        <c:if test="${not empty domainstatList}">
	        	<div class="col-md-4 col-sm-12">
		            <button class="btn btn-sm btn-select-all">全选 </button>
		            <button class="btn btn-sm btn-select-invert">反选 </button>
		            <button class="btn btn-sm disabled opt-depend-select opt-batch-delete" data-opt-key="/ada-domain-stat/delete">删除 </button>
		        </div>
			    <div class="row">
			        <!-- 底部分页 -->
			        <div class="col-md-4 col-sm-12">
			        	 <jsp:include page="/include/paging_footer.jsp"/>
			        </div>
			    </div>
		    </c:if>
	    </div> --%>
	    <!-- 底部功能区 END -->
	</div>
</div>
<script type="text/javascript">
	
	$('#domainStatHistory').css("height",window.screen.height-465+"px");
	
	//初始化时间器
	initatepicker();
	//初始化操作权限
	initOpts();

	//回车查询
	$('.search-field').keydown(function(e){
		if(e.keyCode==13){
			$(".opt-search").click();
		}
	});
	
	//点击查询
	$('.opt-search').click(function(){
	 	$("#page").val(1);
		$("#search_from").submit(); 
	});

	//查询
	$('#search_from').submit(function() {
		searchItems();
	    return false;
	});
	
	//导出
	$(".opt-export").click(function() { 
		//refreshPage();
		var exportUrl = "${pageContext.request.contextPath}/ada-domain-stat/export.do?"+$("#search_from").find("[value!='']").serialize();
		window.location.href = exportUrl;
	});
	
	//刷新
	$(".opt-refresh").click(function() { 
		refreshPage();
	});

    //单选
    $(".opt-select").click(function() { 
    	 var checkItems = $(".opt-select:checked");
         if(checkItems.length >0){
        	 enableOpts();
         }else{
        	 disableOpts();
         }
    });

    //顶部全选
    $(".opt-select-all").click(function(){
    	var d = $(".opt-select");
    	if($(this).prop("checked")){
    		d.prop("checked",true);
    		enableOpts();
    	}else{
    		d.prop("checked",false);
    		disableOpts();
    	}
    });
    
  	//底部全选 
    $(".btn-select-all").click(function(){
    	var d = $(".opt-select,.opt-select-all");
    	if($(".opt-select-all").prop("checked")){
    		d.prop("checked",false);
    		disableOpts();
    	}else{
    		d.prop("checked",true);
    		enableOpts();
    	}
    });
    
    //反选 
    $(".btn-select-invert").click(function(){
    	$(".opt-select").each(function(){
    	   if($(this).prop("checked")){
    		  $(this).prop("checked",false);
    	   }else{
    		  $(this).prop("checked",true); 
    	   }
    	});
    	
    	if($(".opt-select:checked").length==0){
    		$(".opt-select-all").prop("checked",false);
    	}else if($(".opt-select:checked").length == $(".opt-select").length){
    		$(".opt-select-all").prop("checked",true);
    	}
    	
    	if($(".opt-select:checked").length > 0){
    		enableOpts();
    	}else{
    		disableOpts();
    	}
    });
    
    //单条删除
    $(".opt-delete").confirmation({
        btnOkClass: "btn btn-sm btn-success",btnCancelClass: "btn btn-sm btn-default", placement: "top",
        title: "确认删除？",btnOkLabel:"确认",btnCancelLabel:"取消",
        onConfirm: function(){
            deleteItems($(this).attr("data-id"));
        }
	});
    
    //批量删除
    $(".opt-batch-delete").confirmation({
 	        btnOkClass: "btn btn-sm btn-success",btnCancelClass: "btn btn-sm btn-default",placement: "top",
 	        title: "确认删除？", btnOkLabel:"确认",btnCancelLabel:"取消",
 	        onConfirm: function(){
 	        	var ids="";
              	$(".opt-select:checked").each(function(){
              		ids=ids+$(this).val()+",";
              	});
              	if(ids!=null){
              		deleteItems(ids);
              	}
 	        }
 	 });
 	 
 	 //查询
     var searchItems = function(){
     	$("[data-opt-key]").each(function(){
 			console.log($(this).attr("data-opt-key")+":"+$(this).attr("name"));
 		});
     
     
 		var queryString = "";
 		$("#search_from").find("[name]").each(function(){
 			if($(this).val()!='' && $(this).val() !='undefined' && $(this).val() !=undefined){
 				queryString += "&"+$(this).attr("name") + "=" +$(this).val();
 			}
 		});
 		if(queryString != ""){
 			queryString = "?"+queryString.substring(1,queryString.length);
 		}
    	var url =  $("#search_from").attr("action")+queryString;
		gotoPage(url);
     };
    
     //删除记录
     var deleteItems = function(ids){
    	 jQuery.ajax({
      		url:"${pageContext.request.contextPath}/ada-domain-stat/delete.do?id="+ids,
      		success:function(ret){
      			if(ret.success){
      				toastr.success(ret.message);
      				refreshPage();
      			}else{
      				toastr.error(ret.message);
      			}
      		}
      	});
     };
     
     var enableOpts = function(){
    	 $('.opt-depend-select').addClass('red').removeClass('disabled');
     };
     
     var disableOpts = function(){
    	 $('.opt-depend-select').removeClass('red').addClass('disabled');
     };
</script>

<!-- 侧拉编辑栏 BEGIN -->
<div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
	<div class="page-quick-sidebar">
        <div class="tab-pane page-quick-sidebar-settings">
            <div class="page-quick-sidebar-settings-list">
                <h3 class="list-heading" style="color: #fff">编辑</h3>
                <div class="list-items">
					<form id="edit_form" action="${pageContext.request.contextPath}/ada-domain-stat/update.do" class="form-horizontal" method="post">
			        	<input type="hidden" name="id">
		               	<div class="form-body">
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">站点ID</label>	
			               		<div class="col-md-8">
					                <input type="text" name="siteId" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">渠道ID</label>	
			               		<div class="col-md-8">
					                <input type="text" name="domainId" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">IP</label>	
			               		<div class="col-md-8">
					                <input type="text" name="ip" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">PV</label>	
			               		<div class="col-md-8">
					                <input type="text" name="pv" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">1-2次点击</label>	
			               		<div class="col-md-8">
					                <input type="text" name="clickip1" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">3-5次点击</label>	
			               		<div class="col-md-8">
					                <input type="text" name="clickip2" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">6-10次点击</label>	
			               		<div class="col-md-8">
					                <input type="text" name="clickip3" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">10+次点击</label>	
			               		<div class="col-md-8">
					                <input type="text" name="clickip4" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">目标页访问</label>	
			               		<div class="col-md-8">
					                <input type="text" name="targetpageip" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">日期</label>	
			               		<div class="col-md-8">
									<input name="date" class="form-control form-control-inline datepick" type="text" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${adaDomainStat.date}" pattern="yyyy-MM-dd"/>"  readonly="readonly">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">创建时间</label>	
			               		<div class="col-md-8">
									<input name="createTime" class="form-control form-control-inline datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaDomainStat.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly="readonly">
								</div>
			               	</div>
		               	</div>  
			        </form> 
			    </div>
            </div>
        </div>
        <div class="inner-content staff-quick-slider clearfix">
        	<span class="fa fa-trash-o opt-edit-delete"></span>
            <button id="opt-cancel" class="btn btn-default">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            <button id="opt-update" class="btn btn-success" ><i class="fa fa-check"></i>&nbsp;&nbsp;保存&nbsp;&nbsp;</button>  
        </div>
    </div>
</div>
<script type="text/javascript">
	//编辑
    $('.opt-edit').click(function(){
    	 var id = $(this).attr("data-id");
    		 $.ajax({  
                 url : "${pageContext.request.contextPath}/ada-domain-stat/get.do",
                 data : {"id" : id},
                 success : function(ret) {
                 		$("#edit_form").find("[name='id']").val(ret.entity.id);
                 		$("#edit_form").find("[name='siteId']").val(ret.entity.siteId);
                 		$("#edit_form").find("[name='domainId']").val(ret.entity.domainId);
                 		$("#edit_form").find("[name='ip']").val(ret.entity.ip);
                 		$("#edit_form").find("[name='pv']").val(ret.entity.pv);
                 		$("#edit_form").find("[name='clickip1']").val(ret.entity.clickip1);
                 		$("#edit_form").find("[name='clickip2']").val(ret.entity.clickip2);
                 		$("#edit_form").find("[name='clickip3']").val(ret.entity.clickip3);
                 		$("#edit_form").find("[name='clickip4']").val(ret.entity.clickip4);
                 		$("#edit_form").find("[name='targetpageip']").val(ret.entity.targetpageip);
                 		$("#edit_form").find("[name='date']").val(ret.entity.date);
                 		$("#edit_form").find("[name='createTime']").val(ret.entity.createTime);
                 }  
             });
        $("body").toggleClass("page-quick-sidebar-open");
    });
   
    //取消
    $("#opt-cancel").click(function(){
    	$("body").toggleClass("page-quick-sidebar-open");
    });
    
    //回车自动保存
	$('#edit_form').find("input").keydown(function(e){
		if(e.keyCode==13){
		   $("#opt-update").click();
		}
	});
	
	//保存更新
    $("#opt-update").click(function(){
    	if(!$(this).hasClass("disabled")){
    		$(this).addClass("disabled");
    		$('#edit_form').ajaxSubmit({
    		   success:function(ret){
	       		 	if(ret.success){
	       		 		$(this).clearForm();
	       				$("body").toggleClass("page-quick-sidebar-open");
	              	 	toastr.success('保存成功');
	              	 	refreshPage();
	             	}else{
	      				toastr.error(ret.message);
	      			}
	       		    $("#opt-update").removeClass("disabled");
    			},
    		   error:function(){
    			    toastr.error("系统错误");
    			    $("#opt-update").removeClass("disabled");
    		   }
           });
    	}
    });
    
    //删除
    $(".opt-edit-delete").confirmation({
        btnOkClass: "btn btn-sm btn-success",btnCancelClass: "btn btn-sm btn-default",placement: "right",
        title: "确认删除？", btnOkLabel:"确认",btnCancelLabel:"取消",
        onConfirm: function(){
        	var id = $("#edit_form").find("[name='id']").val();
        	jQuery.ajax({
          		url:"${pageContext.request.contextPath}/ada-domain-stat/delete.do?id="+id,
          		success:function(ret){
          			if(ret.success){
          				$("body").toggleClass("page-quick-sidebar-open");
	           			toastr.success(ret.message);
	           			refreshPage();
                   	 }else{
           				toastr.error(ret.message);
           			}
          		}
          	});
        }
	 });
</script>
<!-- 侧拉编辑栏 END -->

