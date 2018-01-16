<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" import="cn.com.jiand.mvc.framework.utils.MD5s" %>
<%@ page language="java" import="java.util.*" %>

<style>
	@media (min-width: 992px){
		.search-field {padding-right:0!important;}
	}
	.form-group{
		margin-top: 0px;
	}
	@media (min-width: 992px)
	bootstrap.min.css:5
	.col-md-offset-1 {
	    margin-left: 30.33333%;
	}
	.btn.btn-success{
		margin-left: 100%;
	}
	#modal-content1{
		border:1px solid #bfbfbf;
		position:absolute;
		margin-left: 27%;
		margin-top: 5%;
	}
</style>
<!-- 顶部导航 BGEIN
<div class="page-bar">
    <ul class="page-breadcrumb" style="width: 100%">
        <li>
            <i class="icon-home"></i>
            <a href="javascript:;" onclick="gotoPage('${pageContext.request.contextPath}/ada-site/list.jhtm')">首页</a>
            <i class="fa fa-angle-right"></i>
        </li>
        <li>
            <span>用户列表 </span>
        </li>
    </ul>
</div>
 -->
 <div id="modal-content1" style="width: 380px;height: 260px; display: none; background-color: #f2f2f2;" >
   	<div class="modal-header">
                  <a href="javascript:close();" role="button" class="close" ></a>
                  <h4 class="modal-title">重置密码</h4>
              </div>
   	<form id="edit_form2" action="${pageContext.request.contextPath}/change-user-password.do" class="form-horizontal" method="post">
        <jodd:form bean="userInfo" scope="request">
            <div class="form-body">			
				  <div class="form-group">
	                    <label class="col-md-3 control-label">新密码：</label>
	                    <div class="col-md-4">
			                <input type="password" name="password" class="form-control input-medium">
						</div>
				  </div>	
				  <div class="form-group">
	                    <label class="col-md-3 control-label">重复密码：</label>
	                    <div class="col-md-4">
			                <input type="password" name="repassword" class="form-control input-medium">
						</div>
				  </div>		
            </div>
            <div class="form-actions">
                <div class="row">
                    <div class="col-md-offset-1 col-md-4">
                    	<button type="submit" class="btn btn-success">
                		<i class="fa fa-check"></i>&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
                		<!-- 
                		<a href="javascript:close();"  class="btn grey-salsa btn-outline" style="display: inline;float: left;">取消</a>
                		 -->
                    </div>
                </div>
            </div>
        </jodd:form>
    </form>
