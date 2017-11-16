package com.ada.app.web.support;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 上下文存储
 */
public class RequestContext implements HandlerInterceptor{

	private final static Log log = LogFactory.getLog(RequestContext.class);
	private static ThreadLocal<Map<String,Object>> threadLocal = new ThreadLocal<Map<String,Object>>();
	
	private final static String CONTEXT_REQUEST_KEY = "_REQUEST";
	private final static String CONTEXT_RESPONSE_KEY = "_RESPONSE";

	protected static Map<String,Object> getContext(){
		Map<String,Object> context = threadLocal.get();
		if(context == null){
			context = new HashMap<String,Object >();
			threadLocal.set(context);
		}
		return context;
	}

	public static HttpServletRequest getRequest(){
		return (HttpServletRequest)getContext().get(CONTEXT_REQUEST_KEY);
	}
	
	protected static void setRequest(HttpServletRequest request){
		getContext().put(CONTEXT_REQUEST_KEY, request);
	}
	
	public static HttpServletResponse getResponse(){
		return (HttpServletResponse)getContext().get(CONTEXT_RESPONSE_KEY);
	}
	
	protected static void setRequest(HttpServletResponse response){
		getContext().put(CONTEXT_RESPONSE_KEY, response);
	}
	
	protected static void removeContext(){
		threadLocal.remove();
		log.debug("removeContext");
	}
	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object arg2) throws Exception {
		RequestContext.setRequest(request);
		RequestContext.setRequest(response);
		return true;
	}
	

	@Override
	public void afterCompletion(HttpServletRequest request,HttpServletResponse response, Object arg2, Exception arg3)
			throws Exception {
		RequestContext.removeContext();
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,Object arg2, ModelAndView arg3) throws Exception {
	}

}
