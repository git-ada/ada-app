<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="${pageContext.request.contextPath}/assets/css/all.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/assets/css/minimal/grey.css"/>
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
            <a href="${pageContext.request.contextPath}/index.jhtm">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <span>人工充值</span>
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
				    <form id="search_from" class="form-horizontal" action="${pageContext.request.contextPath}/manual-order/list.jhtm" method="get">
				    	 <input type="hidden" name="search_EQ_status" value="${param.search_EQ_status}">
				    	<!--
				    		支持操作符 :EQ, NOTEQ , LIKE, LLIKE, RLIKE, NLIKE, GT, LT, GTE, LTE, IN, NOTIN, NULL, NOTNULL,
				    		如:search_EQ_name 会自动添加条件，like '%value%';
				    	-->
				    	<!-- 页码  -->
					    <input type="hidden" id="page" name="page">
						<div class="row">
							<div class="col-md-4 col-sm-12">
								<div class="btn-group" data-toggle="buttons">
	                                 <label class="btn btn-default ${empty param.search_EQ_status?'active':''}""><input  type="radio" class="toggle radio-status" value=""> 全部订单 </label>
	                                 <label class="btn btn-default ${param.search_EQ_status == 0?'active':''}"> <input  type="radio" class="toggle radio-status" value="0"> 待处理 </label>
	                                 <label class="btn btn-default ${param.search_EQ_status == 1?'active':''}"> <input  type="radio" class="toggle radio-status" value="1"> 充值成功 </label>
	                                 <label class="btn btn-default ${param.search_EQ_status == -1?'active':''}"> <input  type="radio" class="toggle radio-status" value="-1"> 充值失败 </label>
	                             </div>
                            </div>
							<div class="col-md-1 col-sm-6">
								<input type="text" class="form-control search-field input-small" name="search_LIKE_phone" value="${param.search_LIKE_phone}"  placeholder="充值号码"/>
							</div>
							<!--
							<div class="col-md-1 col-sm-12">
							<select name="search_EQ_status" class="bs-select form-control input-small">
								<option value="">全部状态</option>
								<c:forEach var="e" items="${allStatuss}">
									<option value="${e.key}" ${param.search_EQ_status == e.key?'selected':''}>${e.value}</option>
								</c:forEach>
							</select>
							</div>
							 -->
							 <div class="col-md-1 col-sm-6">
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
	            <a class="buttons-excel buttons-html5 btn purple btn-outline opt-export" data-opt-key="/manual-order/export"><span>导出表格</span></a>
	            <a class="buttons-excel buttons-html5 btn yellow btn-outline opt-export-csv" data-opt-key="/manual-order/export"><span>导出文本</span></a>
	            <a class="buttons-collection buttons-colvis btn green btn-outline opt-refresh" ><span>刷新</span></a>
		    </div>
	    </div>
	    <!-- 右上角工具栏 END -->
	</div>
	<div class="portlet-body">
		<div class="row">
			<!-- 左上角功能区 BEGIN -->
		    <div class="col-md-6 col-sm-12">
		    	<!-- 
		       <button type="button" class="btn green" onclick="gotoPage('${pageContext.request.contextPath}/manual-order/create.jhtm')" data-opt-key="/manual-order/create"><i class="fa fa-plus"></i>&nbsp;&nbsp;新增&nbsp;&nbsp;</button>
		        -->
		       <button type="button" class="btn default opt-depend-select disabled opt-batch-handle" >&nbsp;&nbsp;批量处理&nbsp;&nbsp;</button>
		       <!-- 
		       <div class="btn-group">
                   <button type="button" class="btn btn-default opt-mark-status opt-depend-select disabled"  data-status = "1">标记为成功</button>
                   <button type="button" class="btn btn-default dropdown-toggle opt-depend-select disabled" data-toggle="dropdown" aria-expanded="false"  >
                       <i class="fa fa-angle-down"></i>
                   </button>
                   <ul class="dropdown-menu" role="menu">
                   	   <li>
                           <a href="javascript:;" class="opt-mark-status" data-status ="-1">标记为失败 </a>
                       </li>
                   </ul>
               </div>
                -->
		    </div>
		    <!-- 左上角功能区 END -->
		    
		    <!-- 头部分页 BEGIN-->
		    <div class="col-md-6 col-sm-12 right">
				 <jsp:include page="${pageContext.request.contentType}/include/paging_header.jsp"/>
		    </div>
		    <!-- 头部分页 END--> 
		</div>
		<!-- 数据列表 BEGIN -->
	    <div class="table-scrollable">
	        <table class="table table-striped dataTableg table-bordered table-hover data-table">
	            <thead>
	                <tr>
				        <th scope="col" style="width:65px">
	                        <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
	                            <input type="checkbox" class="opt-select-all">
	                            <span></span>
	                        </label>
	                    </th>
	                    <th scope="col">订单编号</th>
						<th scope="col">产品名称</th>			
						<th scope="col">套餐包</th>			
						<th scope="col">充值号码</th>
						<th scope="col">状态</th>
						<th scope="col">备注</th>
						<th scope="col">下单时间</th>
						<th scope="col">完成时间</th>
						<th scope="col">操作</th>
				     </tr>
	            </thead>
	            <tbody>
	               <c:forEach var="item" items="${page.pageResults}" varStatus="number">
	                <tr>      
						<td>
							<c:if test="${item.status==0}">
				        		 <label class="mt-checkbox mt-checkbox-single mt-checkbox-outline">
	                            <input type="checkbox" class="opt-select" value="${item.id}">
	                            <span></span>
	                        </label>
				        	</c:if>
	                    </td>
	                    	<td>${item.orderNo}</td>
							<td>${item.productName}</td>
							<td>${item.pkg}</td>
							<td>${item.phone}</td>
		                    <td style="width: 100px"><c:forEach items="${allStatuss}" var="e">
									<c:if test="${e.key == item.status}">
										<c:if test="${0 == e.key}">
					                    	<span class="label label-sm label-primary">${e.value}</span>
					                    </c:if>
					                    <c:if test="${1 == e.key || 2 == e.key}">
					                    	<span class="label label-sm label-success">${e.value}</span>
					                    </c:if>
					                    <c:if test="${-1 == e.key}">
					                    	<span class="label label-sm label-danger">${e.value}</span>
					                    </c:if>
					             	</c:if>
					             </c:forEach>
										
							</td>
		                    <td>${item.comment}</td>
		                    <td  style="width: 150px;"><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                    <td style="width: 150px;"><fmt:formatDate value="${item.completeTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                    
		                    <td>
	                    	<!-- 
	                    	<a class="btn btn-default btn-outline btn-sm opt-edit" data-id="${item.id}"  data-opt-key="/balance-2cash/create"><span>&nbsp;&nbsp;编辑&nbsp;&nbsp;</span></a>                    	
	                    	<a class="btn btn-default btn-outline btn-sm opt-delete" data-id="${item.id}"  data-opt-key="/balance-2cash/delete"><span>&nbsp;&nbsp;删除&nbsp;&nbsp;</span></a>
	                    	 -->
	                    	<c:if test="${item.status eq 0 }">
	                    		<a class="btn btn-default btn-outline btn-sm " data-id="${item.id}"  href="javascript:void(0);" onclick="handle(this);"><span>&nbsp;&nbsp;处理&nbsp;&nbsp;</span></a>
	                    	</c:if>
	                    </td>
	                </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
	    <!-- 数据列表 END -->
	    
	    <!-- 底部功能区 BEGIN -->
	    <div class="row">
	        <div class="col-md-4 col-sm-12">
	            <button class="btn btn-sm btn-select-all">全选 </button>
	            <button class="btn btn-sm btn-select-invert">反选 </button>
	            <button class="btn btn-sm disabled opt-depend-select opt-batch-delete" data-opt-key="/manual-order/delete">删除 </button>
	        </div>
	        <!-- 底部分页 -->
	        <div class="col-md-8 col-sm-12 right">
	        	 <jsp:include page="${pageContext.request.contentType}/include/paging_footer.jsp"/>
	        </div>
	    </div>
	    <!-- 底部功能区 END -->
	</div>
