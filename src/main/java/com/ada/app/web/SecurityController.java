package com.ada.app.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ada.app.service.SecurityService;
import com.ada.app.web.support.SecurityHandler.NotNeedLogin;

import cn.com.jiand.mvc.framework.web.support.JsonResult;

@Controller
public class SecurityController{
	
	@Autowired
	private SecurityService securityService;
	
	private String indexPage = "/index.jhtm";  /** 默认主页 **/
	private String loginPage = "/login.jhtm";  /** 默认登录页 **/
	private Integer  i= 0;
	
	@RequestMapping(value = "login",method=RequestMethod.GET)
	@NotNeedLogin
	public String login(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		if(securityService.isLogin()){
			try {
				response.sendRedirect(request.getContextPath()+indexPage);
			} catch (Exception e) {
			}
			return null;
		}else{
			return "login";
		}
	}
	

	@RequestMapping(value = "login",method=RequestMethod.POST)
	@ResponseBody
	@NotNeedLogin
	public JsonResult login(HttpServletRequest request,HttpServletResponse response,
							@RequestParam("username") String username,
							@RequestParam("password") String password,
							@RequestParam(value="remember",required=false,defaultValue="0") Integer remember,
							@RequestParam(value="verCode",required=false) String verCode) {
		
		JsonResult result = new JsonResult();
		try {
			securityService.login(username, password,verCode,(remember==1));
			result.setSuccess(true);
			result.setMessage("登录成功");
			
			Map map = new HashMap();
			map.put("page", request.getContextPath()+indexPage);
			
			result.setData(map);
		} catch (Exception e) {
			result.setSuccess(false);
			result.setMessage(e.getMessage());
		}
		
		
		
		return result;
	}
	
	@RequestMapping(value = "logout")
	@NotNeedLogin
	public void logout(HttpServletRequest request,HttpServletResponse response) {
		securityService.logout();
		try {
			response.sendRedirect(request.getContextPath()+loginPage);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value = "change-password",method=RequestMethod.GET)
	public String toChangePassword(HttpServletRequest request,HttpServletResponse response) {
		return "change-password";
	}
	
	@RequestMapping(value = "change-password",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult changePassword(HttpServletRequest request,HttpServletResponse response,
									@RequestParam("oldPassword") String oldPassword,@RequestParam("newPassword") String newPassword) {
		JsonResult ret = new JsonResult();
		try {
			securityService.changePassword(oldPassword, newPassword);
			ret.setSuccess(true);
			ret.setMessage("修改成功");
		} catch (Exception e) {
			ret.setSuccess(false);
			ret.setMessage("修改失败,"+e.getMessage());
		}
		
		return ret;
	}
	@RequestMapping(value = "change-user-password",method=RequestMethod.GET)
	public void toChangePassword2(HttpServletRequest request,HttpServletResponse response,@RequestParam("userId") String userId) {
		i = Integer.valueOf(userId);
		System.out.println(i);
	}
	
	@RequestMapping(value = "change-user-password",method=RequestMethod.POST)
	@ResponseBody
	public JsonResult changePassword2(HttpServletRequest request,HttpServletResponse response,
									@RequestParam("password") String newPassword) {
		JsonResult ret = new JsonResult();
		System.out.println(newPassword+" ----> "+i);
		try {
			securityService.changePassword2(newPassword, i);
			ret.setSuccess(true);
			ret.setMessage("修改成功");
		} catch (Exception e) {
			ret.setSuccess(false);
			ret.setMessage("修改失败,"+e.getMessage());
		}
		
		return ret;
	}
}
