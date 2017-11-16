<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<li class="nav-item"><a href="${pageContext.request.contextPath}/dashboard.jhtm"            class="ajaxify nav-link" ><i class="icon-home"></i><span class="title">首页</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/kpi-bus-daily/list.jhtm"              class="ajaxify nav-link" ><i class="icon-bar-chart"></i><span class="title">统计报表</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/order-info/list.jhtm"            class="ajaxify nav-link" ><i class="icon-book-open"></i><span class="title">订单管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/manual-order/list.jhtm?search_EQ_status=0"            class="ajaxify nav-link" ><i class="icon-mouse"></i><span class="title">人工处理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/tmall-recharge-item/list.jhtm" class="ajaxify nav-link" ><i class="icon-briefcase"></i><span class="title">天猫商品</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/tmall-recharge-order/list.jhtm" class="ajaxify nav-link" ><i class="icon-briefcase"></i><span class="title">天猫订单</span></a></li>
<li class="nav-item">
      <a href="javascript:;" class="nav-link nav-toggle">
      	  <i class="icon-bubbles"></i>
          <span class="title">公众号管理</span>
          <span class="arrow"></span>
      </a>
	  <ul class="sub-menu" style="display: none;">
	      <li class="nav-item"><a href="/advanced/selfmenu" target="_blank" ><i class="icon-bubbles"></i><span class="title">自定义菜单</span></a></li>
		  <li class="nav-item"><a href="${pageContext.request.contextPath}/weixin/autoreply/list.jhtm"              class="ajaxify nav-link" ><i class="icon-speech"></i><span class="title">自动回复</span></a></li>
		  <li class="nav-item"><a href="${pageContext.request.contextPath}/variable/select-template.jhtm"   class="ajaxify nav-link" ><i class="icon-directions"></i><span class="title">界面设置</span></a></li>
		  <li class="nav-item"><a href="${pageContext.request.contextPath}/banner/list.jhtm"              class="ajaxify nav-link" ><i class=" icon-picture"></i><span class="title">横幅管理</span></a></li>
	</ul>
</li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/product/list.jhtm?search_EQ_status=1"               class="ajaxify nav-link" ><i class="icon-grid"></i><span class="title">产品管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/provider/list.jhtm"              class="ajaxify nav-link" ><i class="icon-share"></i><span class="title">供应商管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/user-info/list.jhtm"              class="ajaxify nav-link" ><i class="icon-users"></i><span class="title">用户管理</span></a></li>
<li class="nav-item"><a href="${pageContext.request.contextPath}/variable/list.jhtm"              class="ajaxify nav-link" ><i class="icon-settings"></i><span class="title">系统设置</span></a></li>





