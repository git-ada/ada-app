<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<li class="nav-item"><a href="${pageContext.request.contextPath}/dashboard.jhtm?dataType=domain&firstTd=&top=&isRefresh=true&isRetrun=false" class="ajaxify nav-link" ><i class="icon-home"></i><span class="title">全站统计</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/dashboardHistry.jhtm?dataType=domain" class="ajaxify nav-link" ><i class="icon-bar-chart"></i><span class="title">历史统计</span></a></li>
<%-- <li class="nav-item"><a href="${pageContext.request.contextPath}/dashboard.jhtm?dataType=domainAd" class="ajaxify nav-link" ><i class="icon-bar-chart"></i><span class="title">广告入口</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/dashboard.jhtm?dataType=domainNotAd" class="ajaxify nav-link" ><i class="icon-bar-chart"></i><span class="title">非广告入口</span></a></li> --%>

<li class="nav-item"><a href="${pageContext.request.contextPath}/ada-site-stat/list.jhtm" class="ajaxify nav-link" ><i class="icon-graph"></i><span class="title">站点统计</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/ada-domain-stat/stat.jhtm" class="ajaxify nav-link" ><i class="icon-bar-chart"></i><span class="title">域名统计</span></a></li>

<%-- <li class="nav-item"><a href="${pageContext.request.contextPath}/ada-channel-stat/stat.jhtm" class="ajaxify nav-link" ><i class="icon-bar-chart"></i><span class="title">渠道统计</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/ada-channel/list.jhtm" class="ajaxify nav-link" ><i class="icon-share"></i><span class="title">渠道管理</span></a></li> --%>
<li class="nav-item"><a href="${pageContext.request.contextPath}/ada-target-page/list.jhtm" class="ajaxify nav-link" ><i class="icon-docs"></i><span class="title">目标页</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/ada-ad-page/list.jhtm" class="ajaxify nav-link" ><i class="icon-docs"></i><span class="title">广告页</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/site-jscode.jhtm" class="ajaxify nav-link" ><i class="icon-layers"></i><span class="title">统计代码</span></a></li>


<!-- 

<li class="nav-item"><a href="${pageContext.request.contextPath}/hgr/dashboard.jhtm?dataType=domain" class="ajaxify nav-link" ><i class="icon-home"></i><span class="title">全站统计</span></a></li>

 -->
