package com.ada.app.web.support;

import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 拦截记录日志
 *
 * @author wanghl.cn
 * @date 2016-11-13 上午11:05:58
 */
public class LoggerHandler implements HandlerInterceptor{
	
	private final static Log log = LogFactory.getLog(LoggerHandler.class);
	private final static String charset = "UTF-8";

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		log.debug("initContext");
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		log.debug("postHandle");
	}

	@Override
	
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		log.debug("logging");
		
		try {
//			Long acceptTime = RequestContextHolder.getContext().getAcceptTime().getTime();
			String realIp = request.getHeader("X-Real-IP"); //请求负载均衡器,记录的远程真实客户端地址
			//X-Forwarded-For;
//			RequestContext context = RequestContextHolder.getContext();
			
			//String remoteIp = realIp!=null?realIp:request.getRemoteHost();
			StringBuffer text = new StringBuffer().
					//append(remoteIp).append(" ").
					append(request.getMethod()).append(" ").
//					append(request.getRequestURI());
					append(request.getRequestURL());
			
//			if(request.getQueryString()!=null){
//				text.append("?").append(URLDecoder.decode(request.getQueryString(), charset));
//			}
		
			text.append(" ");
			Set<String> ParameterKeys = request.getParameterMap().keySet();
			Iterator<String> i =ParameterKeys.iterator();
			while(i.hasNext()){
				String key = i.next();
				String value = request.getParameter(key);
				text.append(key);
				text.append("=");
				if(value!=null){
					text.append(value);
				}
				if(i.hasNext()){
					text.append("&");
				}
			}
			
			text.append(" ");
//			text.append(context.getResponseBody());
			
			if(ex != null){
				text.append(",error->"+ex.getMessage());
			}
			
			try {
//				if(acceptTime !=null){
//					text.append(" ");
//					text.append(System.currentTimeMillis()-acceptTime);
//					text.append("ms");
//				}
			} catch (Exception e) {
				log.error(""+e.getMessage(),e);
			}
			
//			if(context.isSuccessful()){
//				log.info(text);
//			}else{
//				if(RequestContextHolder.getContext().isUnknownException()){
//					log.error(text);
//				}else{
//					log.warn(text);
//				}
//			}
			
		} catch (Exception e) {
			e.printStackTrace();
			log.error(""+e.getMessage(),e);
		}
		
//		RequestContextHolder.removeContext();
		
		log.debug("logged");
	}

}
