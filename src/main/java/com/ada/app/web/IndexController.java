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
import java.util.Set;

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

import com.ada.app.bean.DomainAreaStat;
import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaDomainAd15mStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainNotAd15mStatDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomain;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
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
	
	@Value("${log.server:}")
	private String logServer;
	
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
	@Autowired
	private AdaDomainAd15mStatDao ad15mStatDao;
	@Autowired
	private AdaDomainNotAd15mStatDao notAd15mStatDao;
	
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

	/**
	 * 实时数据页面 获取域名列表数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "dashboard")
	public String now(HttpServletRequest request,HttpServletResponse response, Model model) {
		
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		
		/** 获取当前站点统计信息 **/
		Date today = Dates.todayStart();
		AdaSiteStat siteStat = statService.statSite(adaSite.getId(), today);
		
		/** 获取站点下域名统计信息 **/
		Long startTime = System.currentTimeMillis();
		Map sumMap = getDomainStat_list(today);
		Long endTime = System.currentTimeMillis();
		Long cost = endTime - startTime;
		log.info("实时数据页面获取数据列表耗时：--->"+cost+"ms");
		//List<Map> ChannelStat_list = (List<Map>) sumMap.get("ChannelStat_list");
		List<Map> DomainStat_list = (List<Map>) sumMap.get("DomainStat_list");
		 
		 //model.addAttribute("pageResults", ChannelStat_list);
		// model.addAttribute("channelSumIP", sumMap.get("channelSumIP"));/** 渠道ip总数 **/
		 //model.addAttribute("channelSumPV", sumMap.get("channelSumPV"));/** 渠道PV总数 **/
		 model.addAttribute("DomainStat_list", DomainStat_list);
		 model.addAttribute("domainSumIP", sumMap.get("domainSumIP"));
		 model.addAttribute("domainSumPV", sumMap.get("domainSumPV"));
		 model.addAttribute("lasttime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		 model.addAttribute("siteStat", siteStat);
		return "dashboard";
	}
	
	/**
	 * 实时数据页面 域名分时统计信息
	 * @return
	 */
	@RequestMapping(value = "dashboard_domainTime")
	public String dashboard_domainTime(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId){
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = domainTimechartList(Integer.valueOf(domainId),24,15);
			
			model.addAttribute("json", json);
		}
		model.addAttribute("domainId", domainId);
		
		return "dashboard_domainTime";
	}
	
	/**
	 * 实时数据页面  域名地域广告入口分析
	 * @return
	 */
	@RequestMapping(value = "dashboard_regionAd")
	public String dashboard_regionAd(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain){
		if(domainId!=null && !"".equals(domainId)){
			Date today = Dates.todayStart();
			Map map = getDomainRegionAd_data(today,Integer.valueOf(domainId));
			List<Map> regionAd_list = (List<Map>) map.get("regionAd_list");
			model.addAttribute("regionAd_list", regionAd_list);
		}
		
		
		model.addAttribute("domain", domain);
		return "dashboard_regionAd";
	}
	/**
	 * 实时数据页面  域名地域非广告入口分析
	 * @return
	 */
	@RequestMapping(value = "dashboard_regionNotAd")
	public String dashboard_regionNotAd(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain){
		if(domainId!=null && !"".equals(domainId)){
			Date today = Dates.todayStart();
			Map map = getDomainRegionNotAd_data(today, Integer.valueOf(domainId));
			List<Map> regionNotAd_list= (List<Map>) map.get("regionNotAd_list");
			model.addAttribute("regionNotAd_list", regionNotAd_list);
		}
		model.addAttribute("domain", domain);
		return "dashboard_regionNotAd";
	}
	
	/**
	 * 实时数据页面 渠道列表
	 * @return
	 */
	@RequestMapping(value = "dashboard_channelList")
	public String dashboard_channelList(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain){
		Date today = Dates.todayStart();
		Map sumMap = getChannelStat_list(today,domainId);
		List<Map> ChannelStat_list = (List<Map>) sumMap.get("ChannelStat_list");
		
		model.addAttribute("ChannelStat_list", ChannelStat_list);
		model.addAttribute("channelSumIP", sumMap.get("channelSumIP"));/** 渠道ip总数 **/
		model.addAttribute("channelSumPV", sumMap.get("channelSumPV"));/** 渠道PV总数 **/
		
		model.addAttribute("domainId", domainId);
		model.addAttribute("domain", domain);
		
		return "dashboard_channelList";
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
	/** ajax刷新域名列表信息 **/
	@RequestMapping("ajaxRefreshPage")
	public void ajaxRefreshPage(HttpServletRequest request,HttpServletResponse response ,Model model){
		
		JSONObject json=new JSONObject();
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		
		/** 获取当前站点统计信息 **/
		Date today = Dates.todayStart();
		AdaSiteStat siteStat = statService.statSite(adaSite.getId(), today);
		
		/** 获取站点下域名统计信息 **/
		Map sumMap = getDomainStat_list(today);
		List<Map> DomainStat_list = (List<Map>) sumMap.get("DomainStat_list");
		
		 json.put("siteStat", siteStat);
		 json.put("domainSumIP", sumMap.get("domainSumIP"));
		 json.put("domainSumPV", sumMap.get("domainSumPV"));
		 json.put("DomainStat_list", DomainStat_list);
		 json.put("lasttime",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
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
	
	/***ajax刷新渠道列表信息 */
	@RequestMapping(value = "ajax_channelList")
	public void ajax_channelList(HttpServletRequest request,HttpServletResponse response ,Model model,
			String domainId,String domain){
		
		JSONObject json=new JSONObject();
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		
		Date today = Dates.todayStart();
		
		/** 获取站点下域名统计信息 **/
		Map sumMap = getChannelStat_list(today,domainId);
		List<Map> ChannelStat_list = (List<Map>) sumMap.get("ChannelStat_list");
		
		 json.put("channelSumIP", sumMap.get("channelSumIP"));/** 渠道ip总数 **/
		 json.put("channelSumPV", sumMap.get("channelSumPV"));/** 渠道PV总数 **/
		 json.put("ChannelStat_list", ChannelStat_list);
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
		String jscode = "<script id=\"adajs\" src=\""+logServer+"/log.js?siteId="+Sessions.getCurrentSite().getId()+"\" type=\"text/javascript\"></script>";
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
	
	/***
	 * 获取域名广告入口和非广告入口图形数据
	 * @return
	 */
	protected JSONObject domainTimechartList(Integer domainId,int pageSize,int len){
		
		List<AdaDomainAd15mStat> adList = ad15mStatDao.findByDomainIdOrderByStartTime(domainId,pageSize);
		List<AdaDomainNotad15mStat> notadList = notAd15mStatDao.findByDomainIdOrderByStartTime(domainId,pageSize);
		JSONObject json=new JSONObject();
		JSONArray ad_chart_1=new JSONArray();//老用户数、老ip、登陆用户数、进入目标页
		JSONArray notad_chart_1=new JSONArray();
		JSONArray ad_chart_2=new JSONArray();//鼠标点击次数1-2、3-5、6-10、10+
		JSONArray notad_chart_2=new JSONArray();
		JSONArray ad_chart_3=new JSONArray();//用户停留时长5-30、31-120、121-300、300+秒
		JSONArray notad_chart_3=new JSONArray();
		JSONArray ad_chart_4=new JSONArray();//鼠标滚动次数1-2、3-5、6-10、10+
		JSONArray notad_chart_4=new JSONArray();
		JSONArray ad_chart_5=new JSONArray();//鼠标移动次数1-2、3-5、6-10、10+
		JSONArray notad_chart_5=new JSONArray();
		JSONArray ad_chart_6=new JSONArray();// IP、PV、UV
		JSONArray notad_chart_6=new JSONArray();
		/*if(adList.size()<15){
			for(int i=0;i<15-adList.size();i++){
				String date = new SimpleDateFormat("HH:mm").format(adList.get(adList.size()-1).getEndTime());
				JSONObject json_item_1=new JSONObject();
				json_item_1.put("date", com.ada.app.util.Dates.getbeforeTime(date, len*(i+1)));
				json_item_1.put("ip", 0);
				json_item_1.put("pv", 0);
				json_item_1.put("uv", 0);
				
				ad_chart_6.add(json_item_1);
				notad_chart_6.add(json_item_1);
				ad_chart_2.add(json_item);
				notad_chart_2.add(json_item);
				ad_chart_3.add(json_item);
				notad_chart_3.add(json_item);
				ad_chart_4.add(json_item);
				notad_chart_4.add(json_item);
				ad_chart_5.add(json_item);
				notad_chart_5.add(json_item);
				ad_chart_6.add(json_item);
				notad_chart_6.add(json_item);
			}
		}*/
		
		
		try {
			for(int i=adList.size()-1;i>=0;i--){
				/** 广告入口数据  **/
				AdaDomainAd15mStat item = adList.get(i);
				String date = new SimpleDateFormat("HH:mm").format(item.getEndTime());
				//第一个图表
				JSONObject json_adChart_1=new JSONObject();
				json_adChart_1.put("date", date); // 统计日期
				json_adChart_1.put("olduser", item.getOlduserip());// 老用户数
				json_adChart_1.put("oldip", item.getOldip()); // 老IP数
				json_adChart_1.put("loginip", item.getLoginip());//登陆用户数
				json_adChart_1.put("targetpageip", item.getTargetpageip());//进入目标页
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_1.put("color", "#EF3F3F");
					json_adChart_1.put("lcolor", "red");
					json_adChart_1.put("alpha", 1);
				}
				ad_chart_1.add(json_adChart_1);
				//第二个图表
				JSONObject json_adChart_2=new JSONObject();
				json_adChart_2.put("date", date); // 统计日期
				json_adChart_2.put("c1", item.getClickip1());
				json_adChart_2.put("c2", item.getClickip2());
				json_adChart_2.put("c3", item.getClickip3());
				json_adChart_2.put("c4", item.getClickip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_2.put("color", "#EF3F3F");
					json_adChart_2.put("lcolor", "red");
					json_adChart_2.put("alpha", 1);
				}
				ad_chart_2.add(json_adChart_2);
				//第三个图表
				JSONObject json_adChart_3=new JSONObject();
				json_adChart_3.put("date", date);
				json_adChart_3.put("st1", item.getStaytimeip1());
				json_adChart_3.put("st2", item.getStaytimeip2());
				json_adChart_3.put("st3", item.getStaytimeip3());
				json_adChart_3.put("st4", item.getStaytimeip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_3.put("color", "#EF3F3F");
					json_adChart_3.put("lcolor", "red");
					json_adChart_3.put("alpha", 1);
				}
				ad_chart_3.add(json_adChart_3);
				//第四个图表
				JSONObject json_adChart_4=new JSONObject();
				json_adChart_4.put("date", date);
				json_adChart_4.put("s1", item.getScrollip1());
				json_adChart_4.put("s2", item.getScrollip2());
				json_adChart_4.put("s3", item.getScrollip3());
				json_adChart_4.put("s4", item.getScrollip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_4.put("color", "#EF3F3F");
					json_adChart_4.put("lcolor", "red");
					json_adChart_4.put("alpha", 1);
				}
				ad_chart_4.add(json_adChart_4);
				//第五个图表
				JSONObject json_adChart_5=new JSONObject();
				json_adChart_5.put("date", date);
				json_adChart_5.put("m1", item.getMoveip1());
				json_adChart_5.put("m2", item.getMoveip2());
				json_adChart_5.put("m3", item.getMoveip3());
				json_adChart_5.put("m4", item.getMoveip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_5.put("color", "#EF3F3F");
					json_adChart_5.put("lcolor", "red");
					json_adChart_5.put("alpha", 1);
				}
				ad_chart_5.add(json_adChart_5);
				//第六个图表
				JSONObject json_adChart_6=new JSONObject();
				json_adChart_6.put("date", date);
				json_adChart_6.put("ip", item.getIp());
				json_adChart_6.put("pv", item.getPv());
				json_adChart_6.put("uv", item.getUv());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_6.put("color", "#EF3F3F");
					json_adChart_6.put("lcolor", "red");
					json_adChart_6.put("alpha", 1);
				}
				ad_chart_6.add(json_adChart_6);
				
			}
			
			for(int i=notadList.size()-1;i>=0;i--){
				/** 非广告入口数据 **/
				AdaDomainNotad15mStat notad = notadList.get(i);
				String date = new SimpleDateFormat("HH:mm").format(notad.getEndTime());
				//第一图表
				JSONObject json_notadChart_1=new JSONObject();
				json_notadChart_1.put("date", date);
				json_notadChart_1.put("olduser", notad.getOlduserip());
				json_notadChart_1.put("oldip", notad.getOldip());
				json_notadChart_1.put("loginip", notad.getLoginip());
				json_notadChart_1.put("targetpageip", notad.getTargetpageip());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_notadChart_1.put("color", "#EF3F3F");
					json_notadChart_1.put("lcolor", "red");
					json_notadChart_1.put("alpha", 1);
				}
				notad_chart_1.add(json_notadChart_1);
				//第二个图表
				JSONObject json_notadChart_2=new JSONObject();
				json_notadChart_2.put("date", date);
				json_notadChart_2.put("c1", notad.getClickip1());
				json_notadChart_2.put("c2", notad.getClickip2());
				json_notadChart_2.put("c3", notad.getClickip3());
				json_notadChart_2.put("c4", notad.getClickip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_notadChart_2.put("color", "#EF3F3F");
					json_notadChart_2.put("lcolor", "red");
					json_notadChart_2.put("alpha", 1);
				}
				notad_chart_2.add(json_notadChart_2);
				//第三个图表
				JSONObject json_notadChart_3=new JSONObject();
				json_notadChart_3.put("date", date);
				json_notadChart_3.put("st1", notad.getStaytimeip1());
				json_notadChart_3.put("st2", notad.getStaytimeip2());
				json_notadChart_3.put("st3", notad.getStaytimeip3());
				json_notadChart_3.put("st4", notad.getStaytimeip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_notadChart_3.put("color", "#EF3F3F");
					json_notadChart_3.put("lcolor", "red");
					json_notadChart_3.put("alpha", 1);
				}
				notad_chart_3.add(json_notadChart_3);
				//第四个图表
				JSONObject json_notadChart_4=new JSONObject();
				json_notadChart_4.put("date", date);
				json_notadChart_4.put("s1", notad.getScrollip1());
				json_notadChart_4.put("s2", notad.getScrollip2());
				json_notadChart_4.put("s3", notad.getScrollip3());
				json_notadChart_4.put("s4", notad.getScrollip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_notadChart_4.put("color", "#EF3F3F");
					json_notadChart_4.put("lcolor", "red");
					json_notadChart_4.put("alpha", 1);
				}
				notad_chart_4.add(json_notadChart_4);
				//第五个图表
				JSONObject json_notadChart_5=new JSONObject();
				json_notadChart_5.put("date", date);
				json_notadChart_5.put("m1", notad.getMoveip1());
				json_notadChart_5.put("m2", notad.getMoveip2());
				json_notadChart_5.put("m3", notad.getMoveip3());
				json_notadChart_5.put("m4", notad.getMoveip4());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_notadChart_5.put("color", "#EF3F3F");
					json_notadChart_5.put("lcolor", "red");
					json_notadChart_5.put("alpha", 1);
				}
				notad_chart_5.add(json_notadChart_5);
				//第六个图表
				JSONObject json_notadChart_6=new JSONObject();
				json_notadChart_6.put("date", date);
				json_notadChart_6.put("ip", notad.getIp());
				json_notadChart_6.put("pv", notad.getPv());
				json_notadChart_6.put("uv", notad.getUv());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_notadChart_6.put("color", "#EF3F3F");
					json_notadChart_6.put("lcolor", "red");
					json_notadChart_6.put("alpha", 1);
				}
				notad_chart_6.add(json_notadChart_6);
			}
			
			
			json.put("ad_chart_1", ad_chart_1);
			json.put("notad_chart_1", notad_chart_1);
			json.put("ad_chart_2", ad_chart_2);
			json.put("notad_chart_2", notad_chart_2);
			json.put("ad_chart_3", ad_chart_3);
			json.put("notad_chart_3", notad_chart_3);
			json.put("ad_chart_4", ad_chart_4);
			json.put("notad_chart_4", notad_chart_4);
			json.put("ad_chart_5", ad_chart_5);
			json.put("notad_chart_5", notad_chart_5);
			json.put("ad_chart_6", ad_chart_6);
			json.put("notad_chart_6", notad_chart_6);
		} catch (Exception e) {
			log.error("获取域名广告入口和非广告入口图形数据失败,msg->"+e.getMessage(),e);
		}
		return json;
	}
	

	protected Map getDomainStat_list(Date date){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<Map> DomainStat_list = new ArrayList<Map>();
		 List<AdaDomain> domains = this.adaDomainDao.findBySiteId(adaSite.getId());
		 Integer domainSumIP = 0;/** 渠道ip总数 **/
		 Integer domainSumPV = 0;/** 渠道PV总数 **/
		 
		 List<Integer[]> domainIps = new ArrayList();
		 
		 for(AdaDomain domain : domains){
			 Integer domainIp = statService.statDomainIP(domain.getId(), date);
			 if(domainIp!=null && domainIp>0){
				 domainIps.add(new Integer[]{domain.getId(),domainIp});
			 }
		 }
		 
		 Collections.sort(domainIps,new Comparator<Integer[]>(){
			public int compare(Integer[] arg0, Integer[] arg1) {
				return arg1[1].compareTo(arg0[0]);
			}
		 });
		 
		 for(int i=0;i<domainIps.size();i++){
			Integer domainId = domainIps.get(i)[0];
			Integer domainIp = domainIps.get(i)[1];
			//Integer channelNum = domainIps.get(i)[2];
//			if(domainIp<10 && i>19){
//				 break;
//			 }
			
			AdaDomainStat domainStat = this.statService.statDomain(adaSite.getId(), domainId, date);
			Map map = new HashMap();
			map.put("id", domainId);
			//map.put("channelNum", channelNum);
			String domainstr = adaDomainDao.findById(domainStat.getDomainId()).getDomain();
			 map.put("domain",domainstr);
			 if(domainstr.length()>18){
				 map.put("subDomain", adaDomainDao.findById(domainStat.getDomainId()).getDomain().substring(0, 18));
			 }else{
				 map.put("subDomain", domainstr);
			 }
			 map.put("ip", domainStat.getIp());
			 map.put("pv", domainStat.getPv());
			 map.put("uv", domainStat.getUv());
			 Integer clickip1=0;
			 Integer clickip2=0;
			 Integer clickip3=0;
			 Integer clickip4=0;
			 Integer staytimeip1=0;
			 Integer staytimeip2=0;
			 Integer staytimeip3=0;
			 Integer staytimeip4=0;
			 Integer scrollip1 = 0;
			 Integer scrollip2 = 0;
			 Integer scrollip3 = 0;
			 Integer scrollip4 = 0;
			 Integer moveip1 = 0;
			 Integer moveip2 = 0;
			 Integer moveip3 = 0;
			 Integer moveip4 = 0;
			 Integer olduserip = 0;
			 Integer oldip = 0;
			 Integer loginip = 0;
			 Integer targetpageip =0;
			 if(domainStat.getClickip1()>0)clickip1 = domainStat.getClickip1();
			 if(domainStat.getClickip2()>0)clickip2 = domainStat.getClickip2();
			 if(domainStat.getClickip3()>0)clickip3 = domainStat.getClickip3();
			 if(domainStat.getClickip4()>0)clickip4 = domainStat.getClickip4();
			 if(domainStat.getStaytimeip1()>0)staytimeip1 = domainStat.getStaytimeip1();
			 if(domainStat.getStaytimeip2()>0)staytimeip2 = domainStat.getStaytimeip2();
			 if(domainStat.getStaytimeip3()>0)staytimeip3 = domainStat.getStaytimeip3();
			 if(domainStat.getStaytimeip4()>0)staytimeip4 = domainStat.getStaytimeip4();
			 if(domainStat.getScrollip1()>0)scrollip1 = domainStat.getScrollip1();
			 if(domainStat.getScrollip2()>0)scrollip2 = domainStat.getScrollip2();
			 if(domainStat.getScrollip3()>0)scrollip3 = domainStat.getScrollip3();
			 if(domainStat.getScrollip4()>0)scrollip4 = domainStat.getScrollip4();
			 if(domainStat.getMoveip1()>0)moveip1 = domainStat.getMoveip1();
			 if(domainStat.getMoveip2()>0)moveip2 = domainStat.getMoveip2();
			 if(domainStat.getMoveip3()>0)moveip3 = domainStat.getMoveip3();
			 if(domainStat.getMoveip4()>0)moveip4 = domainStat.getMoveip4();
			 if(domainStat.getOlduserip()>0)olduserip = domainStat.getOlduserip();
			 if(domainStat.getOldip()>0)oldip = domainStat.getOldip();
			 if(domainStat.getLoginip()>0)loginip = domainStat.getLoginip();
			 if(domainStat.getTargetpageip()>0)targetpageip = domainStat.getTargetpageip();
			 map.put("clickip1", clickip1);
			 map.put("clickip2", clickip2);
			 map.put("clickip3", clickip3);
			 map.put("clickip4", clickip4);
			 map.put("staytimeip1", staytimeip1);
			 map.put("staytimeip2", staytimeip2);
			 map.put("staytimeip3", staytimeip3);
			 map.put("staytimeip4", staytimeip4);
			 map.put("scrollip1", scrollip1);
			 map.put("scrollip2", scrollip2);
			 map.put("scrollip3", scrollip3);
			 map.put("scrollip4", scrollip4);
			 map.put("moveip1", moveip1);
			 map.put("moveip2", moveip2);
			 map.put("moveip3", moveip3);
			 map.put("moveip4", moveip4);
			 map.put("olduserip", olduserip);
			 map.put("targetpageip", targetpageip);
			 map.put("oldip", oldip);
			 map.put("loginip", loginip);
			 NumberFormat numberFormat = NumberFormat.getInstance();     
			 numberFormat.setMaximumFractionDigits(2);
			 if(domainStat.getIp()!=null && domainStat.getIp()>0){
				 map.put("c1", numberFormat.format((float)clickip1/(float)domainStat.getIp()*100));
				 map.put("c2", numberFormat.format((float)clickip2/(float)domainStat.getIp()*100));
				 map.put("c3", numberFormat.format((float)clickip3/(float)domainStat.getIp()*100));
				 map.put("c4", numberFormat.format((float)clickip4/(float)domainStat.getIp()*100));
				 map.put("s1", numberFormat.format((float)staytimeip1/(float)domainStat.getIp()*100));
				 map.put("s2", numberFormat.format((float)staytimeip2/(float)domainStat.getIp()*100));
				 map.put("s3", numberFormat.format((float)staytimeip3/(float)domainStat.getIp()*100));
				 map.put("s4", numberFormat.format((float)staytimeip4/(float)domainStat.getIp()*100));
				 map.put("sc1", numberFormat.format((float)scrollip1/(float)domainStat.getIp()*100));
				 map.put("sc2", numberFormat.format((float)scrollip2/(float)domainStat.getIp()*100));
				 map.put("sc3", numberFormat.format((float)scrollip3/(float)domainStat.getIp()*100));
				 map.put("sc4", numberFormat.format((float)scrollip4/(float)domainStat.getIp()*100));
				 map.put("m1", numberFormat.format((float)moveip1/(float)domainStat.getIp()*100));
				 map.put("m2", numberFormat.format((float)moveip2/(float)domainStat.getIp()*100));
				 map.put("m3", numberFormat.format((float)moveip3/(float)domainStat.getIp()*100));
				 map.put("m4", numberFormat.format((float)moveip4/(float)domainStat.getIp()*100));
				 map.put("old", numberFormat.format((float)olduserip/(float)domainStat.getIp()*100));
				 map.put("tgp", numberFormat.format((float)targetpageip/(float)domainStat.getIp()*100));
				 map.put("oldi", numberFormat.format((float)oldip/(float)domainStat.getIp()*100));
				 map.put("log", numberFormat.format((float)loginip/(float)domainStat.getIp()*100));
			 }else{
				 map.put("c1", 0);
				 map.put("c2", 0);
				 map.put("c3", 0);
				 map.put("c4", 0);
				 map.put("s1", 0);
				 map.put("s2", 0);
				 map.put("s3", 0);
				 map.put("s4", 0);
				 map.put("sc1", 0);
				 map.put("sc2", 0);
				 map.put("sc3", 0);
				 map.put("sc4", 0);
				 map.put("m1", 0);
				 map.put("m2", 0);
				 map.put("m3", 0);
				 map.put("m4", 0);
				 map.put("old", 0);
				 map.put("tgp", 0);
				 map.put("oldi", 0);
				 map.put("log", 0);
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
		
		 map.put("DomainStat_list", DomainStat_list);
		 map.put("domainSumIP", domainSumIP);
		 map.put("domainSumPV", domainSumPV);
		 
		 return map;
	}
	
	protected Map getChannelStat_list(Date date,String domainId){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		/** 渠道列表数据 **/
		List<Map> ChannelStat_list = new ArrayList<Map>();
		 List<AdaChannel> channels = adaChannelDao.findByDomainId(Integer.valueOf(domainId));
		 Integer channelSumIP = 0;/** 渠道ip总数 **/
		 Integer channelSumPV = 0;/** 渠道PV总数 **/
		 for (AdaChannel adaChannel : channels) {
			 AdaChannelStat channelStat =  statService.statChannel(adaSite.getId(), adaChannel.getId(), date);
			 Map map = new HashMap();
			 map.put("channelStr",adaChannelDao.findById(channelStat.getChannelId()).getChannelStr());
			 map.put("ip", channelStat.getIp());
			 map.put("pv", channelStat.getPv());
			 Integer clickip1=0;
			 Integer clickip2=0;
			 Integer clickip3=0;
			 Integer clickip4=0;
			 Integer staytimeip1=0;
			 Integer staytimeip2=0;
			 Integer staytimeip3=0;
			 Integer staytimeip4=0;
			 Integer scrollip1 = 0;
			 Integer scrollip2 = 0;
			 Integer scrollip3 = 0;
			 Integer scrollip4 = 0;
			 Integer moveip1 = 0;
			 Integer moveip2 = 0;
			 Integer moveip3 = 0;
			 Integer moveip4 = 0;
			 Integer olduserip = 0;
			 
			 if(channelStat.getClickip1()>0)clickip1 = channelStat.getClickip1();
			 if(channelStat.getClickip2()>0)clickip2 = channelStat.getClickip2();
			 if(channelStat.getClickip3()>0)clickip3 = channelStat.getClickip3();
			 if(channelStat.getClickip4()>0)clickip4 = channelStat.getClickip4();
			 if(channelStat.getStaytimeip1()>0)staytimeip1 = channelStat.getStaytimeip1();
			 if(channelStat.getStaytimeip2()>0)staytimeip2 = channelStat.getStaytimeip2();
			 if(channelStat.getStaytimeip3()>0)staytimeip3 = channelStat.getStaytimeip3();
			 if(channelStat.getStaytimeip4()>0)staytimeip4 = channelStat.getStaytimeip4();
			 if(channelStat.getScrollip1()>0)scrollip1 = channelStat.getScrollip1();
			 if(channelStat.getScrollip2()>0)scrollip2 = channelStat.getScrollip2();
			 if(channelStat.getScrollip3()>0)scrollip3 = channelStat.getScrollip3();
			 if(channelStat.getScrollip4()>0)scrollip4 = channelStat.getScrollip4();
			 if(channelStat.getMoveip1()>0)moveip1 = channelStat.getMoveip1();
			 if(channelStat.getMoveip2()>0)moveip2 = channelStat.getMoveip2();
			 if(channelStat.getMoveip3()>0)moveip3 = channelStat.getMoveip3();
			 if(channelStat.getMoveip4()>0)moveip4 = channelStat.getMoveip4();
			 if(channelStat.getOlduserip()>0)olduserip = channelStat.getOlduserip();
			 
			 map.put("clickip1", clickip1);
			 map.put("clickip2", clickip2);
			 map.put("clickip3", clickip3);
			 map.put("clickip4", clickip4);
			 map.put("staytimeip1", staytimeip1);
			 map.put("staytimeip2", staytimeip2);
			 map.put("staytimeip3", staytimeip3);
			 map.put("staytimeip4", staytimeip4);
			 map.put("scrollip1", scrollip1);
			 map.put("scrollip2", scrollip2);
			 map.put("scrollip3", scrollip3);
			 map.put("scrollip4", scrollip4);
			 map.put("moveip1", moveip1);
			 map.put("moveip2", moveip2);
			 map.put("moveip3", moveip3);
			 map.put("moveip4", moveip4);
			 map.put("olduserip", olduserip);
			 map.put("targetpageip", channelStat.getTargetpageip());
			 NumberFormat numberFormat = NumberFormat.getInstance();     
			 numberFormat.setMaximumFractionDigits(2);
			 if(channelStat.getIp()!=null && channelStat.getIp()>0){
				 map.put("c1", numberFormat.format((float)clickip1/(float)channelStat.getIp()*100));
				 map.put("c2", numberFormat.format((float)clickip2/(float)channelStat.getIp()*100));
				 map.put("c3", numberFormat.format((float)clickip3/(float)channelStat.getIp()*100));
				 map.put("c4", numberFormat.format((float)clickip4/(float)channelStat.getIp()*100));
				 map.put("s1", numberFormat.format((float)staytimeip1/(float)channelStat.getIp()*100));
				 map.put("s2", numberFormat.format((float)staytimeip2/(float)channelStat.getIp()*100));
				 map.put("s3", numberFormat.format((float)staytimeip3/(float)channelStat.getIp()*100));
				 map.put("s4", numberFormat.format((float)staytimeip4/(float)channelStat.getIp()*100));
				 map.put("sc1", numberFormat.format((float)scrollip1/(float)channelStat.getIp()*100));
				 map.put("sc2", numberFormat.format((float)scrollip2/(float)channelStat.getIp()*100));
				 map.put("sc3", numberFormat.format((float)scrollip3/(float)channelStat.getIp()*100));
				 map.put("sc4", numberFormat.format((float)scrollip4/(float)channelStat.getIp()*100));
				 map.put("m1", numberFormat.format((float)moveip1/(float)channelStat.getIp()*100));
				 map.put("m2", numberFormat.format((float)moveip2/(float)channelStat.getIp()*100));
				 map.put("m3", numberFormat.format((float)moveip3/(float)channelStat.getIp()*100));
				 map.put("m4", numberFormat.format((float)moveip4/(float)channelStat.getIp()*100));
				 map.put("old", numberFormat.format((float)olduserip/(float)channelStat.getIp()*100));
				 map.put("tgp", numberFormat.format((float)channelStat.getTargetpageip()/(float)channelStat.getIp()*100));
			 }else{
				 map.put("c1", 0);
				 map.put("c2", 0);
				 map.put("c3", 0);
				 map.put("c4", 0);
				 map.put("s1", 0);
				 map.put("s2", 0);
				 map.put("s3", 0);
				 map.put("s4", 0);
				 map.put("sc1", 0);
				 map.put("sc2", 0);
				 map.put("sc3", 0);
				 map.put("sc4", 0);
				 map.put("m1", 0);
				 map.put("m2", 0);
				 map.put("m3", 0);
				 map.put("m4", 0);
				 map.put("old", 0);
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
		
		Map map = new HashMap();
		map.put("ChannelStat_list", ChannelStat_list);
		map.put("channelSumIP", channelSumIP);
		map.put("channelSumPV", channelSumPV);
		return map;
	}
	/**
	 * 获取地域广告入口数据
	 * @param date
	 * @param domainId
	 * @return
	 */
	protected Map getDomainRegionAd_data(Date date,Integer domainId){
		List<Map> regionAd_list = new ArrayList<Map>();
		Set<String> regionAddata = statService.getCityList(domainId, date);
		for (String regionName : regionAddata) {
			DomainAreaStat regionAd = statService.statDomainRegionAd(regionName, domainId, date);
			Map map = new HashMap();
			map.put("regionName", regionName);
			 
			 Integer ip = regionAd.getIp();
			 if(ip>10){
				 Integer clickip1=0;
				 Integer clickip2=0;
				 Integer clickip3=0;
				 Integer clickip4=0;
				 Integer staytimeip1=0;
				 Integer staytimeip2=0;
				 Integer staytimeip3=0;
				 Integer staytimeip4=0;
				 Integer scrollip1 = 0;
				 Integer scrollip2 = 0;
				 Integer scrollip3 = 0;
				 Integer scrollip4 = 0;
				 Integer moveip1 = 0;
				 Integer moveip2 = 0;
				 Integer moveip3 = 0;
				 Integer moveip4 = 0;
				 Integer olduserip = 0;
				 Integer oldip = 0;
				 Integer loginip = 0;
				 Integer targetpageip =0;
				 if(regionAd.getClickip1()>0)clickip1 = regionAd.getClickip1();
				 if(regionAd.getClickip2()>0)clickip2 = regionAd.getClickip2();
				 if(regionAd.getClickip3()>0)clickip3 = regionAd.getClickip3();
				 if(regionAd.getClickip4()>0)clickip4 = regionAd.getClickip4();
				 if(regionAd.getStaytimeip1()>0)staytimeip1 = regionAd.getStaytimeip1();
				 if(regionAd.getStaytimeip2()>0)staytimeip2 = regionAd.getStaytimeip2();
				 if(regionAd.getStaytimeip3()>0)staytimeip3 = regionAd.getStaytimeip3();
				 if(regionAd.getStaytimeip4()>0)staytimeip4 = regionAd.getStaytimeip4();
				 if(regionAd.getScrollip1()>0)scrollip1 = regionAd.getScrollip1();
				 if(regionAd.getScrollip2()>0)scrollip2 = regionAd.getScrollip2();
				 if(regionAd.getScrollip3()>0)scrollip3 = regionAd.getScrollip3();
				 if(regionAd.getScrollip4()>0)scrollip4 = regionAd.getScrollip4();
				 if(regionAd.getMoveip1()>0)moveip1 = regionAd.getMoveip1();
				 if(regionAd.getMoveip2()>0)moveip2 = regionAd.getMoveip2();
				 if(regionAd.getMoveip3()>0)moveip3 = regionAd.getMoveip3();
				 if(regionAd.getMoveip4()>0)moveip4 = regionAd.getMoveip4();
				 if(regionAd.getOlduserip()>0)olduserip = regionAd.getOlduserip();
				 if(regionAd.getOldip()>0)oldip = regionAd.getOldip();
				 if(regionAd.getLoginip()>0)loginip = regionAd.getLoginip();
				 if(regionAd.getTargetpageip()>0)targetpageip = regionAd.getTargetpageip();
				 map.put("pv", regionAd.getPv());
				 map.put("uv", regionAd.getUv());
				 map.put("ip", ip);
				 map.put("clickip1", clickip1);
				 map.put("clickip2", clickip2);
				 map.put("clickip3", clickip3);
				 map.put("clickip4", clickip4);
				 map.put("staytimeip1", staytimeip1);
				 map.put("staytimeip2", staytimeip2);
				 map.put("staytimeip3", staytimeip3);
				 map.put("staytimeip4", staytimeip4);
				 map.put("scrollip1", scrollip1);
				 map.put("scrollip2", scrollip2);
				 map.put("scrollip3", scrollip3);
				 map.put("scrollip4", scrollip4);
				 map.put("moveip1", moveip1);
				 map.put("moveip2", moveip2);
				 map.put("moveip3", moveip3);
				 map.put("moveip4", moveip4);
				 map.put("olduserip", olduserip);
				 map.put("targetpageip", targetpageip);
				 map.put("oldip", oldip);
				 map.put("loginip", loginip);
				 NumberFormat numberFormat = NumberFormat.getInstance();     
				 numberFormat.setMaximumFractionDigits(2);
				 if(ip!=null && ip>0){
					 map.put("c1", numberFormat.format((float)clickip1/(float)ip*100));
					 map.put("c2", numberFormat.format((float)clickip2/(float)ip*100));
					 map.put("c3", numberFormat.format((float)clickip3/(float)ip*100));
					 map.put("c4", numberFormat.format((float)clickip4/(float)ip*100));
					 map.put("s1", numberFormat.format((float)staytimeip1/(float)ip*100));
					 map.put("s2", numberFormat.format((float)staytimeip2/(float)ip*100));
					 map.put("s3", numberFormat.format((float)staytimeip3/(float)ip*100));
					 map.put("s4", numberFormat.format((float)staytimeip4/(float)ip*100));
					 map.put("sc1", numberFormat.format((float)scrollip1/(float)ip*100));
					 map.put("sc2", numberFormat.format((float)scrollip2/(float)ip*100));
					 map.put("sc3", numberFormat.format((float)scrollip3/(float)ip*100));
					 map.put("sc4", numberFormat.format((float)scrollip4/(float)ip*100));
					 map.put("m1", numberFormat.format((float)moveip1/(float)ip*100));
					 map.put("m2", numberFormat.format((float)moveip2/(float)ip*100));
					 map.put("m3", numberFormat.format((float)moveip3/(float)ip*100));
					 map.put("m4", numberFormat.format((float)moveip4/(float)ip*100));
					 map.put("old", numberFormat.format((float)olduserip/(float)ip*100));
					 map.put("tgp", numberFormat.format((float)targetpageip/(float)ip*100));
					 map.put("oldi", numberFormat.format((float)oldip/(float)ip*100));
					 map.put("log", numberFormat.format((float)loginip/(float)ip*100));
				 }else{
					 map.put("c1", 0);
					 map.put("c2", 0);
					 map.put("c3", 0);
					 map.put("c4", 0);
					 map.put("s1", 0);
					 map.put("s2", 0);
					 map.put("s3", 0);
					 map.put("s4", 0);
					 map.put("sc1", 0);
					 map.put("sc2", 0);
					 map.put("sc3", 0);
					 map.put("sc4", 0);
					 map.put("m1", 0);
					 map.put("m2", 0);
					 map.put("m3", 0);
					 map.put("m4", 0);
					 map.put("old", 0);
					 map.put("tgp", 0);
					 map.put("oldi", 0);
					 map.put("log", 0);
				 }
				 regionAd_list.add(map);
			 }
			 
		}
		/** 根据ip数排序 **/
		 Collections.sort(regionAd_list,new Comparator<Map>(){
				public int compare(Map map1, Map map2) {
					Integer integer = (Integer) map1.get("ip");
					Integer integer2 = (Integer) map2.get("ip");
					return integer2.compareTo(integer);
				}
	        });
		Map map = new HashMap();
		map.put("regionAd_list", regionAd_list);
		return map;
	}
	
	protected Map getDomainRegionNotAd_data(Date date,Integer domainId) {
		List<Map> regionNotAd_list = new ArrayList<Map>();
		Set<String> regionAddata = statService.getCityList(domainId, date);
		for (String regionName : regionAddata) {
			DomainAreaStat regionNotAd = statService.statDomainRegionNotAd(regionName, domainId, date);
			Map map = new HashMap();
			map.put("regionName", regionName);
			 
			 Integer ip = regionNotAd.getIp();
			 if(ip>0){
				 Integer clickip1=0;
				 Integer clickip2=0;
				 Integer clickip3=0;
				 Integer clickip4=0;
				 Integer staytimeip1=0;
				 Integer staytimeip2=0;
				 Integer staytimeip3=0;
				 Integer staytimeip4=0;
				 Integer scrollip1 = 0;
				 Integer scrollip2 = 0;
				 Integer scrollip3 = 0;
				 Integer scrollip4 = 0;
				 Integer moveip1 = 0;
				 Integer moveip2 = 0;
				 Integer moveip3 = 0;
				 Integer moveip4 = 0;
				 Integer olduserip = 0;
				 Integer oldip = 0;
				 Integer loginip = 0;
				 Integer targetpageip =0;
				 if(regionNotAd.getClickip1()>0)clickip1 = regionNotAd.getClickip1();
				 if(regionNotAd.getClickip2()>0)clickip2 = regionNotAd.getClickip2();
				 if(regionNotAd.getClickip3()>0)clickip3 = regionNotAd.getClickip3();
				 if(regionNotAd.getClickip4()>0)clickip4 = regionNotAd.getClickip4();
				 if(regionNotAd.getStaytimeip1()>0)staytimeip1 = regionNotAd.getStaytimeip1();
				 if(regionNotAd.getStaytimeip2()>0)staytimeip2 = regionNotAd.getStaytimeip2();
				 if(regionNotAd.getStaytimeip3()>0)staytimeip3 = regionNotAd.getStaytimeip3();
				 if(regionNotAd.getStaytimeip4()>0)staytimeip4 = regionNotAd.getStaytimeip4();
				 if(regionNotAd.getScrollip1()>0)scrollip1 = regionNotAd.getScrollip1();
				 if(regionNotAd.getScrollip2()>0)scrollip2 = regionNotAd.getScrollip2();
				 if(regionNotAd.getScrollip3()>0)scrollip3 = regionNotAd.getScrollip3();
				 if(regionNotAd.getScrollip4()>0)scrollip4 = regionNotAd.getScrollip4();
				 if(regionNotAd.getMoveip1()>0)moveip1 = regionNotAd.getMoveip1();
				 if(regionNotAd.getMoveip2()>0)moveip2 = regionNotAd.getMoveip2();
				 if(regionNotAd.getMoveip3()>0)moveip3 = regionNotAd.getMoveip3();
				 if(regionNotAd.getMoveip4()>0)moveip4 = regionNotAd.getMoveip4();
				 if(regionNotAd.getOlduserip()>0)olduserip = regionNotAd.getOlduserip();
				 if(regionNotAd.getOldip()>0)oldip = regionNotAd.getOldip();
				 if(regionNotAd.getLoginip()>0)loginip = regionNotAd.getLoginip();
				 if(regionNotAd.getTargetpageip()>0)targetpageip = regionNotAd.getTargetpageip();
				 map.put("pv", regionNotAd.getPv());
				 map.put("uv", regionNotAd.getUv());
				 map.put("ip", ip);
				 map.put("clickip1", clickip1);
				 map.put("clickip2", clickip2);
				 map.put("clickip3", clickip3);
				 map.put("clickip4", clickip4);
				 map.put("staytimeip1", staytimeip1);
				 map.put("staytimeip2", staytimeip2);
				 map.put("staytimeip3", staytimeip3);
				 map.put("staytimeip4", staytimeip4);
				 map.put("scrollip1", scrollip1);
				 map.put("scrollip2", scrollip2);
				 map.put("scrollip3", scrollip3);
				 map.put("scrollip4", scrollip4);
				 map.put("moveip1", moveip1);
				 map.put("moveip2", moveip2);
				 map.put("moveip3", moveip3);
				 map.put("moveip4", moveip4);
				 map.put("olduserip", olduserip);
				 map.put("targetpageip", targetpageip);
				 map.put("oldip", oldip);
				 map.put("loginip", loginip);
				 NumberFormat numberFormat = NumberFormat.getInstance();     
				 numberFormat.setMaximumFractionDigits(2);
				 if(ip!=null && ip>0){
					 map.put("c1", numberFormat.format((float)clickip1/(float)ip*100));
					 map.put("c2", numberFormat.format((float)clickip2/(float)ip*100));
					 map.put("c3", numberFormat.format((float)clickip3/(float)ip*100));
					 map.put("c4", numberFormat.format((float)clickip4/(float)ip*100));
					 map.put("s1", numberFormat.format((float)staytimeip1/(float)ip*100));
					 map.put("s2", numberFormat.format((float)staytimeip2/(float)ip*100));
					 map.put("s3", numberFormat.format((float)staytimeip3/(float)ip*100));
					 map.put("s4", numberFormat.format((float)staytimeip4/(float)ip*100));
					 map.put("sc1", numberFormat.format((float)scrollip1/(float)ip*100));
					 map.put("sc2", numberFormat.format((float)scrollip2/(float)ip*100));
					 map.put("sc3", numberFormat.format((float)scrollip3/(float)ip*100));
					 map.put("sc4", numberFormat.format((float)scrollip4/(float)ip*100));
					 map.put("m1", numberFormat.format((float)moveip1/(float)ip*100));
					 map.put("m2", numberFormat.format((float)moveip2/(float)ip*100));
					 map.put("m3", numberFormat.format((float)moveip3/(float)ip*100));
					 map.put("m4", numberFormat.format((float)moveip4/(float)ip*100));
					 map.put("old", numberFormat.format((float)olduserip/(float)ip*100));
					 map.put("tgp", numberFormat.format((float)targetpageip/(float)ip*100));
					 map.put("oldi", numberFormat.format((float)oldip/(float)ip*100));
					 map.put("log", numberFormat.format((float)loginip/(float)ip*100));
				 }else{
					 map.put("c1", 0);
					 map.put("c2", 0);
					 map.put("c3", 0);
					 map.put("c4", 0);
					 map.put("s1", 0);
					 map.put("s2", 0);
					 map.put("s3", 0);
					 map.put("s4", 0);
					 map.put("sc1", 0);
					 map.put("sc2", 0);
					 map.put("sc3", 0);
					 map.put("sc4", 0);
					 map.put("m1", 0);
					 map.put("m2", 0);
					 map.put("m3", 0);
					 map.put("m4", 0);
					 map.put("old", 0);
					 map.put("tgp", 0);
					 map.put("oldi", 0);
					 map.put("log", 0);
				 }
				 regionNotAd_list.add(map);
			 }
			 
		}
		/** 根据ip数排序 **/
		 Collections.sort(regionNotAd_list,new Comparator<Map>(){
				public int compare(Map map1, Map map2) {
					Integer integer = (Integer) map1.get("ip");
					Integer integer2 = (Integer) map2.get("ip");
					return integer2.compareTo(integer);
				}
	        });
		Map map = new HashMap();
		map.put("regionNotAd_list", regionNotAd_list);
		return map;
	}
}
