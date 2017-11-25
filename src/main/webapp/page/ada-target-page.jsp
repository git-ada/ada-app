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
            <span>目标页</span>
        </li>
    </ul>
</div>
<!-- 顶部导航 END-->
<div class="portlet light">
	<div class="portlet-body">
		<div class="row">
			<!-- 左上角功能区 BEGIN -->
		    <div class="col-md-6 col-sm-12">
		       <button type="button" class="btn btn-default" onclick="gotoPage('${pageContext.request.contextPath}/ada-target-page/create.jhtm')" data-opt-key="/ada-target-page/create"><i class="fa fa-plus"></i>&nbsp;&nbsp;添加目标页&nbsp;&nbsp;</button>
		    </div>
		    <!-- 左上角功能区 END -->
		</div>
		<!-- 数据列表 BEGIN -->
	    <div class="table-scrollable">
	        <table class="table table-striped dataTableg table-bordered table-hover data-table">
	            <thead>
	                <tr>
				        <th scope="col" style="width:50px">
	                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
	                            <input type="checkbox" class="opt-select-all">
	                            <span></span>
	                        </label>
	                    </th>
	                    <th scope="col">网页名称</th>	
						<th scope="col">网页地址</th>
						<th scope="col">匹配类型</th>	
						<th scope="col">操作</th>	
				     </tr>
	            </thead>
	            <tbody>
	               <c:forEach var="item" items="${page.pageResults}" varStatus="number">
	                <tr>      
						<td>
	                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
	                            <input type="checkbox" class="opt-select" value="${item.id}">
	                            <span></span>
	                        </label>
	                    </td>
	                    	<td>${item.pageName}</td>
							<td>${item.url}</td>
							<c:if test="${item.matchMode == 1}">
							<td>全匹配</td>
							</c:if>
							<c:if test="${item.matchMode == 2}">
							<td>前缀匹配</td>
							</c:if>
							<c:if test="${item.matchMode == 3}">
							<td>模糊匹配</td>
							</c:if>
							<c:if test="${item.matchMode != 3 && item.matchMode!=2 && item.matchMode!=1}">
							<td></td>
							</c:if>
	                    <td>
	                    	<a class="btn btn-default btn-outline btn-sm opt-edit" data-id="${item.id}"  data-opt-key="/ada-target-page/create"><span>&nbsp;&nbsp;编辑&nbsp;&nbsp;</span></a>
	                    	<a class="btn btn-default btn-outline btn-sm opt-delete" data-id="${item.id}"  data-opt-key="/ada-target-page/delete"><span>&nbsp;&nbsp;删除&nbsp;&nbsp;</span></a>
	                    </td>
	                </tr>
	                </c:forEach>
	            </tbody>
	            <c:if test="${empty page.pageResults}">
            		<tr><td colspan="2">无</td></tr>
            	</c:if>
            	
	        </table>
	    </div>
	    <!-- 数据列表 END -->
	    
	    <!-- 底部功能区 BEGIN -->
	   <c:if test="${not empty page.pageResults}">
	        <div class="col-md-4 col-sm-12">
	            <button class="btn btn-sm btn-select-all">全选 </button>
	            <button class="btn btn-sm btn-select-invert">反选 </button>
	            <button class="btn btn-sm disabled opt-depend-select opt-batch-delete" data-opt-key="/ada-channel/delete">删除 </button>
	        </div>
	        <!-- 底部分页 -->
	        <div class="col-md-8 col-sm-12 right">
	        	 <jsp:include page="/include/paging_footer.jsp"/>
	        </div>
	       </c:if>
	    <!-- 底部功能区 END -->
	</div>
</div>
<script type="text/javascript">
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
		var exportUrl = "${pageContext.request.contextPath}/ada-target-page/export.do?"+$("#search_from").find("[value!='']").serialize();
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
      		url:"${pageContext.request.contextPath}/ada-target-page/delete.do?id="+ids,
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
					<form id="edit_form" action="${pageContext.request.contextPath}/ada-target-page/update.do" class="form-horizontal" method="post">
			        	<input type="hidden" name="id">
		               	<div class="form-body">
		               		<div class="form-group">
			               		<label class="col-md-4 control-label">网页地址<span class="required" > * </span></label>	
			               		<div class="col-md-8">
					                <input type="text" name="pageName" class="form-control input-big" required="required" maxlength="128">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">网页地址<span class="required" > * </span></label>	
			               		<div class="col-md-8">
					                <textarea rows="8" name="url" class="form-control" required="required" maxlength="128"></textarea>
								</div>
			               	</div>
			               	
				             <div class="form-group">
		                   	 <label class="col-md-4 control-label" style="float: none;">匹配模式<span class="required" > * </span></label>
			                    <div class="mt-radio-list" style="margin-left: 120px;">
									<label class="mt-radio mt-radio-outline">
										<input id="optionsRadios4" name="matchMode" value="1"  type="radio">
										全匹配
										<span></span>
									</label>
									<label class="mt-radio mt-radio-outline">
									<input id="optionsRadios5" name="matchMode" value="2" type="radio">
										前缀匹配
										<span></span>
									</label>
									<label class="mt-radio mt-radio-outline">
									<input id="optionsRadios6" name="matchMode" value="3"  type="radio">
										模糊匹配
										<span></span>
									</label>
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
                 url : "${pageContext.request.contextPath}/ada-target-page/get.do",
                 data : {"id" : id},
                 success : function(ret) {
                 		$("#edit_form").find("[name='id']").val(ret.entity.id);
                 		$("#edit_form").find("[name='siteId']").val(ret.entity.siteId);
                 		$("#edit_form").find("[name='pageName']").val(ret.entity.pageName);
                 		$("#edit_form").find("[name='url']").val(ret.entity.url);
                 		$("#edit_form").find("[name='createTime']").val(ret.entity.createTime);
                 		$("#edit_form").find("[name='matchMode']").each(function(mode){
                 			if($(this).val()==ret.entity.matchMode){
                 				$(this).attr("checked","checked");
                 			}
                 		});
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
          		url:"${pageContext.request.contextPath}/ada-target-page/delete.do?id="+id,
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