</div>
<!-- 顶部导航 END-->
<div class="portlet light" id="portletLight">
	<div class="portlet-title">
		<!-- 顶部搜索栏 BEGIN -->
		<div class="row">
			<div class="col-md-10 col-sm-12 left">
		    <div class="caption">
				<div class="clearfix ">
				    <form id="search_from" class="form-horizontal" action="${pageContext.request.contextPath}/ada-user/list.jhtm" method="get">
				    	<!--
				    		支持操作符 :EQ, NOTEQ , LIKE, LLIKE, RLIKE, NLIKE, GT, LT, GTE, LTE, IN, NOTIN, NULL, NOTNULL,
				    		如:search_EQ_name 会自动添加条件，like '%value%';
				    	-->
				    	<!-- 页码  -->
					    <input type="hidden" id="page" name="page">
						<div class="row">
										<div class="col-md-1 col-sm-12">
										<input type="text" class="form-control search-field input-small" name="search_LIKE_username" value="${param.search_LIKE_username}"  placeholder="用户名"/>
										</div>
										
										<div class="col-md-1 col-sm-12">
										<input type="text" class="form-control search-field input-small" name="search_LIKE_nickname" value="${param.search_LIKE_nickname}"  placeholder="昵称"/>
										</div>
										<!--  
										<div class="col-md-1 col-sm-12">
										<input type="text" class="form-control search-field input-small" name="search_LIKE_realname" value="${param.search_LIKE_realname}"  placeholder="真名"/>
										</div>
										-->
										<div class="col-md-1 col-sm-12">
										<input type="text" class="form-control search-field input-small" name="search_LIKE_email" value="${param.search_LIKE_email}"  placeholder="邮箱"/>
										</div>
										<!--
										<div class="col-md-1 col-sm-12">
										<input type="text" class="form-control search-field input-small" name="search_LIKE_phone" value="${param.search_LIKE_phone}"  placeholder="手机"/>
										</div>
										
										
										<div class="col-md-1 col-sm-12">
										<input type="text" class="form-control search-field input-small" name="search_LIKE_homeAddress" value="${param.search_LIKE_homeAddress}"  placeholder="家庭住址"/>
										</div>
										-->
										
						    <div class="col-md-1 col-sm-12">
						    	<button class="btn  btn-default opt-search" type="button" >&nbsp;&nbsp;搜索&nbsp;&nbsp;<i class="fa fa-search">&nbsp;&nbsp;</i></button>
						    </div>
						</div>
				    </form>
				 </div>
		    </div>
		    </div>
		    <!-- 顶部搜索栏 END -->
		    
		    <!-- 右上角工具栏 BEGIN -->
		    <!--
		    <div class="col-md-2 col-sm-12 right">
	            <a class="buttons-excel buttons-html5 btn purple btn-outline opt-export" data-opt-key="/ada-user/export"><span>导出表格</span></a>
	            <a class="buttons-collection buttons-colvis btn green btn-outline opt-refresh" ><span>刷新</span></a>
		    </div>
		     -->
	    </div>
	    <!-- 右上角工具栏 END -->
	</div>
	<div class="portlet-body">
		<div class="row">
			<!-- 左上角功能区 BEGIN -->
			<!-- 
		    <div class="col-md-6 col-sm-12">
		       <button type="button" class="btn green" onclick="gotoPage('${pageContext.request.contextPath}/ada-user/create.jhtm')" data-opt-key="/ada-user/create"><i class="fa fa-plus"></i>&nbsp;&nbsp;新增&nbsp;&nbsp;</button>
		    </div>
		     -->
		    <!-- 左上角功能区 END -->
		    
		    <!-- 头部分页 BEGIN-->
		    <!-- 
		    <div class="col-md-6 col-sm-12 right">
				 <jsp:include page="/include/paging_header.jsp"/>
		    </div>
		    -->
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
						<th scope="col" style="min-width: 70px">用户ID</th>			
						<th scope="col" style="min-width: 70px">用户名</th>			
						<th scope="col" style="min-width: 70px">密码</th>			
						<th scope="col" style="min-width: 70px">昵称</th>	
						<!-- 
						<th scope="col">真名</th>
						<th scope="col">身份证号码</th>
						--> 			
						<th scope="col" style="min-width: 70px">邮箱</th>
						<!--			
						<th scope="col">手机</th>			
						<th scope="col">生日</th>			
						<th scope="col">性别</th>			
						<th scope="col">头像URL</th>			
						<th scope="col">省ID</th>			
						<th scope="col">城市ID</th>			
						<th scope="col">地区ID</th>			
						<th scope="col">家庭住址</th>	
						 -->			
						<th scope="col" style="min-width: 70px">状态</th>
						<th scope="col" style="min-width: 70px">是否为管理员</th>	
						<!--		
						<th scope="col">创建时间</th>	
						-->		
				        <th scope="col" style="min-width: 70px">操作</th>
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
	                   
	                    
							<td>${item.id}</td>
							<td>${item.username}</td>
							<td>${item.password}</td>
							<td>${empty item.nickname ? "---" : item.nickname}</td>
							<!-- 
							<td>${item.realname}</td>
							<td>${item.idNo}</td>
							-->
							<td>${empty item.email ? "---" : item.email}</td>
							<!--
							<td>${item.phone}</td>
		                    <td><fmt:formatDate value="${item.birthday}" pattern="yyyy-MM-dd"/></td>
		                    <td><c:forEach items="${allSexs}" var="e">
								<c:if test="${e.key == item.sex}">${e.value}</c:if>
								</c:forEach>
							</td>
							<td>${item.headImgUrl}</td>
							<td>${item.provinceId}</td>
							<td>${item.cityId}</td>
							<td>${item.districtId}</td>
							<td>${item.homeAddress}</td>
							-->
		                    <td><c:forEach items="${allStatuss}" var="e">
								<c:if test="${e.key == item.status}">${e.value}</c:if>
								</c:forEach>
							</td>
							<td><c:forEach items="${allIsAdmins}" var="e">
								<c:if test="${e.key == item.isAdmin}">${e.value}</c:if>
								</c:forEach>
							</td>
							<!--  btn btn-circle default
		                    <td><fmt:formatDate value="${item.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
		                    -->
	                    <td><!--
	                       <a class="btn btn-default btn-outline btn-sm opt-delete" data-id="${item.id}"  data-opt-key="/ada-user/delete"><span>&nbsp;&nbsp;删除&nbsp;&nbsp;</span></a>
	                       <a class="btn btn-default btn-outline btn-sm opt-edit" data-id="${item.id}"  data-opt-key="/ada-user/create"><span>&nbsp;&nbsp;重置密码&nbsp;&nbsp;</span></a>
	                       --> 
	                       <!-- <a href="#modal-content1" role="button" class="btn red btn-outline" data-toggle="modal">重置密码</a> -->
	                       <a href="javascript:open();"  class="btn btn-default btn-outline" data-id="${item.id}">重置密码</a>
	                       
	                    </td>
	                </tr>
	                </c:forEach>
	            </tbody>
	            
	        </table>
	    <div id="modal-content2" style="width: 400px;height: 350px; display: none;background-color: gray;">
	        <div class="modal-content">
                <div class="modal-header">
                    <a href="javascript:close();" role="button" class="close" ></a>
                    <h4 class="modal-title">重置密码</h4>
                </div>
                <div class="modal-body form">
                    <form action="${pageContext.request.contextPath}/change-user-password.do" id="edit_form_password" class="form-horizontal form-row-seperated" method="post">
                        <div class="form-group">
                            <label class="col-sm-4 control-label">新密码：</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" name="password" class="form-control tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" dir="ltr" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);"><input type="text" id="typeahead_example_modal_3" name="typeahead_example_modal_3" class="form-control tt-input" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"><div class="tt-dataset tt-dataset-datypeahead_example_modal_3"></div></div></span> </div>
                            </div>
                        </div>
                        <div class="form-group last">
                            <label class="col-sm-4 control-label">再次输入密码：</label>
                            <div class="col-sm-8">
                                <div class="input-group">
                                    <input type="text" name="repassword" class="form-control tt-hint" readonly="" autocomplete="off" spellcheck="false" tabindex="-1" dir="ltr" style="position: absolute; top: 0px; left: 0px; border-color: transparent; box-shadow: none; opacity: 1; background: none 0% 0% / auto repeat scroll padding-box border-box rgb(255, 255, 255);"><input type="text" id="typeahead_example_modal_4" name="typeahead_example_modal_4" class="form-control tt-input" autocomplete="off" spellcheck="false" dir="auto" style="position: relative; vertical-align: top; background-color: transparent;"><pre aria-hidden="true" style="position: absolute; visibility: hidden; white-space: pre; font-family: &quot;Open Sans&quot;, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; word-spacing: 0px; letter-spacing: 0px; text-indent: 0px; text-rendering: auto; text-transform: none;"></pre><div class="tt-menu" style="position: absolute; top: 100%; left: 0px; z-index: 100; display: none;"><div class="tt-dataset tt-dataset-nba"></div><div class="tt-dataset tt-dataset-nhl"></div></div></span> </div>
                            </div>
                        </div>
                        <div class="form-actions" style="left: 60px;">
			                <div class="row" >
			                    <div class="col-md-offset-1 col-md-4">
			                    	<button type="submit" class="btn btn-success">
			                		<i class="fa fa-check"></i>&nbsp;&nbsp;保存&nbsp;&nbsp;</button>
			                		<!-- 
			                		<a href="javascript:close();" style="display: inline;" role="button" class="btn grey-salsa btn-outline" >取消</a>
			                		 -->
			                    </div>
			                </div>
	            		</div>
                    </form>
                </div>
            </div>
	    </div>
	    
	    <!-- 数据列表 END
	    <div class="modal-footer">
               		 <button type="submit" class="btn green">
                        <i class="fa fa-check"></i> 保存</button>
                    <a href="javascript:close();"  class="btn grey-salsa btn-outline" >取消</a>
                </div>
	     -->
	     
	    <!-- 底部功能区 BEGIN -->
	    <div class="row">
	        <div class="col-md-4 col-sm-12">
	            <button class="btn btn-sm btn-select-all">全选 </button>
	            <button class="btn btn-sm btn-select-invert">反选 </button>
	            <!-- <button class="btn btn-sm disabled opt-depend-select opt-batch-delete" data-opt-key="/ada-user/delete">删除 </button> -->
	        </div>
	        <!-- 底部分页 -->
	        <div class="col-md-8 col-sm-12 right">
	        	 <jsp:include page="/include/paging_footer.jsp"/>
	        </div>
	    </div>
	    <!-- 底部功能区 END -->
	</div>
