package com.ada.app.web.support;

import javax.servlet.ServletContext;

import org.springframework.web.context.ServletContextAware;

/**
 * 初始化上下文参数
 * @author wanghl.cn
 * @date 2016-11-29 下午12:01:44
 */
public class InitializeContext implements ServletContextAware{
	
	/** CDN 域名地址 **/
	private String cdn;
	/** 上下文地址 **/
	private String ctx;

	public void setServletContext(ServletContext servletContext) {
		servletContext.setAttribute("cdn", cdn);
		servletContext.setAttribute("ctx", servletContext.getContextPath());
	}

	public String getCdn() {
		return cdn;
	}

	public void setCdn(String cdn) {
		this.cdn = cdn;
	}

}
