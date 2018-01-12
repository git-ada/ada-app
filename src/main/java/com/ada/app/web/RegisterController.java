package com.ada.app.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.jiand.mvc.framework.utils.MD5s;

import com.ada.app.constant.SessionKey;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaUserDao;
import com.ada.app.domain.AdaSite;
import com.ada.app.domain.AdaUser;
import com.ada.app.service.SecurityService;
import com.ada.app.service.impl.SecurityServiceImpl;
import com.ada.app.util.Dates;
import com.ada.app.util.Sessions;
import com.ada.app.web.support.SecurityHandler.NotNeedLogin;
import com.alibaba.fastjson.JSONObject;

@Controller
public class RegisterController {
	private final static Log log = LogFactory.getLog(SecurityServiceImpl.class);
	@Autowired
	private AdaUserDao userDao;
	@Autowired
	private SecurityService securityService;
	@Autowired
	private AdaSiteDao siteDao;
	
	@RequestMapping(value = "/queryByUserName")
	@NotNeedLogin
	public void queryByUserName(HttpServletRequest request,HttpServletResponse response, Model model,String username){
		System.out.println();
		String code = "-100";
		AdaUser user = userDao.findByUsername(username);
		Map json_map = new HashMap();
		if(user!=null){
			code = "100";
		}
		
		json_map.put("code", code);
		JSONObject json = new JSONObject(json_map);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(json);
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("saveRegister")
	@NotNeedLogin
	public String saveRegister(HttpServletRequest request,HttpServletResponse response,
			Model model,String username,String password,String useremail){
		AdaUser user = new AdaUser();
		if(username!=null && password!=null){
			user.setUsername(username);//设置用户名
			user.setPassword(MD5s.encode(password).toLowerCase());//设置密码
			user.setCreateTime(Dates.now());//设置创建时间
			user.setEmail(useremail);
		    user = userDao.save(user);//保存新用户
			
			if(user!=null){//注册成功,自动登录并进入首页
				try {
					/** 给新用户 创建默认站点 **/
					AdaSite adaSite = new AdaSite();
					adaSite.setSiteName(username+"的站点");
					adaSite.setUserId(user.getId());
					adaSite.setCreateTime(Dates.now());
					adaSite = siteDao.save(adaSite);
					
					/** 设置当前登陆人　**/
					Sessions.setAttribute(SessionKey.LOGIN_USER.code(), user);
					
					if(Sessions.getCurrentSite() == null){
						
						/** 设置默认站点 **/
						Sessions.setCurrentSite(adaSite);
						log.info(Sessions.getLoginUser().getNickname() +" 登入，设置默认站点->"+adaSite.getId()+":" +adaSite.getSiteName());
					}
					response.sendRedirect(request.getContextPath()+"/index.jhtm");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		return "login";
	} 
}
