package com.ada.app.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ada.app.dao.AdaSiteDao;
import com.ada.app.domain.AdaSite;
import com.ada.app.service.SecurityService;
import com.ada.app.util.Sessions;

@Controller
public class IndexController {
	
	private final static Log log = LogFactory.getLog(IndexController.class);
	
	@Value("${platform.name:}")
	private String platformName;
	
	@Value("${cdn.server:}")
	private String cdnServer;
	
	@Autowired
	private SecurityService securityService;
	
	@Autowired
	private AdaSiteDao siteDao;

	@RequestMapping(value = "index")
	public String index(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		
		if(Sessions.getCurrentSite() == null){
			List<AdaSite> adaSites = siteDao.findByUserId(Sessions.getLoginUser().getId());
			if(adaSites!=null && !adaSites.isEmpty()){
				AdaSite currentSite = adaSites.get(0);
				/** 设置默认站点 **/
				Sessions.setCurrentSite(currentSite);
				log.info(Sessions.getLoginUser().getNickname() +" 登入，设置默认站点->"+currentSite.getId()+":" +currentSite.getSiteName());
			}
		}
		
		model.addAttribute("user",Sessions.getLoginUser());
		model.addAttribute("platformName", Sessions.getCurrentSite().getSiteName());
	
		return "index";
	}

	@RequestMapping(value = "site-jscode")
	public String siteJSscode(HttpServletRequest request,HttpServletResponse response, Model model) {
//		String jscode = "&lt;script id=&quot;adajs&quot; src=&quot;"+cdnServer+"/log.js?siteId="+Sessions.getCurrentSite().getId()+"&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;";
		String jscode = "<script id=\"adajs\" src=\""+cdnServer+"/log.js?siteId="+Sessions.getCurrentSite().getId()+"\" type=\"text/javascript\"></script>";
		model.addAttribute("jscode", jscode);
		
		return "ada-site-jscode";
	}
}
