<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<li class="nav-item"><a href="${pageContext.request.contextPath}/dashboard.jhtm"            class="ajaxify nav-link" ><i class="icon-home"></i><span class="title">首页</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/order-info/list.jhtm"            class="ajaxify nav-link" ><i class="icon-book-open"></i><span class="title">订单管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/manual-order/list.jhtm?search_EQ_status=0"            class="ajaxify nav-link" ><i class="icon-mouse"></i><span class="title">人工处理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/product/list.jhtm"               class="ajaxify nav-link" ><i class="icon-grid"></i><span class="title">产品管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/pricing/list.jhtm"               class="ajaxify nav-link" ><i class="icon-calculator"></i><span class="title">代理价格</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/provider/list.jhtm"              class="ajaxify nav-link" ><i class="icon-share"></i><span class="title">供应商管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/user-info/list.jhtm"              class="ajaxify nav-link" ><i class="icon-users"></i><span class="title">用户管理</span></a></li>
<li class="nav-item"><a href="/advanced/selfmenu"     target="_blank"        ><i class="icon-settings"></i><span class="title">公众号管理</span></a></li>