</div>
<!-- 处理弹出层 -->
<div class="popup-bg" id="shenhe-pbox">
	<div class="shenghe-pop-box">
		<h2>人工处理</h2>
		<div class="icheck-inline">
			<label><input type="radio" name="radio2"  class="icheck" value="1">充值成功 </label>
            <label><input type="radio" name="radio2"  class="icheck" value="-1">充值失败(将原路退款)</label>
        </div>
		<textarea id="comment" name="message" placeholder="备注"></textarea>
		<div class="shenghe-pop-btn">
			<button class="btn opt-handle-cancel fr">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			<button class="btn btn-success fr" onclick="saveHandle();"><i class="fa fa-check"></i>&nbsp;提交&nbsp;&nbsp;</button>
		</div>
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
	
	$('.radio-status').change(function() {
	
		var status = $(".radio-status:checked").val();
		$("input[name=search_EQ_status]").val(status);
		searchItems();
	});
	
	//导出
	$(".opt-export").click(function() { 
		//refreshPage();
		var exportUrl = "${pageContext.request.contextPath}/manual-order/export.do?"+$("#search_from").find("[value!='']").serialize();
		window.location.href = exportUrl;
	});
	
	$(".opt-export-csv").click(function() { 
		//refreshPage();
		var exportUrl = "${pageContext.request.contextPath}/manual-order/export-csv.do?"+$("#search_from").find("[value!='']").serialize();
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
    	if(d.length>0){
    		if($(this).prop("checked")){
        		d.prop("checked",true);
        		enableOpts();
        	}else{
        		d.prop("checked",false);
        		disableOpts();
        	}
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
      		url:"${pageContext.request.contextPath}/manual-order/delete.do?id="+ids,
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
    	 $('.opt-depend-select').removeClass('disabled');
    	 $('.opt-batch-handle').addClass('green');
    	 $('.opt-batch-delete').addClass('red')
     };
     
     var disableOpts = function(){
    	 $('.opt-depend-select').removeClass('red').addClass('disabled');
    	 $('.opt-batch-handle').removeClass('green');
    	 $('.opt-batch-delete').removeClass('red')
     };
     
	 <!-- 处理逻辑开始 -->
     var handleIds;
     $(".opt-batch-handle").click(function(){
    	 var checkItems = $(".opt-select:checked");
    	 
    	handleIds="";
    	checkItems.each(function(){
       		handleIds=handleIds+$(this).val()+",";
       	});
       	
    	if(checkItems.length >0){
    		showHandle();
    	}
     });
     
     $(".opt-handle-cancel").click(function(){
    	 hideHandle();
    	 handleIds = null;
     });
     
     
     var handle = function(obj){
    	 handleIds = $(obj).attr("data-id");
    	 showHandle();
     }
     
     var showHandle = function(){
    	 $("#shenhe-pbox").show();
     }
     
     var hideHandle = function(){
    	 $(".icheck").each(function(){
    		 $(this).attr("checked",false);
    	 });
    	 
    	 $(".iradio_minimal-grey").each(function(){
    		 $(this).removeClass("checked");
    	 });
    	 
     	 $("#comment").val("");
    	 $("#shenhe-pbox").hide();
     }
     
     var saveHandle = function(){
    	var result = $(".icheck:checked").val();
    	if(result != 1 && result !=-1){
    		toastr.error("请选择处理结果！");
    		return;
    	}
    	
     	var message=$("#comment").val();
     	
    	//判断审核是否通过
    	if(result==-1 && (null==message || ""==message )){ //没有通过
    		 toastr.error("请填写失败原因！");
    	    return;
    	}else{ //已经通过
    		$("#shenhe-pbox").hide();
    	}
    	

     	jQuery.ajax({
     		url:"${pageContext.request.contextPath}/manual-order/complete.do?id="+handleIds+"&status="+result+"&message="+message,
       		success:function(ret){
       			if(ret.success){
            			toastr.success(ret.message);
            			refreshPage();
                	 }else{
        				toastr.error(ret.message);
        			}
       		}
       	});

     	hideHandle();
     	handleIds = "";
     };
</script>
<script src="${pageContext.request.contextPath}/assets/js/icheck.min.js" type="text/javascript"></script> 

<!-- 侧拉编辑栏 BEGIN -->
<div class="page-quick-sidebar-wrapper" data-close-on-body-click="false">
	<div class="page-quick-sidebar">
        <div class="tab-pane page-quick-sidebar-settings">
            <div class="page-quick-sidebar-settings-list">
                <h3 class="list-heading" style="color: #fff">编辑</h3>
                <div class="list-items">
					<form id="edit_form" action="/manual-order/update.do" class="form-horizontal" method="post">
			        	<input type="hidden" name="id">
		               	<div class="form-body">
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">订单ID<span class="required" > * </span></label>	
			               		<div class="col-md-8">
					                <input type="text" name="orderId" class="form-control" required="required" maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">产品Id</label>	
			               		<div class="col-md-8">
					                <input type="text" name="productId" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">产品名称</label>	
			               		<div class="col-md-8">
					                <input type="text" name="productName" class="form-control"  maxlength="32">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">套餐包</label>	
			               		<div class="col-md-8">
					                <input type="text" name="pkg" class="form-control"  maxlength="32">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">用户手机</label>	
			               		<div class="col-md-8">
					                <input type="text" name="phone" class="form-control"  maxlength="11">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">状态</label>	
			               		<div class="col-md-8">
									<select name="status" class="form-control" >
									<c:forEach items="${allStatuss}" var="e">
									<option value="${e.key}">${e.value}</option>
									</c:forEach>
									</select>
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">备注</label>	
			               		<div class="col-md-8">
									<textarea rows="3" cols="40" name="comment" class="form-control"  maxlength="128"></textarea>
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">完成时间</label>	
			               		<div class="col-md-8">
									<input name="completeTime" class="form-control form-control-inline datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${manualOrder.completeTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly="readonly">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">创建时间</label>	
			               		<div class="col-md-8">
									<input name="createTime" class="form-control form-control-inline datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${manualOrder.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly="readonly">
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
                 url : "/manual-order/get.do",
                 data : {"id" : id},
                 success : function(ret) {
                 		$("#edit_form").find("[name='id']").val(ret.entity.id);
                 		$("#edit_form").find("[name='orderId']").val(ret.entity.orderId);
                 		$("#edit_form").find("[name='productId']").val(ret.entity.productId);
                 		$("#edit_form").find("[name='productName']").val(ret.entity.productName);
                 		$("#edit_form").find("[name='pkg']").val(ret.entity.pkg);
                 		$("#edit_form").find("[name='phone']").val(ret.entity.phone);
                 		$("#edit_form").find("[name='status']").val(ret.entity.status);
                 		$("#edit_form").find("[name='comment']").val(ret.entity.comment);
                 		$("#edit_form").find("[name='completeTime']").val(ret.entity.completeTime);
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
          		url:"${pageContext.request.contextPath}/manual-order/delete.do?id="+id,
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

