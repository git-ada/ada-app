<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="btn-group">
       <button class="btn btn-default" <c:if test="${page.currentPage>1}">onclick="on_page_submit(${page.currentPage-1});"</c:if>>
           &nbsp;&nbsp;<i class="fa fa-angle-left"></i>&nbsp;
       </button> 
       <button class="btn btn-default">${page.currentPage}/${page.totalPage}</button>
       <button class="btn btn-default" <c:if test="${page.currentPage<page.totalPage}">onclick="on_page_submit(${page.currentPage+1});"</c:if>>
           &nbsp;&nbsp;<i class="fa fa-angle-right"></i>&nbsp;
       </button>
      </div>
      
      <script type="text/javascript">
		function on_page_submit(page){
			   $("#page").val(page);
			   $("#search_from").submit(); 
		};
</script>