</div>
</div>

<script type="text/javascript">
	$('.btn-outline').click(function(){
		 var id = $(this).attr("data-id");
		 $.ajax({  
			type: 'GET',
            url : "${pageContext.request.contextPath}/change-user-password.do?userId="+id,
            data : {"id" : id},
            success : function(ret) {
            }  
        });
	});
	function open(){
	   document.getElementById("modal-content1").style.display="";
	}
	function close(){
	   document.getElementById("modal-content1").style.display="none";
	}
	$("#edit_form2").validate({
		 errorClass: "invalid",
		 rules: {
		     password: "required",
		     repassword: "required"
		   },
		 messages: {
			 password: {required: "新密码必输."},
			 repassword: {required: "重复密码必输."
	           }
	       },
	 submitHandler: function(form) {
		  var password = $('input[name=password]').val();
		  var repassword = $('input[name=repassword]').val();
		  //alert(password+ "----->" +repassword);
		  if(password != repassword){
				toastr.error("两次输入密码不一致");
				return false;
		  }
		  
	    var submitBtn = $('button[type=submit]');
	    if(!submitBtn.hasClass("disabled")){
	   		submitBtn.addClass("disabled");
	   		$(form).ajaxSubmit(function(ret) {
	    	    	if(ret.success){
	    	    		toastr.success(ret.message);
	    	    		close();
	    	    		refreshPage();
	    	    	}else{
	    	    		toastr.error(ret.message);
	    	    	}
	    	    	$('button[type=submit]').removeClass("disabled");
	    	      return false;
	    	   });
	   }
	   
	   return false;
	 }
	});
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
		var exportUrl = "${pageContext.request.contextPath}/ada-user/export.do?"+$("#search_from").find("[value!='']").serialize();
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
      		url:"${pageContext.request.contextPath}/ada-user/delete.do?id="+ids,
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
                <h3 class="list-heading" style="color: #fff">重置密码</h3>
                <div class="list-items">
					<form id="edit_form" action="${pageContext.request.contextPath}/ada-user/update.do" class="form-horizontal" method="post">
			        	<input type="hidden" name="id">
		               	<div class="form-body">
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">用户名</label>	
			               		<div class="col-md-8">
					                <input type="text" name="username" class="form-control"  maxlength="24" readonly="readonly">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">新密码</label>	
			               		<div class="col-md-8">
					                <input type="text" name="password" class="form-control"  maxlength="32" placeholder="输入新密码">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">昵称</label>	
			               		<div class="col-md-8">
					                <input type="text" name="nickname" class="form-control"  maxlength="64" readonly="readonly">
								</div>
			               	</div>
			                	<!--  
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">真名</label>	
			               		<div class="col-md-8">
					                <input type="text" name="realname" class="form-control"  maxlength="24">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">身份证号码</label>	
			               		<div class="col-md-8">
					                <input type="text" name="idNo" class="form-control"  maxlength="24">
								</div>
			               	</div>
			                -->
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">邮箱</label>	
			               		<div class="col-md-8">
									<textarea rows="3" cols="40" name="email" class="form-control"  maxlength="128" readonly="readonly"></textarea>
								</div>
			               	</div>
			               	<!--
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">手机</label>	
			               		<div class="col-md-8">
					                <input type="text" name="phone" class="form-control"  maxlength="16">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">生日</label>	
			               		<div class="col-md-8">
									<input name="birthday" class="form-control form-control-inline datepick" type="text" data-date-format="yyyy-mm-dd" value="<fmt:formatDate value="${adaUser.birthday}" pattern="yyyy-MM-dd"/>"  readonly="readonly">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">性别</label>	
			               		<div class="col-md-8">
									<select name="sex" class="form-control" >
									<c:forEach items="${allSexs}" var="e">
									<option value="${e.key}">${e.value}</option>
									</c:forEach>
									</select>
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">头像URL</label>	
			               		<div class="col-md-8">
									<textarea rows="3" cols="40" name="headImgUrl" class="form-control"  maxlength="256"></textarea>
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">省ID</label>	
			               		<div class="col-md-8">
					                <input type="text" name="provinceId" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">城市ID</label>	
			               		<div class="col-md-8">
					                <input type="text" name="cityId" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">地区ID</label>	
			               		<div class="col-md-8">
					                <input type="text" name="districtId" class="form-control"  maxlength="10">
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">家庭住址</label>	
			               		<div class="col-md-8">
					                <input type="text" name="homeAddress" class="form-control"  maxlength="64">
								</div>
			               	</div>
			               	-->
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">状态</label>	
			               		<div class="col-md-8">
									<select name="status" class="form-control" disabled="disabled">
									<c:forEach items="${allStatuss}" var="e">
									<option value="${e.key}">${e.value}</option>
									</c:forEach>
									</select>
								</div>
			               	</div>
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">是否管理员</label>	
			               		<div class="col-md-8">
									<select name="isAdmin" class="form-control" disabled="disabled">
									<c:forEach items="${allIsAdmins}" var="e">
									<option value="${e.key}">${e.value}</option>
									</c:forEach>
									</select>
								</div>
			               	</div>
			               	
			               	<!--  
			               	<div class="form-group">
			               		<label class="col-md-4 control-label">创建时间</label>	
			               		<div class="col-md-8">
									<input name="createTime" class="form-control form-control-inline datetimepick" type="text" data-date-format="yyyy-mm-dd hh:ii:ss" value="<fmt:formatDate value="${adaUser.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"  readonly="readonly">
								</div>
			               	</div>
			               	-->
		               	</div>  
			        </form> 
			    </div>
            </div>
        </div>
        <div class="inner-content staff-quick-slider clearfix">
        	<!-- <span class="fa fa-trash-o opt-edit-delete"></span> -->
            <button id="opt-cancel" class="btn btn-default">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
            <button id="opt-update" class="btn btn-success" ><i class="fa fa-check"></i>&nbsp;&nbsp;保存&nbsp;&nbsp;</button>  
        </div>
    </div>
</div>
<script type="text/javascript">
	function formatDate(date) {
		var y = date.getFullYear();
	    var m = date.getMonth()+1;//获取当前月份的日期
	    var d = date.getDate();
	    m = m<10? "0"+m : ""+m;
	    d = d<10? "0"+d : ""+d;
	    return y+"-"+m+"-"+d;
	} 
	function formatDate2(date) {
		var y = date.getFullYear();
	    var m = date.getMonth()+1;//获取当前月份的日期
	    var d = date.getDate();
	    var h = date.getHours();
	    var min = date.getMinutes();
	    var s = date.getSeconds();
	    m = m<10? "0"+m : ""+m;
	    d = d<10? "0"+d : ""+d;
	    h = h<10? "0"+h : ""+h;
	    min = min<10? "0"+min : ""+min;
	    s = s<10? "0"+s : ""+s;
	    return y+"-"+m+"-"+d+" "+h+":"+min+":"+s;
	} 
	//编辑
    $('.opt-edit').click(function(){
    	 var id = $(this).attr("data-id");
    		 $.ajax({  
                 url : "${pageContext.request.contextPath}/ada-user/get.do",
                 data : {"id" : id},
                 success : function(ret) {
                	    var bri = ret.entity.birthday;
                	    var cre = ret.entity.createTime;
                	    if(bri != null && bri != ''){
                	    	bri = formatDate(new Date(bri)); 
                	    }
                	    if(cre != null && cre != ''){
                	    	cre = formatDate2(new Date(cre)); 
                	    }
                	    
                 		$("#edit_form").find("[name='id']").val(ret.entity.id);
                 		$("#edit_form").find("[name='username']").val(ret.entity.username);
                 		$("#edit_form").find("[name='password']").val("");
                 		$("#edit_form").find("[name='nickname']").val(ret.entity.nickname);
                 		$("#edit_form").find("[name='realname']").val(ret.entity.realname);
                 		$("#edit_form").find("[name='idNo']").val(ret.entity.idNo);
                 		$("#edit_form").find("[name='email']").val(ret.entity.email);
                 		$("#edit_form").find("[name='phone']").val(ret.entity.phone);
                 		$("#edit_form").find("[name='birthday']").val(bri); 
                 		$("#edit_form").find("[name='sex']").val(ret.entity.sex);
                 		$("#edit_form").find("[name='headImgUrl']").val(ret.entity.headImgUrl);
                 		$("#edit_form").find("[name='provinceId']").val(ret.entity.provinceId);
                 		$("#edit_form").find("[name='cityId']").val(ret.entity.cityId);
                 		$("#edit_form").find("[name='districtId']").val(ret.entity.districtId);
                 		$("#edit_form").find("[name='homeAddress']").val(ret.entity.homeAddress);
                 		$("#edit_form").find("[name='status']").val(ret.entity.status);
                 		$("#edit_form").find("[name='isAdmin']").val(ret.entity.isAdmin);
                 		$("#edit_form").find("[name='createTime']").val(cre);
                 		
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
	              	 	toastr.success('更新成功');
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
          		url:"${pageContext.request.contextPath}/ada-user/delete.do?id="+id,
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
<script src="assets/jquery-ui.min.js" type="text/javascript"></script>
<script src="assets/ui-modals.min.js" type="text/javascript"></script>
<script src="assets/handlebars.min.js" type="text/javascript"></script>
<script src="assets/typeahead.bundle.min.js" type="text/javascript"></script>
<script src="assets/components-typeahead.min.js" type="text/javascript"></script>

<!-- 侧拉编辑栏 END -->

