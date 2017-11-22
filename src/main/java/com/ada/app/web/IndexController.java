package com.ada.app.web;

import java.io.PrintWriter;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.jiand.mvc.framework.utils.Dates;

import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomain;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaSite;
import com.ada.app.domain.AdaSiteStat;
import com.ada.app.service.AdaChannelStatService;
import com.ada.app.service.SecurityService;
import com.ada.app.service.StatService;
import com.ada.app.util.Sessions;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

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
	@Autowired
	private AdaSiteStatDao adaSiteStatDao;
	@Autowired
	private StatService statService;
	@Autowired
	private AdaChannelDao adaChannelDao;
	@Autowired
	private AdaChannelStatService adaChannelStatService;
	@Autowired
	private AdaDomainDao adaDomainDao;
	

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

	
	@RequestMapping(value = "dashboard")
	public String now(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		
		/** 获取当前站点统计信息 **/
		Date today = Dates.todayStart();
		AdaSiteStat siteStat = statService.statSite(adaSite.getId(), today);
		
		/** 获取站点下渠道统计信息 **/
		Map sumMap = getChannelStat_list(today);
		List<Map> ChannelStat_list = (List<Map>) sumMap.get("ChannelStat_list");
		List<Map> DomainStat_list = (List<Map>) sumMap.get("DomainStat_list");
		 
		 model.addAttribute("pageResults", ChannelStat_list);
		 model.addAttribute("channelSumIP", sumMap.get("channelSumIP"));/** 渠道ip总数 **/
		 model.addAttribute("channelSumPV", sumMap.get("channelSumPV"));/** 渠道PV总数 **/
		 model.addAttribute("DomainStat_list", DomainStat_list);
		 model.addAttribute("domainSumIP", sumMap.get("domainSumIP"));
		 model.addAttribute("domainSumPV", sumMap.get("domainSumPV"));
		 
		 model.addAttribute("siteStat", siteStat);
		return "dashboard";
	}
	
	@RequestMapping("ajaxLoadData")
	public void ajaxLoadData(HttpServletRequest request,HttpServletResponse response ,Model model){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		Integer pageNo=Integer.parseInt(request.getParameter("pageNo"));
		
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.graphicList(adaSite.getId(),pageNo));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/** ajax刷新页面信息 **/
	@RequestMapping("ajaxRefreshPage")
	public void ajaxRefreshPage(HttpServletRequest request,HttpServletResponse response ,Model model){
		
		JSONObject json=new JSONObject();
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		
		/** 获取当前站点统计信息 **/
		Date today = Dates.todayStart();
		AdaSiteStat siteStat = statService.statSite(adaSite.getId(), today);
		
		/** 获取站点下渠道统计信息 **/
		Map sumMap = getChannelStat_list(today);
		List<Map> ChannelStat_list = (List<Map>) sumMap.get("ChannelStat_list");
		List<Map> DomainStat_list = (List<Map>) sumMap.get("DomainStat_list");
		
		 json.put("siteStat", siteStat);
		 json.put("channelSumIP", sumMap.get("channelSumIP"));/** 渠道ip总数 **/
		 json.put("channelSumPV", sumMap.get("channelSumPV"));/** 渠道PV总数 **/
		 json.put("ChannelStat_list", ChannelStat_list);
		 json.put("domainSumIP", sumMap.get("domainSumIP"));
		 json.put("domainSumPV", sumMap.get("domainSumPV"));
		 json.put("DomainStat_list", DomainStat_list);
		 
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
	
	
	@RequestMapping(value = "site-jscode")
	public String siteJSscode(HttpServletRequest request,HttpServletResponse response, Model model) {
//		String jscode = "&lt;script id=&quot;adajs&quot; src=&quot;"+cdnServer+"/log.js?siteId="+Sessions.getCurrentSite().getId()+"&quot; type=&quot;text/javascript&quot;&gt;&lt;/script&gt;";
		String jscode = "<script id=\"adajs\" src=\""+cdnServer+"/log.js?siteId="+Sessions.getCurrentSite().getId()+"\" type=\"text/javascript\"></script>";
		model.addAttribute("jscode", jscode);
		
		return "ada-site-jscode";
	}
	
	
	/**
	 * 获取图形列表的数据
	 */
	protected JSONObject graphicList(Integer siteId,Integer pageNo) {
		
		JSONArray array=new JSONArray();
		JSONObject json=new JSONObject();
		try {
			if(pageNo== null || pageNo<1){
				json.put("success", false);
				json.put("message", "暂无统计数据！");
				return json;
			}
			List<AdaSiteStat> list = this.adaSiteStatDao.findBySiteIdOrderByDate(siteId,(pageNo-1)*30);
			
			if(null==list || list.isEmpty()){
				json.put("success", false);
				json.put("message", "暂无统计数据！");
				return json;
			}
			for (int i=list.size()-1;i>=0; i--) { 
				AdaSiteStat item = list.get(i);
				JSONObject jsonitem=new JSONObject();
				jsonitem.put("date", new SimpleDateFormat("yyyy-MM-dd").format(item.getDate())); // 统计日期
				jsonitem.put("distance", item.getPv());// 访问量
				jsonitem.put("duration", item.getIp()); // IP数
				
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					jsonitem.put("color", "#EF3F3F");
					jsonitem.put("lcolor", "red");
					jsonitem.put("alpha", 1);
				}
				array.add(jsonitem);
			}
			
			json.put("success", true);
			json.put("nextMonth", pageNo-1);
			json.put("lastMonth", pageNo+1);
			json.put("order", array);
			
		} catch (Exception e) {
			log.error("查询失败,msg->"+e.getMessage(),e);
		}
		
		return json;
	}

	public Map getChannelStat_list(Date date){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		
		/** 渠道列表数据 **/
		List<Map> ChannelStat_list = new ArrayList<Map>();
		 List<AdaChannel> channels = adaChannelDao.findBySiteId(adaSite.getId());
		 Integer channelSumIP = 0;/** 渠道ip总数 **/
		 Integer channelSumPV = 0;/** 渠道PV总数 **/
		 for (AdaChannel adaChannel : channels) {
			 AdaChannelStat channelStat =  statService.statChannel(adaSite.getId(), adaChannel.getId(), date);
			 Map map = new HashMap();
			 map.put("channelName",adaChannelDao.findById(channelStat.getChannelId()).getChannelName());
			 map.put("ip", channelStat.getIp());
			 map.put("pv", channelStat.getPv());
			 map.put("clickip1", channelStat.getClickip1());
			 map.put("clickip2", channelStat.getClickip2());
			 map.put("clickip3", channelStat.getClickip3());
			 map.put("clickip4", channelStat.getClickip4());
			 map.put("targetpageip", channelStat.getTargetpageip());
			 NumberFormat numberFormat = NumberFormat.getInstance();     
			 numberFormat.setMaximumFractionDigits(2);
			 if(channelStat.getIp()!=null && channelStat.getIp()>0){
				 map.put("c1", numberFormat.format((float)channelStat.getClickip1()/(float)channelStat.getIp()*100));
				 map.put("c2", numberFormat.format((float)channelStat.getClickip2()/(float)channelStat.getIp()*100));
				 map.put("c3", numberFormat.format((float)channelStat.getClickip3()/(float)channelStat.getIp()*100));
				 map.put("c4", numberFormat.format((float)channelStat.getClickip4()/(float)channelStat.getIp()*100));
				 map.put("tgp", numberFormat.format((float)channelStat.getTargetpageip()/(float)channelStat.getIp()*100));
			 }else{
				 map.put("c1", 0);
				 map.put("c2", 0);
				 map.put("c3", 0);
				 map.put("c4", 0);
				 map.put("tgp", 0);
			 }
			 channelSumIP+=channelStat.getIp();
			 channelSumPV+=channelStat.getPv();
			 ChannelStat_list.add(map);
		}
		
		 /** 根据ip数排序 **/
		 Collections.sort(ChannelStat_list,new Comparator<Map>(){
				public int compare(Map map1, Map map2) {
					Integer integer = (Integer) map1.get("ip");
					Integer integer2 = (Integer) map2.get("ip");
					return integer2.compareTo(integer);
				}
	        });
		
		 
		 /** 域名列表信息 **/
		 List<Map> DomainStat_list = new ArrayList<Map>();
		 List<AdaDomain> domains = this.adaDomainDao.findBySiteId(adaSite.getId());
		 Integer domainSumIP = 0;/** 渠道ip总数 **/
		 Integer domainSumPV = 0;/** 渠道PV总数 **/
		 for (AdaDomain domain : domains) {
			AdaDomainStat domainStat = this.statService.statDomain(adaSite.getId(), domain.getId(), date);
			Map map = new HashMap();
			 map.put("domain",adaDomainDao.findById(domainStat.getDomainId()).getDomain());
			 map.put("ip", domainStat.getIp());
			 map.put("pv", domainStat.getPv());
			 map.put("clickip1", domainStat.getClickip1());
			 map.put("clickip2", domainStat.getClickip2());
			 map.put("clickip3", domainStat.getClickip3());
			 map.put("clickip4", domainStat.getClickip4());
			 map.put("targetpageip", domainStat.getTargetpageip());
			 NumberFormat numberFormat = NumberFormat.getInstance();     
			 numberFormat.setMaximumFractionDigits(2);
			 if(domainStat.getIp()!=null && domainStat.getIp()>0){
				 map.put("c1", numberFormat.format((float)domainStat.getClickip1()/(float)domainStat.getIp()*100));
				 map.put("c2", numberFormat.format((float)domainStat.getClickip2()/(float)domainStat.getIp()*100));
				 map.put("c3", numberFormat.format((float)domainStat.getClickip3()/(float)domainStat.getIp()*100));
				 map.put("c4", numberFormat.format((float)domainStat.getClickip4()/(float)domainStat.getIp()*100));
				 map.put("tgp", numberFormat.format((float)domainStat.getTargetpageip()/(float)domainStat.getIp()*100));
			 }else{
				 map.put("c1", 0);
				 map.put("c2", 0);
				 map.put("c3", 0);
				 map.put("c4", 0);
				 map.put("tgp", 0);
			 }
			 domainSumIP+=domainStat.getIp();
			 domainSumPV+=domainStat.getPv();
			 DomainStat_list.add(map);
		}
		 /** 根据ip数排序 **/
		 Collections.sort(DomainStat_list,new Comparator<Map>(){
				public int compare(Map map1, Map map2) {
					Integer integer = (Integer) map1.get("ip");
					Integer integer2 = (Integer) map2.get("ip");
					return integer2.compareTo(integer);
				}
	        });
		 
		 Map map = new HashMap();
		 map.put("ChannelStat_list", ChannelStat_list);
		 map.put("channelSumIP", channelSumIP);
		 map.put("channelSumPV", channelSumPV);
		 
		 map.put("DomainStat_list", DomainStat_list);
		 map.put("domainSumIP", domainSumIP);
		 map.put("domainSumPV", domainSumPV);
		 
		 return map;
	}
	
}
