package com.ada.app.web;

import java.io.PrintWriter;
import java.sql.Timestamp;
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
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.jiand.mvc.framework.utils.Dates;

import com.ada.app.bean.BaseStat;
import com.ada.app.bean.BaseStatBean;
import com.ada.app.bean.DomainAreaStat;
import com.ada.app.bean.DomainStat;
import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaDomainAd15mStatDao;
import com.ada.app.dao.AdaDomainAdStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainNotAd15mStatDao;
import com.ada.app.dao.AdaDomainNotAdStatDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomain;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
import com.ada.app.domain.AdaDomainNotadStat;
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
	
	private final static Log log = LogFactory.getLog(dashboardController.class);
	
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
	@Autowired
	private AdaDomainAdStatDao adaDomainAdStatDao;
	@Autowired
	private AdaDomainNotAdStatDao adaDomainNotAdStatDao;
	private final static int Interval_time = 60;//域名分时统计的时间 间隔（单位：分钟）
	private final static int domainTime_PageSize = 24;//域名分时统计 图表数据 每一页的数据条数
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
	public String now(HttpServletRequest request,HttpServletResponse response, Model model,
			String dataType,String firstTd,String top,String isRefresh,String isRetrun) {
		int iptop = 50;
		if(top!=null && !"".equals(top)){
			iptop = Integer.valueOf(top).intValue();
		}
		model.addAttribute("ipTop", iptop);
		model.addAttribute("search", firstTd);
		model.addAttribute("isRefresh", isRefresh);
		model.addAttribute("isRetrun", isRetrun);
		
		if(isRetrun.equals("true")){
			
		}else{
			/** 从sessions中获取站点信息 **/
			AdaSite adaSite = Sessions.getCurrentSite();//
			
			/** 获取当前站点统计信息 **/
			Date today = Dates.todayStart();
			AdaSiteStat siteStat = statService.statSite(adaSite.getId(), today);
			model.addAttribute("siteStat", siteStat);
			if(dataType!=null){
				if("domain".equals(dataType)){
					
					/** 获取站点下域名统计信息 **/
					Map sumMap = getDomainStat_list(today,firstTd,iptop);
					List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
					Map map = new HashMap();
					map.put("data_list", data_list);
					map.put("dataType", dataType);
					map.put("siteStat", siteStat);
					map.put("lasttime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					JSONObject json  = new JSONObject(map);
					model.addAttribute("tbodydata", json);
				}else if("domainAd".equals(dataType)){
					Map map = getDomainAdData(today,firstTd,iptop);
					List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
					Map map2 = new HashMap();
					map2.put("data_list", data_list);
					map2.put("dataType", dataType);
					map2.put("siteStat", siteStat);
					map2.put("lasttime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					JSONObject json  = new JSONObject(map2);
					model.addAttribute("tbodydata", json);
				}else if("domainNotAd".equals(dataType)){
					Map map = getDomainNotAdData(today,firstTd,iptop);
					List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
					Map map2 = new HashMap();
					map2.put("data_list", data_list);
					map2.put("dataType", dataType);
					map2.put("siteStat", siteStat);
					map2.put("lasttime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
					JSONObject json  = new JSONObject(map2);
					model.addAttribute("tbodydata", json);
				}
				
			}
		}
		
		
		
		 //model.addAttribute("lasttime", new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		 model.addAttribute("dataType", dataType);
		return "dashboard";
	}
	
	/**
	 * ajax刷新实时数据页面数据
	 * @param dataType 页面数据类型（域名统计、域名广告入口统计、域名非广告入口统计、域名地域广告入口统计、域名地域非广告入口统计）
	 */
	@RequestMapping("ajaxRefreshPage")
	public void ajaxRefreshPage(HttpServletRequest request,HttpServletResponse response ,Model model,
			String dataType,String domainId,String firstTd,String top,String timestamp){
		//log.info("城市名称----------》"+firstTd);
		JSONObject json=new JSONObject();
		int ipTop = 0;
		if(top!=null && !"".equals(top)){
			ipTop = Integer.valueOf(top).intValue();
		}
		/** 获取当前站点统计信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		Date today = Dates.todayStart();
		AdaSiteStat siteStat = statService.statSite(adaSite.getId(), today);
		json.put("siteStat", siteStat);
		if(dataType!=null){
			
			if("domain".equals(dataType)){/** 获取域名统计信息 **/
				Map map = getDomainStat_list(today,firstTd,ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("DomainStat_list");
				json.put("data_list", data_list);
			}else if("domainAd".equals(dataType)){/** 获取域名广告入口统计信息 **/
				Map map = getDomainAdData(today,firstTd,ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				json.put("data_list", data_list);
			}else if("domainNotAd".equals(dataType)){/** 获取域名非广告入口统计信息 **/
				Map map = getDomainNotAdData(today,firstTd,ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				json.put("data_list", data_list);
			}else if("domainRegion".equals(dataType)){/**获取域名地域统计信息**/
				Map map = getDomainRegion(today,Integer.valueOf(domainId),null,ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				AdaDomainStat domainStat = (AdaDomainStat) map.get("domainStat");
				json.put("data_list", data_list);
				json.put("domainStat", domainStat);
			}else if("domainRegionAd".equals(dataType)){/** 获取域名地域广告入口统计信息 **/
				Map map = getDomainRegionAd_data(today,Integer.valueOf(domainId),null,ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				AdaDomainAdStat adaDomainAdStat = (AdaDomainAdStat) map.get("domainAdStat");
				json.put("data_list", data_list);
				json.put("domainAdStat", adaDomainAdStat);
			}else if("domainRegionNotAd".equals(dataType)){/** 获取域名地域非广告入口统计信息 **/
				Map map = getDomainRegionNotAd_data(today,Integer.valueOf(domainId),null,ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				AdaDomainNotadStat adaDomainNotadStat = (AdaDomainNotadStat) map.get("domainNotAdStat");
				json.put("data_list", data_list);
				json.put("domainNotAdStat", adaDomainNotadStat);
			}
		}
		json.put("dataType", dataType);
		json.put("domainId", domainId);
		json.put("lasttime",new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));
		json.put("timestamp", timestamp);
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
	
	/**
	 * 实时数据页面 域名分时统计信息
	 * @return
	 */
	@RequestMapping(value = "dashboard_domainTime")
	public String dashboard_domainTime(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain,String dataType,String search_date){
		if(search_date==null || "".equals(search_date)){
			search_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}
		JSONObject json = new JSONObject();
		if(domainId!=null && !"".equals(domainId)){
			 json = domainTimechartList(Integer.valueOf(domainId),search_date);
		}
		model.addAttribute("json", json);
		model.addAttribute("search_date", search_date);
		model.addAttribute("domainId", domainId);
		model.addAttribute("dataType", dataType);
		model.addAttribute("domain", domain);
		return "dashboard_domainTime";
	}
	/**
	 * 域名广告入口和非广告入口分时统计信息
	 * @param domainId
	 * @param dataType
	 * @return
	 */
	@RequestMapping("domainTimechartList_one")
	public String dashboard_domainAdTime(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String dataType,String domain,String search_date){
		if(search_date==null || "".equals(search_date)){
			search_date = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		}
		if(dataType!=null && domainId!=null){
			JSONObject json = domainTimechartList_one(Integer.valueOf(domainId),search_date,dataType);
			model.addAttribute("json", json);
		}
		model.addAttribute("search_date", search_date);
		model.addAttribute("dataType", dataType);
		model.addAttribute("domainId", domainId);
		model.addAttribute("domain", domain);
		return "dashboard_domainTime_one";
	}
	/**
	 * 实时数据 动态图
	 * @return
	 */
	@RequestMapping("dashboard_dynamic")
	public String dashboard_dynamic(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId){
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = dynamic_chart(Integer.valueOf(domainId));
			model.addAttribute("json", json);
		}
		
		model.addAttribute("domainId", domainId);
		return "dashboard_dynamic";
	}
	/**
	 * 实时数据  单独查看
	 * @param domainId 域名id
	 */
	@RequestMapping("dashboard_solo")
	public String dashboard_solo(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain){
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = solo_chart(Integer.valueOf(domainId),23,1);
			model.addAttribute("json", json);
		}
		model.addAttribute("domainId", domainId);
		model.addAttribute("domain", domain);
		return "dashboard_solo";
	}
	
	/*@RequestMapping(value = "dashboard_domainTime3")
	public String dashboard_domainTime3(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain){
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = domainTimechartList(Integer.valueOf(domainId),domainTime_PageSize,Interval_time,1);
			
			model.addAttribute("json", json);
		}
		model.addAttribute("domainId", domainId);
		model.addAttribute("domain", domain);
		return "dashboard_domainTime3";
	}*/
	
	
	
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
	@RequestMapping("ajax_dashboard_dynamic")
	public void ajax_dashboard_dynamic(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId){
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.dynamic_chart(Integer.valueOf(domainId)));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("ajax_dashboard_solo")
	public void ajax_dashboard_solo(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId){
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.solo_chart(Integer.valueOf(domainId),23,1));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	
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
	
	/**
	 * 实时数据页面 域名分时统计信息异步分页查询
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("ajaxdashboard_domainTime")
	public void ajaxdashboard_domainTime(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo,String domainId,String dataType,String search_date){
		
		Integer domainid = 0;
		if(domainId!=null && !"".equals(domainId)){
			domainid = Integer.valueOf(domainId);
		}
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(dataType!=null && !"".equals(dataType)){
				if("domain".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,search_date,dataType));
				}else if("domainAd".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,search_date,dataType));
				}else if("domainNotAd".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,search_date,dataType));
				}else if("AdAndNotAd".equals(dataType)){
					out.print(this.domainTimechartList(domainid,search_date));
				}
			}
			
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/*@RequestMapping("ajaxdashboard_domainTime3")
	public void ajaxdashboard_domainTime3(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo,String domainId){
		Integer pageno = Integer.valueOf(pageNo);
		Integer domainid = Integer.valueOf(domainId);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.domainTimechartList(domainid,domainTime_PageSize,Interval_time,pageno));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	
	
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
				json.put("message", "已是最新统计数据！");
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
	/**
	 * 实时数据 动态图数据
	 * @return
	 */
	protected JSONObject dynamic_chart(Integer domainId){
		JSONObject json=new JSONObject();
		JSONArray chart_1=new JSONArray();// IP、PV、UV
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		Date today = Dates.todayStart();
		AdaDomainStat domainStat = this.statService.statDomain(adaSite.getId(), domainId, today);
		JSONObject json_adChart_1=new JSONObject();
		json_adChart_1.put("date", new SimpleDateFormat("HH:mm:ss").format(new Date()));
		json_adChart_1.put("ip", domainStat.getIp());
		json_adChart_1.put("pv", domainStat.getPv());
		json_adChart_1.put("uv", domainStat.getUv());
	
		chart_1.add(json_adChart_1);
		json.put("success", true);
		json.put("chart_1", chart_1);
		return json;
	}
	/**
	 * 实时数据  单独查看 图表数据
	 * @param domainId
	 * @return
	 */
	protected JSONObject solo_chart(Integer domainId,int pageSize,int pageNo){
		JSONObject json=new JSONObject();
		JSONArray chart_1=new JSONArray();// 
		if(domainId!=null && domainId>0){
			
			List<AdaDomainAd15mStat> list = ad15mStatDao.findByDomainIdOrderByStartTime(domainId,(pageNo-1)*pageSize,pageSize);
			if(list!=null && list.size()>0){
				for(int i=list.size()-1;i>=0;i--){
					BaseStatBean item = new BaseStatBean();
					BeanUtils.copyProperties(list.get(i), item);
					String date = new SimpleDateFormat("HH:mm").format(item.getEndTime());
					JSONObject json_item_1=new JSONObject();
					json_item_1.put("date", date);//时间
					json_item_1.put("pv", item.getPv());//pv
					json_item_1.put("clpv", 0);// Forecast 预测pv
					chart_1.add(json_item_1);
				}
				
				//最后一条数据 从redis中 获取最新数据
				AdaSite adaSite = Sessions.getCurrentSite();
				Date today = Dates.todayStart();
				AdaDomainStat domainStat = this.statService.statDomain(adaSite.getId(), domainId, today);
				JSONObject json_item=new JSONObject();
				AdaDomainAdStat oldad = adaDomainAdStatDao.findLast(adaSite.getId(), domainId);//广告入口老数据
				AdaDomainNotadStat oldnotad = adaDomainNotAdStatDao.findLast(adaSite.getId(), domainId);//非广告入口数据
				Integer allOldPv = 0;//总的老pv 
				if(oldad!=null && oldnotad!=null){
					allOldPv = oldad.getPv()+oldnotad.getPv();
				}
				String Fdata = com.ada.app.util.Dates.getAfterTime();//获取下个整点 时间
				Integer pv = domainStat.getPv();
						pv = pv - allOldPv>0 ? pv - allOldPv : 0;
				//根据平均数  预计 一个小时的数据
				Integer Fpv = com.ada.app.util.Dates.getHourData(pv);
				json_item.put("date", Fdata);
				json_item.put("pv", pv);
				json_item.put("Fpv", Fpv);
				json_item.put("clpv", Fpv - pv>0 ? Fpv-pv : 0);
				json_item.put("alpha", 0.2);
				json_item.put("color", "red");
				json_item.put("dashLengthColumn", 5);
				chart_1.add(json_item);
			}
			
		}
		
		json.put("success", true);
		json.put("chart_1", chart_1);
		return json;
	}
	
	protected JSONObject domainTimechartList_one(Integer domainId,String search_date,String dataType){
		
		JSONObject json=new JSONObject();
		json.put("search_date", search_date);
		json.put("nextPage", com.ada.app.util.Dates.getTomorrowDate(search_date)); 
		json.put("lastPage", com.ada.app.util.Dates.getYestDate(search_date));
		json.put("dataType", dataType);
		if(dataType==null){
			json.put("success", false);
			json.put("message", "已是最新统计数据！");
			return json;
		}
		List list = new ArrayList();
		
		try {
			if("domain".equals(dataType)){
				List<AdaDomainAd15mStat> adlist = ad15mStatDao.findByDomainIdAndDate(domainId,search_date);
				List<AdaDomainNotad15mStat> notAdlist = notAd15mStatDao.findByDomainIdAndDate(domainId,search_date);
				for(int i=0;i<adlist.size();i++){
					BaseStatBean item = new BaseStatBean();
					AdaDomainAd15mStat ad = adlist.get(i);
					AdaDomainNotad15mStat notAd =  notAdlist.get(i);
					item.setStartTime(ad.getStartTime());
					item.setEndTime(ad.getEndTime());
					item.setIp(ad.getIp()+notAd.getIp());
					item.setPv(ad.getPv()+notAd.getPv());
					item.setUv(ad.getUv()+notAd.getUv());
					item.setLoginip(ad.getLoginip()+notAd.getLoginip());
					item.setOldip(ad.getOldip()+notAd.getOldip());
					item.setOlduserip(ad.getOlduserip()+notAd.getOlduserip());
					item.setTargetpageip(ad.getTargetpageip()+notAd.getTargetpageip());
					item.setStaytimeip1(ad.getStaytimeip1()+notAd.getStaytimeip1());
					item.setStaytimeip2(ad.getStaytimeip2()+notAd.getStaytimeip2());
					item.setStaytimeip3(ad.getStaytimeip3()+notAd.getStaytimeip3());
					item.setStaytimeip4(ad.getStaytimeip4()+notAd.getStaytimeip4());
					item.setClickip1(ad.getClickip1()+notAd.getClickip1());
					item.setClickip2(ad.getClickip2()+notAd.getClickip2());
					item.setClickip3(ad.getClickip3()+notAd.getClickip3());
					item.setClickip4(ad.getClickip4()+notAd.getClickip4());
					item.setScrollip1(ad.getScrollip1()+notAd.getScrollip1());
					item.setScrollip2(ad.getScrollip2()+notAd.getScrollip2());
					item.setScrollip3(ad.getScrollip3()+notAd.getScrollip3());
					item.setScrollip4(ad.getScrollip4()+notAd.getScrollip4());
					item.setMoveip1(ad.getMoveip1()+notAd.getMoveip1());
					item.setMoveip2(ad.getMoveip2()+notAd.getMoveip2());
					item.setMoveip3(ad.getMoveip3()+notAd.getMoveip3());
					item.setMoveip4(ad.getMoveip4()+notAd.getMoveip4());
					list.add(item);
				}
			}else if("domainAd".equals(dataType)){
				list = ad15mStatDao.findByDomainIdAndDate(domainId,search_date);
			}else if("domainNotAd".equals(dataType)){
				list = notAd15mStatDao.findByDomainIdAndDate(domainId,search_date);
			}
			
			if((list==null || list.size()<1)){//没有数据   人造24条空数据
				JSONArray chart_1=new JSONArray();// IP、PV、UV
				JSONArray chart_2=new JSONArray();//老用户数、老ip、登陆用户数、进入目标页
				JSONArray chart_3=new JSONArray();//用户停留时长5-30、31-120、121-300、300+秒
				JSONArray chart_4=new JSONArray();//鼠标点击次数1-2、3-5、6-10、10+
				JSONArray chart_5=new JSONArray();//鼠标滚动次数1-2、3-5、6-10、10+
				JSONArray chart_6=new JSONArray();//鼠标移动次数1-2、3-5、6-10、10+
				
				for(int i=0;i<24;i++){
					String Bdate = new SimpleDateFormat("HH:mm").format(com.ada.app.util.Dates.todayStart());
					String strdate = com.ada.app.util.Dates.getbeforeTime(Bdate, 60*(i+1));
					JSONObject json_item_1=new JSONObject();
					JSONObject json_item_2=new JSONObject();
					JSONObject json_item_3=new JSONObject();
					JSONObject json_item_4=new JSONObject();
					JSONObject json_item_5=new JSONObject();
					JSONObject json_item_6=new JSONObject();
					
					json_item_1.put("date",strdate);
					json_item_1.put("ip", 0);
					json_item_1.put("pv", 0);
					json_item_1.put("uv", 0);
					
					json_item_2.put("date", strdate);
					json_item_2.put("olduser", 0);// 老用户数
					json_item_2.put("oldip", 0); // 老IP数
					json_item_2.put("loginip", 0);//登陆用户数
					json_item_2.put("targetpageip", 0);//进入目标页

					json_item_3.put("date", strdate);
					json_item_3.put("st1", 0);
					json_item_3.put("st2", 0);
					json_item_3.put("st3", 0);
					json_item_3.put("st4", 0);
					
					json_item_4.put("date", strdate);
					json_item_4.put("c1", 0);
					json_item_4.put("c2", 0);
					json_item_4.put("c3", 0);
					json_item_4.put("c4", 0);
					
					json_item_5.put("date", strdate);
					json_item_5.put("s1", 0);
					json_item_5.put("s2", 0);
					json_item_5.put("s3", 0);
					json_item_5.put("s4", 0);
					
					json_item_6.put("date", strdate);
					json_item_6.put("m1", 0);
					json_item_6.put("m2", 0);
					json_item_6.put("m3", 0);
					json_item_6.put("m4", 0);
					
					chart_1.add(json_item_1);
					chart_2.add(json_item_2);
					chart_3.add(json_item_3);
					chart_4.add(json_item_4);
					chart_5.add(json_item_5);
					chart_6.add(json_item_6);
				}
				Collections.reverse(chart_1);
				Collections.reverse(chart_2);
				Collections.reverse(chart_3);
				Collections.reverse(chart_4);
				Collections.reverse(chart_5);
				Collections.reverse(chart_6);
				json.put("chart_1", chart_1);
				json.put("chart_2", chart_2);
				json.put("chart_3", chart_3);
				json.put("chart_4", chart_4);
				json.put("chart_5", chart_5);
				json.put("chart_6", chart_6);
				json.put("success", true);
				json.put("message", "暂无统计数据！");
				return json;
			}
			
			JSONArray chart_1=new JSONArray();// IP、PV、UV
			JSONArray chart_2=new JSONArray();//老用户数、老ip、登陆用户数、进入目标页
			JSONArray chart_3=new JSONArray();//用户停留时长5-30、31-120、121-300、300+秒
			JSONArray chart_4=new JSONArray();//鼠标点击次数1-2、3-5、6-10、10+
			JSONArray chart_5=new JSONArray();//鼠标滚动次数1-2、3-5、6-10、10+
			JSONArray chart_6=new JSONArray();//鼠标移动次数1-2、3-5、6-10、10+
			BaseStatBean beforeItem = new BaseStatBean();
			BeanUtils.copyProperties(list.get(list.size()-1), beforeItem);
			Integer beforeNum = Integer.valueOf(new SimpleDateFormat("HH").format(beforeItem.getStartTime()));
			
			for(int i=0;i<beforeNum;i++){//前面的数据
				String Bdate = new SimpleDateFormat("HH:mm").format(beforeItem.getStartTime());
				String strdate = com.ada.app.util.Dates.getbeforeTime(Bdate, 60*(i+1));
				JSONObject json_item_1=new JSONObject();
				JSONObject json_item_2=new JSONObject();
				JSONObject json_item_3=new JSONObject();
				JSONObject json_item_4=new JSONObject();
				JSONObject json_item_5=new JSONObject();
				JSONObject json_item_6=new JSONObject();
				
				json_item_1.put("date",strdate);
				json_item_1.put("ip", 0);
				json_item_1.put("pv", 0);
				json_item_1.put("uv", 0);
				
				json_item_2.put("date", strdate);
				json_item_2.put("olduser", 0);// 老用户数
				json_item_2.put("oldip", 0); // 老IP数
				json_item_2.put("loginip", 0);//登陆用户数
				json_item_2.put("targetpageip", 0);//进入目标页

				json_item_3.put("date", strdate);
				json_item_3.put("st1", 0);
				json_item_3.put("st2", 0);
				json_item_3.put("st3", 0);
				json_item_3.put("st4", 0);
				
				json_item_4.put("date", strdate);
				json_item_4.put("c1", 0);
				json_item_4.put("c2", 0);
				json_item_4.put("c3", 0);
				json_item_4.put("c4", 0);
				
				json_item_5.put("date", strdate);
				json_item_5.put("s1", 0);
				json_item_5.put("s2", 0);
				json_item_5.put("s3", 0);
				json_item_5.put("s4", 0);
				
				json_item_6.put("date", strdate);
				json_item_6.put("m1", 0);
				json_item_6.put("m2", 0);
				json_item_6.put("m3", 0);
				json_item_6.put("m4", 0);
				
				chart_1.add(json_item_1);
				chart_2.add(json_item_2);
				chart_3.add(json_item_3);
				chart_4.add(json_item_4);
				chart_5.add(json_item_5);
				chart_6.add(json_item_6);
			}
			Collections.reverse(chart_1);
			Collections.reverse(chart_2);
			Collections.reverse(chart_3);
			Collections.reverse(chart_4);
			Collections.reverse(chart_5);
			Collections.reverse(chart_6);
			for(int i=list.size()-1;i>=0;i--){
				BaseStatBean item = new BaseStatBean();
				BeanUtils.copyProperties(list.get(i), item);
				
				String date = new SimpleDateFormat("HH:mm").format(item.getStartTime());
				//第一个图表
				JSONObject json_adChart_1=new JSONObject();
				json_adChart_1.put("date", date);
				json_adChart_1.put("ip", item.getIp());
				json_adChart_1.put("pv", item.getPv());
				json_adChart_1.put("uv", item.getUv());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_1.put("color", "#EF3F3F");
					json_adChart_1.put("lcolor", "red");
					json_adChart_1.put("alpha", 1);
				}
				chart_1.add(json_adChart_1);
				//第二个图表
				JSONObject json_adChart_2=new JSONObject();
				json_adChart_2.put("date", date); // 统计日期
				json_adChart_2.put("olduser", item.getOlduserip());// 老用户数
				json_adChart_2.put("oldip", item.getOldip()); // 老IP数
				json_adChart_2.put("loginip", item.getLoginip());//登陆用户数
				json_adChart_2.put("targetpageip", item.getTargetpageip());//进入目标页
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_2.put("color", "#EF3F3F");
					json_adChart_2.put("lcolor", "red");
					json_adChart_2.put("alpha", 1);
				}
				chart_2.add(json_adChart_2);
				//第三个图表
				JSONObject json_adChart_3=new JSONObject();
				json_adChart_3.put("date", date);
				json_adChart_3.put("st1", item.getStaytimeip1());
				json_adChart_3.put("st2", item.getStaytimeip2());
				json_adChart_3.put("st3", item.getStaytimeip3());
				json_adChart_3.put("st4", item.getStaytimeip4());
				json_adChart_3.put("ip", item.getIp());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_3.put("color", "#EF3F3F");
					json_adChart_3.put("lcolor", "red");
					json_adChart_3.put("alpha", 1);
				}
				chart_3.add(json_adChart_3);
				//第四个图表
				JSONObject json_adChart_4=new JSONObject();
				json_adChart_4.put("date", date); // 统计日期
				json_adChart_4.put("c1", item.getClickip1());
				json_adChart_4.put("c2", item.getClickip2());
				json_adChart_4.put("c3", item.getClickip3());
				json_adChart_4.put("c4", item.getClickip4());
				json_adChart_4.put("ip", item.getIp());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_4.put("color", "#EF3F3F");
					json_adChart_4.put("lcolor", "red");
					json_adChart_4.put("alpha", 1);
				}
				chart_4.add(json_adChart_4);
				
				//第五个图表
				JSONObject json_adChart_5=new JSONObject();
				json_adChart_5.put("date", date);
				json_adChart_5.put("s1", item.getScrollip1());
				json_adChart_5.put("s2", item.getScrollip2());
				json_adChart_5.put("s3", item.getScrollip3());
				json_adChart_5.put("s4", item.getScrollip4());
				json_adChart_5.put("ip", item.getIp());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_5.put("color", "#EF3F3F");
					json_adChart_5.put("lcolor", "red");
					json_adChart_5.put("alpha", 1);
				}
				chart_5.add(json_adChart_5);
				//第六个图表
				JSONObject json_adChart_6=new JSONObject();
				json_adChart_6.put("date", date);
				json_adChart_6.put("m1", item.getMoveip1());
				json_adChart_6.put("m2", item.getMoveip2());
				json_adChart_6.put("m3", item.getMoveip3());
				json_adChart_6.put("m4", item.getMoveip4());
				json_adChart_6.put("ip", item.getIp());
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_6.put("color", "#EF3F3F");
					json_adChart_6.put("lcolor", "red");
					json_adChart_6.put("alpha", 1);
				}
				chart_6.add(json_adChart_6);
			}
			
			BaseStatBean afterItem = new BaseStatBean();
			BeanUtils.copyProperties(list.get(0), afterItem);
			Integer afterNum = 23 - Integer.valueOf(new SimpleDateFormat("HH").format(afterItem.getStartTime()));
			
			for(int i=0;i<afterNum;i++){//后面的数据
			
				String Bdate = new SimpleDateFormat("HH:mm").format(afterItem.getStartTime());
				String strdate = com.ada.app.util.Dates.getbeforeTime(Bdate, -60*(i+1));
				JSONObject json_item_1=new JSONObject();
				JSONObject json_item_2=new JSONObject();
				JSONObject json_item_3=new JSONObject();
				JSONObject json_item_4=new JSONObject();
				JSONObject json_item_5=new JSONObject();
				JSONObject json_item_6=new JSONObject();
				
				json_item_1.put("date",strdate);
				json_item_1.put("ip", 0);
				json_item_1.put("pv", 0);
				json_item_1.put("uv", 0);
				
				json_item_2.put("date", strdate);
				json_item_2.put("olduser", 0);// 老用户数
				json_item_2.put("oldip", 0); // 老IP数
				json_item_2.put("loginip", 0);//登陆用户数
				json_item_2.put("targetpageip", 0);//进入目标页

				json_item_3.put("date", strdate);
				json_item_3.put("st1", 0);
				json_item_3.put("st2", 0);
				json_item_3.put("st3", 0);
				json_item_3.put("st4", 0);
				
				json_item_4.put("date", strdate);
				json_item_4.put("c1", 0);
				json_item_4.put("c2", 0);
				json_item_4.put("c3", 0);
				json_item_4.put("c4", 0);
				
				json_item_5.put("date", strdate);
				json_item_5.put("s1", 0);
				json_item_5.put("s2", 0);
				json_item_5.put("s3", 0);
				json_item_5.put("s4", 0);
				
				json_item_6.put("date", strdate);
				json_item_6.put("m1", 0);
				json_item_6.put("m2", 0);
				json_item_6.put("m3", 0);
				json_item_6.put("m4", 0);
				
				chart_1.add(json_item_1);
				chart_2.add(json_item_2);
				chart_3.add(json_item_3);
				chart_4.add(json_item_4);
				chart_5.add(json_item_5);
				chart_6.add(json_item_6);
			}
			
			json.put("success", true);
	
			
			json.put("chart_1", chart_1);
			json.put("chart_2", chart_2);
			json.put("chart_3", chart_3);
			json.put("chart_4", chart_4);
			json.put("chart_5", chart_5);
			json.put("chart_6", chart_6);
		} catch (Exception e) {
			log.error("获取域名广告入口和非广告入口图形数据失败,msg->"+e.getMessage(),e);
		}
	
		
		
		
		
		return json;
	
	}
	
	/**
	 * 获取域名图表数据
	 * @param domainId 域名ID
	 * @param pageSize  每一页的数据条数
	 * @param len  统计的间隔时间
	 * @param pageNo   第几页
	 * @return
	 */
	protected JSONObject domainTimechartList(Integer domainId,String search_date){
		
		JSONObject json=new JSONObject();
		json.put("search_date", search_date);
		json.put("nextPage", com.ada.app.util.Dates.getTomorrowDate(search_date)); 
		json.put("lastPage", com.ada.app.util.Dates.getYestDate(search_date));
		
		List<AdaDomainAd15mStat> adList = ad15mStatDao.findByDomainIdAndDate(domainId,search_date);
		List<AdaDomainNotad15mStat> notadList = notAd15mStatDao.findByDomainIdAndDate(domainId,search_date);
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
		if((adList==null || adList.size()<1)&&(notadList==null || notadList.size()<1)){//没有数据   人造24条空数据
			
			for(int i=0;i<24;i++){//广告入口
				String Bdate = new SimpleDateFormat("HH:mm").format(com.ada.app.util.Dates.todayStart());
				String strdate = com.ada.app.util.Dates.getbeforeTime(Bdate, 60*(i+1));
				JSONObject json_item_1=new JSONObject();
				JSONObject json_item_2=new JSONObject();
				JSONObject json_item_3=new JSONObject();
				JSONObject json_item_4=new JSONObject();
				JSONObject json_item_5=new JSONObject();
				JSONObject json_item_6=new JSONObject();
				
				json_item_1.put("date", strdate);
				json_item_1.put("olduser", 0);// 老用户数
				json_item_1.put("oldip", 0); // 老IP数
				json_item_1.put("loginip", 0);//登陆用户数
				json_item_1.put("targetpageip", 0);//进入目标页

				json_item_2.put("date", strdate);
				json_item_2.put("c1", 0);
				json_item_2.put("c2", 0);
				json_item_2.put("c3", 0);
				json_item_2.put("c4", 0);
				
				json_item_3.put("date", strdate);
				json_item_3.put("st1", 0);
				json_item_3.put("st2", 0);
				json_item_3.put("st3", 0);
				json_item_3.put("st4", 0);
				
				json_item_4.put("date", strdate);
				json_item_4.put("s1", 0);
				json_item_4.put("s2", 0);
				json_item_4.put("s3", 0);
				json_item_4.put("s4", 0);
				
				json_item_5.put("date", strdate);
				json_item_5.put("m1", 0);
				json_item_5.put("m2", 0);
				json_item_5.put("m3", 0);
				json_item_5.put("m4", 0);
				
				json_item_6.put("date",strdate);
				json_item_6.put("ip", 0);
				json_item_6.put("pv", 0);
				json_item_6.put("uv", 0);
				
				ad_chart_1.add(json_item_1);
				ad_chart_2.add(json_item_2);
				ad_chart_3.add(json_item_3);
				ad_chart_4.add(json_item_4);
				ad_chart_5.add(json_item_5);
				ad_chart_6.add(json_item_6);
			}
			for(int i=0;i<24;i++){//非广告入口
				String Bdate = new SimpleDateFormat("HH:mm").format(com.ada.app.util.Dates.todayStart());
				String strdate = com.ada.app.util.Dates.getbeforeTime(Bdate, 60*(i+1));
				JSONObject json_item_1=new JSONObject();
				JSONObject json_item_2=new JSONObject();
				JSONObject json_item_3=new JSONObject();
				JSONObject json_item_4=new JSONObject();
				JSONObject json_item_5=new JSONObject();
				JSONObject json_item_6=new JSONObject();
				
				json_item_1.put("date", strdate);
				json_item_1.put("olduser", 0);// 老用户数
				json_item_1.put("oldip", 0); // 老IP数
				json_item_1.put("loginip", 0);//登陆用户数
				json_item_1.put("targetpageip", 0);//进入目标页

				json_item_2.put("date", strdate);
				json_item_2.put("c1", 0);
				json_item_2.put("c2", 0);
				json_item_2.put("c3", 0);
				json_item_2.put("c4", 0);
				
				json_item_3.put("date", strdate);
				json_item_3.put("st1", 0);
				json_item_3.put("st2", 0);
				json_item_3.put("st3", 0);
				json_item_3.put("st4", 0);
				
				json_item_4.put("date", strdate);
				json_item_4.put("s1", 0);
				json_item_4.put("s2", 0);
				json_item_4.put("s3", 0);
				json_item_4.put("s4", 0);
				
				json_item_5.put("date", strdate);
				json_item_5.put("m1", 0);
				json_item_5.put("m2", 0);
				json_item_5.put("m3", 0);
				json_item_5.put("m4", 0);
				
				json_item_6.put("date",strdate);
				json_item_6.put("ip", 0);
				json_item_6.put("pv", 0);
				json_item_6.put("uv", 0);
				
				notad_chart_1.add(json_item_1);
				notad_chart_2.add(json_item_2);
				notad_chart_3.add(json_item_3);
				notad_chart_4.add(json_item_4);
				notad_chart_5.add(json_item_5);
				notad_chart_6.add(json_item_6);
			}
			Collections.reverse(ad_chart_1);
			Collections.reverse(ad_chart_2);
			Collections.reverse(ad_chart_3);
			Collections.reverse(ad_chart_4);
			Collections.reverse(ad_chart_5);
			Collections.reverse(ad_chart_6);
			Collections.reverse(notad_chart_1);
			Collections.reverse(notad_chart_2);
			Collections.reverse(notad_chart_3);
			Collections.reverse(notad_chart_4);
			Collections.reverse(notad_chart_5);
			Collections.reverse(notad_chart_6);
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
			json.put("success", true);
			json.put("message", "暂无统计数据！");
			return json;
		}
	
		
		BaseStatBean beforeItem = new BaseStatBean();
		BeanUtils.copyProperties(adList.get(adList.size()-1), beforeItem);
		Integer beforeNum = Integer.valueOf(new SimpleDateFormat("HH").format(beforeItem.getStartTime()));
		try {
				for(int i=0;i<beforeNum;i++){//前面的数据
					String date = new SimpleDateFormat("HH:mm").format(beforeItem.getStartTime());
					String strdate = com.ada.app.util.Dates.getbeforeTime(date, 60*(i+1));
					JSONObject json_item_1=new JSONObject();
					JSONObject json_item_2=new JSONObject();
					JSONObject json_item_3=new JSONObject();
					JSONObject json_item_4=new JSONObject();
					JSONObject json_item_5=new JSONObject();
					JSONObject json_item_6=new JSONObject();
					
					json_item_1.put("date", strdate);
					json_item_1.put("olduser", 0);// 老用户数
					json_item_1.put("oldip", 0); // 老IP数
					json_item_1.put("loginip", 0);//登陆用户数
					json_item_1.put("targetpageip", 0);//进入目标页
					
					json_item_2.put("date", strdate);
					json_item_2.put("c1", 0);
					json_item_2.put("c2", 0);
					json_item_2.put("c3", 0);
					json_item_2.put("c4", 0);
					
					json_item_3.put("date", strdate);
					json_item_3.put("st1", 0);
					json_item_3.put("st2", 0);
					json_item_3.put("st3", 0);
					json_item_3.put("st4", 0);
					
					json_item_4.put("date", strdate);
					json_item_4.put("s1", 0);
					json_item_4.put("s2", 0);
					json_item_4.put("s3", 0);
					json_item_4.put("s4", 0);
					
					json_item_5.put("date", strdate);
					json_item_5.put("m1", 0);
					json_item_5.put("m2", 0);
					json_item_5.put("m3", 0);
					json_item_5.put("m4", 0);
					
					json_item_6.put("date",strdate);
					json_item_6.put("ip", 0);
					json_item_6.put("pv", 0);
					json_item_6.put("uv", 0);
					
					ad_chart_1.add(json_item_1);
					ad_chart_2.add(json_item_2);
					ad_chart_3.add(json_item_3);
					ad_chart_4.add(json_item_4);
					ad_chart_5.add(json_item_5);
					ad_chart_6.add(json_item_6);
				}
				for(int i=0;i<beforeNum;i++){//前面的数据
					String date = new SimpleDateFormat("HH:mm").format(beforeItem.getStartTime());
					String strdate = com.ada.app.util.Dates.getbeforeTime(date, 60*(i+1));
					JSONObject json_item_1=new JSONObject();
					JSONObject json_item_2=new JSONObject();
					JSONObject json_item_3=new JSONObject();
					JSONObject json_item_4=new JSONObject();
					JSONObject json_item_5=new JSONObject();
					JSONObject json_item_6=new JSONObject();
					
					json_item_1.put("date", strdate);
					json_item_1.put("olduser", 0);// 老用户数
					json_item_1.put("oldip", 0); // 老IP数
					json_item_1.put("loginip", 0);//登陆用户数
					json_item_1.put("targetpageip", 0);//进入目标页
					
					json_item_2.put("date", strdate);
					json_item_2.put("c1", 0);
					json_item_2.put("c2", 0);
					json_item_2.put("c3", 0);
					json_item_2.put("c4", 0);
					
					json_item_3.put("date", strdate);
					json_item_3.put("st1", 0);
					json_item_3.put("st2", 0);
					json_item_3.put("st3", 0);
					json_item_3.put("st4", 0);
					
					json_item_4.put("date", strdate);
					json_item_4.put("s1", 0);
					json_item_4.put("s2", 0);
					json_item_4.put("s3", 0);
					json_item_4.put("s4", 0);
					
					json_item_5.put("date", strdate);
					json_item_5.put("m1", 0);
					json_item_5.put("m2", 0);
					json_item_5.put("m3", 0);
					json_item_5.put("m4", 0);
					
					json_item_6.put("date",strdate);
					json_item_6.put("ip", 0);
					json_item_6.put("pv", 0);
					json_item_6.put("uv", 0);
					
					notad_chart_1.add(json_item_1);
					notad_chart_2.add(json_item_2);
					notad_chart_3.add(json_item_3);
					notad_chart_4.add(json_item_4);
					notad_chart_5.add(json_item_5);
					notad_chart_6.add(json_item_6);
				}
				Collections.reverse(ad_chart_1);
				Collections.reverse(ad_chart_2);
				Collections.reverse(ad_chart_3);
				Collections.reverse(ad_chart_4);
				Collections.reverse(ad_chart_5);
				Collections.reverse(ad_chart_6);
				Collections.reverse(notad_chart_1);
				Collections.reverse(notad_chart_2);
				Collections.reverse(notad_chart_3);
				Collections.reverse(notad_chart_4);
				Collections.reverse(notad_chart_5);
				Collections.reverse(notad_chart_6);
				
			for(int i=adList.size()-1;i>=0;i--){
				/** 广告入口数据  **/
				AdaDomainAd15mStat item = adList.get(i);
				String date = new SimpleDateFormat("HH:mm").format(item.getStartTime());
				//第一个图表
				JSONObject json_adChart_1=new JSONObject();
				json_adChart_1.put("date", date); // 统计日期
				json_adChart_1.put("olduser", item.getOlduserip());// 老用户数
				json_adChart_1.put("oldip", item.getOldip()); // 老IP数
				json_adChart_1.put("loginip", item.getLoginip());//登陆用户数
				json_adChart_1.put("targetpageip", item.getTargetpageip());//进入目标页
				json_adChart_1.put("ip", item.getIp());
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
				json_adChart_2.put("ip", item.getIp());
				json_adChart_2.put("adcTotal", item.getClickip1()+item.getClickip2()+item.getClickip3()+item.getClickip4());
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
				json_adChart_3.put("ip", item.getIp());
				json_adChart_3.put("adstTotal", item.getStaytimeip1()+item.getStaytimeip2()+item.getStaytimeip3()+item.getStaytimeip4());
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
				json_adChart_4.put("ip", item.getIp());
				json_adChart_4.put("adsTotal", item.getScrollip1()+item.getScrollip2()+item.getScrollip3()+item.getScrollip4());
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
				json_adChart_5.put("ip", item.getIp());
				json_adChart_5.put("admTotal", item.getMoveip1()+item.getMoveip2()+item.getMoveip3()+item.getMoveip4());
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
				String date = new SimpleDateFormat("HH:mm").format(notad.getStartTime());
				//第一图表
				JSONObject json_notadChart_1=new JSONObject();
				json_notadChart_1.put("date", date);
				json_notadChart_1.put("olduser", notad.getOlduserip());
				json_notadChart_1.put("oldip", notad.getOldip());
				json_notadChart_1.put("loginip", notad.getLoginip());
				json_notadChart_1.put("targetpageip", notad.getTargetpageip());
				json_notadChart_1.put("ip", notad.getIp());//进入目标页
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
				json_notadChart_2.put("ip", notad.getIp());
				json_notadChart_2.put("notAdcTotal", notad.getClickip1()+notad.getClickip2()+notad.getClickip3()+notad.getClickip4());
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
				json_notadChart_3.put("ip", notad.getIp());
				json_notadChart_3.put("notAdstTotal", notad.getStaytimeip1()+notad.getStaytimeip2()+notad.getStaytimeip3()+notad.getStaytimeip4());
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
				json_notadChart_4.put("ip", notad.getIp());
				json_notadChart_4.put("notAdsTotal", notad.getScrollip1()+notad.getScrollip2()+notad.getScrollip3()+notad.getScrollip4());
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
				json_notadChart_5.put("ip", notad.getIp());
				json_notadChart_5.put("notAdmTotal", notad.getMoveip1()+notad.getMoveip2()+notad.getMoveip3()+notad.getMoveip4());
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
			BaseStatBean afterItem = new BaseStatBean();
			BeanUtils.copyProperties(adList.get(0), afterItem);
			Integer afterNum = 23 - Integer.valueOf(new SimpleDateFormat("HH").format(afterItem.getStartTime()));
			for(int i=0;i<afterNum;i++){//后面的数据
				String date = new SimpleDateFormat("HH:mm").format(afterItem.getStartTime());
				String strdate = com.ada.app.util.Dates.getbeforeTime(date, -60*(i+1));
				JSONObject json_item_1=new JSONObject();
				JSONObject json_item_2=new JSONObject();
				JSONObject json_item_3=new JSONObject();
				JSONObject json_item_4=new JSONObject();
				JSONObject json_item_5=new JSONObject();
				JSONObject json_item_6=new JSONObject();
				
				json_item_1.put("date", strdate);
				json_item_1.put("olduser", 0);// 老用户数
				json_item_1.put("oldip", 0); // 老IP数
				json_item_1.put("loginip", 0);//登陆用户数
				json_item_1.put("targetpageip", 0);//进入目标页
				
				json_item_2.put("date", strdate);
				json_item_2.put("c1", 0);
				json_item_2.put("c2", 0);
				json_item_2.put("c3", 0);
				json_item_2.put("c4", 0);
				
				json_item_3.put("date", strdate);
				json_item_3.put("st1", 0);
				json_item_3.put("st2", 0);
				json_item_3.put("st3", 0);
				json_item_3.put("st4", 0);
				
				json_item_4.put("date", strdate);
				json_item_4.put("s1", 0);
				json_item_4.put("s2", 0);
				json_item_4.put("s3", 0);
				json_item_4.put("s4", 0);
				
				json_item_5.put("date", strdate);
				json_item_5.put("m1", 0);
				json_item_5.put("m2", 0);
				json_item_5.put("m3", 0);
				json_item_5.put("m4", 0);
				
				json_item_6.put("date",strdate);
				json_item_6.put("ip", 0);
				json_item_6.put("pv", 0);
				json_item_6.put("uv", 0);
				
				ad_chart_1.add(json_item_1);
				ad_chart_2.add(json_item_2);
				ad_chart_3.add(json_item_3);
				ad_chart_4.add(json_item_4);
				ad_chart_5.add(json_item_5);
				ad_chart_6.add(json_item_6);
			}
			for(int i=0;i<afterNum;i++){//后面的数据
				String date = new SimpleDateFormat("HH:mm").format(afterItem.getStartTime());
				String strdate = com.ada.app.util.Dates.getbeforeTime(date, -60*(i+1));
				JSONObject json_item_1=new JSONObject();
				JSONObject json_item_2=new JSONObject();
				JSONObject json_item_3=new JSONObject();
				JSONObject json_item_4=new JSONObject();
				JSONObject json_item_5=new JSONObject();
				JSONObject json_item_6=new JSONObject();
				
				json_item_1.put("date", strdate);
				json_item_1.put("olduser", 0);// 老用户数
				json_item_1.put("oldip", 0); // 老IP数
				json_item_1.put("loginip", 0);//登陆用户数
				json_item_1.put("targetpageip", 0);//进入目标页
				
				json_item_2.put("date", strdate);
				json_item_2.put("c1", 0);
				json_item_2.put("c2", 0);
				json_item_2.put("c3", 0);
				json_item_2.put("c4", 0);
				
				json_item_3.put("date", strdate);
				json_item_3.put("st1", 0);
				json_item_3.put("st2", 0);
				json_item_3.put("st3", 0);
				json_item_3.put("st4", 0);
				
				json_item_4.put("date", strdate);
				json_item_4.put("s1", 0);
				json_item_4.put("s2", 0);
				json_item_4.put("s3", 0);
				json_item_4.put("s4", 0);
				
				json_item_5.put("date", strdate);
				json_item_5.put("m1", 0);
				json_item_5.put("m2", 0);
				json_item_5.put("m3", 0);
				json_item_5.put("m4", 0);
				
				json_item_6.put("date",strdate);
				json_item_6.put("ip", 0);
				json_item_6.put("pv", 0);
				json_item_6.put("uv", 0);
				
				notad_chart_1.add(json_item_1);
				notad_chart_2.add(json_item_2);
				notad_chart_3.add(json_item_3);
				notad_chart_4.add(json_item_4);
				notad_chart_5.add(json_item_5);
				notad_chart_6.add(json_item_6);
			}
			
			json.put("success", true);
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
	
	/** 域名统计信息 **/
	protected Map getDomainStat_list(Date date,String domainName,int top){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 List<AdaDomain> domains = this.adaDomainDao.findBySiteIdAndLikeDomain(adaSite.getId(),domainName);
		 Integer domainSumIP = 0;/** ip总数 **/
		 Integer domainSumPV = 0;/** PV总数 **/
		 
		 List<Integer[]> domainIps = new ArrayList();
		 
		 for(AdaDomain domain : domains){
			 Integer domainIp = statService.statDomainIP(domain.getId(), date);
			 if(domainIp!=null){
				 domainIps.add(new Integer[]{domain.getId(),domainIp});
			 }
		 }
		 
		 /** 根据ip数排序 **/
		 Collections.sort(domainIps,new Comparator<Integer[]>(){
				public int compare(Integer[] int1, Integer[] int2) {
					Integer integer = (Integer) int1[1];
					Integer integer2 = (Integer) int2[1];
					return integer2.compareTo(integer);
				}
	     });
		 
		 for(int i=0;i<domainIps.size() && i<top;i++){
			Integer domainId = domainIps.get(i)[0];
			AdaDomainStat domainStat = this.statService.statDomain(adaSite.getId(), domainId, date);
			//Map map = getMap(domainStat);
			List<Object> list = getList(domainStat);
			list.add(domainId);
			String domainstr = adaDomainDao.findById(domainStat.getDomainId()).getDomain();
			list.add(domainstr);
			if(domainstr.length()>18){
				 list.add(domainstr.substring(0, 18));
			}else{
				 list.add(domainstr);
			}
			 
			domainSumIP+=domainStat.getIp();
			domainSumPV+=domainStat.getPv();
			DomainStat_list.add(list);
		}
		 
		 Map map = new HashMap();
		
		 map.put("DomainStat_list", DomainStat_list);
		 map.put("domainSumIP", domainSumIP);
		 map.put("domainSumPV", domainSumPV);
		 
		 return map;
	}
	/** 渠道统计信息 **/
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
			 Map map = getMap(channelStat);
			 map.put("channelStr",adaChannelDao.findById(channelStat.getChannelId()).getChannelStr());
			 
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
	/** 地域统计信息  **/
	protected Map getDomainRegion(Date date,Integer domainId,String city,int top){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		AdaDomainStat domainStat = this.statService.statDomain(adaSite.getId(), domainId, date);
	
		List<List<Object>> region_list = new ArrayList<List<Object>>();
		List<String[]> IPs = new ArrayList();//先取出IP数 
		Set<String> regiondata = statService.getCityList(domainId, date);
		
		if(city!=null && !"".equals(city)){
			List<String> regionList = new ArrayList<String>();
			for(String cityName:regiondata){
				if(cityName.indexOf(city)!=-1)regionList.add(cityName);
			}
			for(String cityName:regionList){
				Integer IP = statService.statRegionIP(domainId, cityName, date);
				 if(IP!=null){
					 IPs.add(new String[]{cityName,String.valueOf(IP)});
				 }
			}
		}else{
			for(String cityName:regiondata){
				Integer IP = statService.statRegionIP(domainId, cityName, date);
				 if(IP!=null){
					 IPs.add(new String[]{cityName,String.valueOf(IP)});
				 }
			}
		}
		
		/** 根据ip数排序 **/
		 Collections.sort(IPs,new Comparator<String[]>(){
				public int compare(String[] int1, String[] int2) {
					Integer integer = Integer.valueOf(int1[1]) ;
					Integer integer2 = Integer.valueOf(int2[1]);
					return integer2.compareTo(integer);
				}
	     });
		
		for (int i=0;i<IPs.size()&&i<top;i++) {
			String regionName = IPs.get(i)[0];
			DomainAreaStat region = statService.statDomainRegion(regionName, domainId, date);
			List<Object> list = getList(region);
			list.add(regionName);
		    Integer ip = region.getIp();
		    region_list.add(list);
			 
		}
	
		Map map = new HashMap();
		map.put("data_list", region_list);
		map.put("domainStat", domainStat);
		return map;
	}
	/** 地域广告入口统计数据 **/
	protected Map getDomainRegionAd_data(Date date,Integer domainId,String city,int top){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		AdaDomainAdStat domainAdStat = this.statService.statDomainAd(adaSite.getId(), domainId, date);
		List<List<Object>> regionAd_list = new ArrayList<List<Object>>();
		List<String[]> IPs = new ArrayList();//先取出IP数 
		Set<String> regiondata = statService.getCityList(domainId, date);
		
		if(city!=null && !"".equals(city)){
			List<String> regionList = new ArrayList<String>();
			for(String cityName:regiondata){
				if(cityName.indexOf(city)!=-1)regionList.add(cityName);
			}
			for(String cityName:regionList){
				Integer IP = statService.statRegionAdIP(domainId, cityName, date);
				 if(IP!=null){
					 IPs.add(new String[]{cityName,String.valueOf(IP)});
				 }
			}
		}else{
			for(String cityName:regiondata){
				Integer IP = statService.statRegionAdIP(domainId, cityName, date);
				 if(IP!=null){
					 IPs.add(new String[]{cityName,String.valueOf(IP)});
				 }
			}
		}
		
		/** 根据ip数排序 **/
		 Collections.sort(IPs,new Comparator<String[]>(){
				public int compare(String[] int1, String[] int2) {
					Integer integer = Integer.valueOf(int1[1]) ;
					Integer integer2 = Integer.valueOf(int2[1]);
					return integer2.compareTo(integer);
				}
	     });
		
		for (int i=0;i<IPs.size()&&i<top;i++) {
			String regionName = IPs.get(i)[0];
			DomainAreaStat regionAd = statService.statDomainRegionAd(regionName, domainId, date);
			List<Object> list = getList(regionAd);
			list.add(regionName);
		    Integer ip = regionAd.getIp();
		    regionAd_list.add(list);
			 
		}
	
		Map map = new HashMap();
		map.put("data_list", regionAd_list);
		map.put("domainAdStat", domainAdStat);
		return map;
	}
	/** 地域非广告入口统计数据 **/
	protected Map getDomainRegionNotAd_data(Date date,Integer domainId,String city,int top) {
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		AdaDomainNotadStat statDomainNotAd = this.statService.statDomainNotAd(adaSite.getId(), domainId, date);
		List<List<Object>> regionNotAd_list = new ArrayList<List<Object>>();
		List<String[]> IPs = new ArrayList();//先取出IP数 
		Set<String> regiondata = statService.getCityList(domainId, date);
		
		if(city!=null && !"".equals(city)){
			List<String> regionList = new ArrayList<String>();
			for(String cityName:regiondata){
				if(cityName.indexOf(city)!=-1)regionList.add(cityName);
			}
			for(String cityName:regionList){
				Integer IP = statService.statRegionNotAdIP(domainId, cityName, date);
				 if(IP!=null){
					 IPs.add(new String[]{cityName,String.valueOf(IP)});
				 }
			}
		}else{
			for(String cityName:regiondata){
				Integer IP = statService.statRegionNotAdIP(domainId, cityName, date);
				 if(IP!=null){
					 IPs.add(new String[]{cityName,String.valueOf(IP)});
				 }
			}
		}
		
	
		/** 根据ip数排序 **/
		 Collections.sort(IPs,new Comparator<String[]>(){
				public int compare(String[] int1, String[] int2) {
					Integer integer = Integer.valueOf(int1[1]) ;
					Integer integer2 = Integer.valueOf(int2[1]);
					return integer2.compareTo(integer);
				}
	     });
		for (int i=0;i<IPs.size()&&i<top;i++) {
			String regionName = IPs.get(i)[0];
			DomainAreaStat regionNotAd = statService.statDomainRegionNotAd(regionName, domainId, date);
			List<Object> list = getList(regionNotAd);
			list.add(regionName);
			Integer ip = regionNotAd.getIp();
		    regionNotAd_list.add(list);
		}
		
		Map map = new HashMap();
		map.put("data_list", regionNotAd_list);
		map.put("domainNotAdStat", statDomainNotAd);
		return map;
	}
	/** 域名广告入口统计数据 **/
	protected Map getDomainAdData(Date date,String domainName,int top){
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 List<AdaDomain> domains = this.adaDomainDao.findBySiteIdAndLikeDomain(adaSite.getId(),domainName);
		 
		 List<Integer[]> domainIps = new ArrayList();
		 
		 for(AdaDomain domain : domains){
//			 Integer domainIp = statService.statDomainAdIP(domain.getId(), date);
			 Integer domainIp = statService.statDomainIP(domain.getId(), date);
			 if(domainIp!=null){
				 domainIps.add(new Integer[]{domain.getId(),domainIp});
			 }
		 }
		 /** 根据ip数排序 **/
		 Collections.sort(domainIps,new Comparator<Integer[]>(){
				public int compare(Integer[] int1, Integer[] int2) {
					Integer integer = (Integer) int1[1];
					Integer integer2 = (Integer) int2[1];
					return integer2.compareTo(integer);
				}
	     });
		 for(int i=0;i<domainIps.size()&&i<top;i++){
			Integer domainId = domainIps.get(i)[0];
			Integer domainIp = domainIps.get(i)[1];
			
			AdaDomainAdStat domainStat = this.statService.statDomainAd(adaSite.getId(), domainId, date);
			List<Object> list = getList(domainStat);
			list.add(domainId);
			String domainstr = adaDomainDao.findById(domainId).getDomain();
			list.add(domainstr);
			if(domainstr.length()>18){
				 list.add(domainstr.substring(0, 18));
			}else{
				 list.add(domainstr);
			}
			
			DomainStat_list.add(list);
		}
		 
		 Map map = new HashMap();
		 map.put("data_list", DomainStat_list);
		 
		 return map;
	}
	/** 域名非广告入口数据 **/
	protected Map getDomainNotAdData(Date date,String domainName,int top){

		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 List<AdaDomain> domains = this.adaDomainDao.findBySiteIdAndLikeDomain(adaSite.getId(),domainName);
		 
		 List<Integer[]> domainIps = new ArrayList();
		 
		 for(AdaDomain domain : domains){
//			 Integer domainIp = statService.statDomainNotAdIP(domain.getId(), date);
			 Integer domainIp = statService.statDomainIP(domain.getId(), date);
			 if(domainIp!=null){
				 domainIps.add(new Integer[]{domain.getId(),domainIp});
			 }
		 }
		 /** 根据ip数排序 **/
		 Collections.sort(domainIps,new Comparator<Integer[]>(){
				public int compare(Integer[] int1, Integer[] int2) {
					Integer integer = (Integer) int1[1];
					Integer integer2 = (Integer) int2[1];
					return integer2.compareTo(integer);
				}
	     });
		 
		 for(int i=0;i<domainIps.size()&&i<top;i++){
			Integer domainId = domainIps.get(i)[0];
			Integer domainIp = domainIps.get(i)[1];
			AdaDomainAdStat newad = statService.statDomainAd(adaSite.getId(), domainId, date);//广告新数据
			AdaDomainStat newall = statService.statDomain(adaSite.getId(), domainId, date);//全部新数据
			AdaDomainNotadStat domainStat = reduct(newall, newad, AdaDomainNotadStat.class);//非广告入口新数据=全部-非广告的
			List<Object> list = getList(domainStat);
			list.add(domainId);
			String domainstr = adaDomainDao.findById(domainId).getDomain();
			 list.add(domainstr);
			 if(domainstr.length()>18){
				 list.add(domainstr.substring(0, 18));
			 }else{
				 list.add(domainstr);
			 }
			
			 DomainStat_list.add(list);
		}
		
		 Map map = new HashMap();
		
		 map.put("data_list", DomainStat_list);
		 
		 return map;
	
	}
	/**
	 * 获取通用数据
	 * @param obj
	 * @return
	 */
	protected Map getMap(Object obj) {
		Map map = new HashMap();
		BaseStatBean statBean = new BaseStatBean();
		BeanUtils.copyProperties(obj, statBean);//复制相同名字的属性的值
		Integer ip = 0;
		Integer pv = 0;
		Integer uv = 0;
		Integer olduserip = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer targetpageip =0;
		Integer staytimeip1=0;
		Integer staytimeip2=0;
		Integer staytimeip3=0;
		Integer staytimeip4=0;
		Integer clickip1=0;
		Integer clickip2=0;
		Integer clickip3=0;
		Integer clickip4=0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		if(statBean!=null){
			 
			 if(statBean.getIp()!=null && statBean.getIp()>0)ip = statBean.getIp();
			 if(statBean.getPv()!=null && statBean.getPv()>0)pv = statBean.getPv();
			 if(statBean.getUv()!=null && statBean.getUv()>0)uv = statBean.getUv();
			 if(statBean.getOlduserip()!=null && statBean.getOlduserip()>0)olduserip = statBean.getOlduserip();
			 if(statBean.getOldip()!=null && statBean.getOldip()>0)oldip = statBean.getOldip();
			 if(statBean.getLoginip()!=null && statBean.getLoginip()>0)loginip = statBean.getLoginip();
			 if(statBean.getTargetpageip()!=null && statBean.getTargetpageip()>0)targetpageip = statBean.getTargetpageip();
			 if(statBean.getStaytimeip1()!=null && statBean.getStaytimeip1()>0)staytimeip1 = statBean.getStaytimeip1();
			 if(statBean.getStaytimeip2()!=null && statBean.getStaytimeip2()>0)staytimeip2 = statBean.getStaytimeip2();
			 if(statBean.getStaytimeip3()!=null && statBean.getStaytimeip3()>0)staytimeip3 = statBean.getStaytimeip3();
			 if(statBean.getStaytimeip4()!=null && statBean.getStaytimeip4()>0)staytimeip4 = statBean.getStaytimeip4();
			 if(statBean.getClickip1()!=null && statBean.getClickip1()>0)clickip1 = statBean.getClickip1();
			 if(statBean.getClickip2()!=null && statBean.getClickip2()>0)clickip2 = statBean.getClickip2();
			 if(statBean.getClickip3()!=null && statBean.getClickip3()>0)clickip3 = statBean.getClickip3();
			 if(statBean.getClickip4()!=null && statBean.getClickip4()>0)clickip4 = statBean.getClickip4();
			 if(statBean.getScrollip1()!=null && statBean.getScrollip1()>0)scrollip1 = statBean.getScrollip1();
			 if(statBean.getScrollip2()!=null && statBean.getScrollip2()>0)scrollip2 = statBean.getScrollip2();
			 if(statBean.getScrollip3()!=null && statBean.getScrollip3()>0)scrollip3 = statBean.getScrollip3();
			 if(statBean.getScrollip4()!=null && statBean.getScrollip4()>0)scrollip4 = statBean.getScrollip4();
			 if(statBean.getMoveip1()!=null && statBean.getMoveip1()>0)moveip1 = statBean.getMoveip1();
			 if(statBean.getMoveip2()!=null && statBean.getMoveip2()>0)moveip2 = statBean.getMoveip2();
			 if(statBean.getMoveip3()!=null && statBean.getMoveip3()>0)moveip3 = statBean.getMoveip3();
			 if(statBean.getMoveip4()!=null && statBean.getMoveip4()>0)moveip4 = statBean.getMoveip4();
		}
		
		 map.put("ip", ip);
		 map.put("pv", pv);
		 map.put("uv", uv);
		 map.put("loginip", loginip);
		 map.put("oldip", oldip);
		 map.put("olduserip", olduserip);
		 map.put("targetpageip", targetpageip);
		 map.put("staytimeip1", staytimeip1);
		 map.put("staytimeip2", staytimeip2);
		 map.put("staytimeip3", staytimeip3);
		 map.put("staytimeip4", staytimeip4);
		 map.put("clickip1", clickip1);
		 map.put("clickip2", clickip2);
		 map.put("clickip3", clickip3);
		 map.put("clickip4", clickip4);
		 map.put("scrollip1", scrollip1);
		 map.put("scrollip2", scrollip2);
		 map.put("scrollip3", scrollip3);
		 map.put("scrollip4", scrollip4);
		 map.put("moveip1", moveip1);
		 map.put("moveip2", moveip2);
		 map.put("moveip3", moveip3);
		 map.put("moveip4", moveip4);
		
		return map;
	}
	
	protected List<Object> getList(Object obj){
		List<Object> list = new ArrayList<Object>();
		BaseStatBean statBean = new BaseStatBean();
		BeanUtils.copyProperties(obj, statBean);//复制相同名字的属性的值
		Integer ip = 0;
		Integer pv = 0;
		Integer uv = 0;
		Integer olduserip = 0;
		Integer oldip = 0;
		Integer loginip = 0;
		Integer targetpageip =0;
		Integer staytimeip1=0;
		Integer staytimeip2=0;
		Integer staytimeip3=0;
		Integer staytimeip4=0;
		Integer clickip1=0;
		Integer clickip2=0;
		Integer clickip3=0;
		Integer clickip4=0;
		Integer scrollip1 = 0;
		Integer scrollip2 = 0;
		Integer scrollip3 = 0;
		Integer scrollip4 = 0;
		Integer moveip1 = 0;
		Integer moveip2 = 0;
		Integer moveip3 = 0;
		Integer moveip4 = 0;
		if(statBean!=null){
		   if(statBean.getIp()!=null && statBean.getIp()>0)ip = statBean.getIp();
		   if(statBean.getPv()!=null && statBean.getPv()>0)pv = statBean.getPv();
		   if(statBean.getUv()!=null && statBean.getUv()>0)uv = statBean.getUv();
		   if(statBean.getOlduserip()!=null && statBean.getOlduserip()>0)olduserip = statBean.getOlduserip();
		   if(statBean.getOldip()!=null && statBean.getOldip()>0)oldip = statBean.getOldip();
		   if(statBean.getLoginip()!=null && statBean.getLoginip()>0)loginip = statBean.getLoginip();
		   if(statBean.getTargetpageip()!=null && statBean.getTargetpageip()>0)targetpageip = statBean.getTargetpageip();
		   if(statBean.getStaytimeip1()!=null && statBean.getStaytimeip1()>0)staytimeip1 = statBean.getStaytimeip1();
		   if(statBean.getStaytimeip2()!=null && statBean.getStaytimeip2()>0)staytimeip2 = statBean.getStaytimeip2();
		   if(statBean.getStaytimeip3()!=null && statBean.getStaytimeip3()>0)staytimeip3 = statBean.getStaytimeip3();
		   if(statBean.getStaytimeip4()!=null && statBean.getStaytimeip4()>0)staytimeip4 = statBean.getStaytimeip4();
		   if(statBean.getClickip1()!=null && statBean.getClickip1()>0)clickip1 = statBean.getClickip1();
		   if(statBean.getClickip2()!=null && statBean.getClickip2()>0)clickip2 = statBean.getClickip2();
		   if(statBean.getClickip3()!=null && statBean.getClickip3()>0)clickip3 = statBean.getClickip3();
		   if(statBean.getClickip4()!=null && statBean.getClickip4()>0)clickip4 = statBean.getClickip4();
		   if(statBean.getScrollip1()!=null && statBean.getScrollip1()>0)scrollip1 = statBean.getScrollip1();
		   if(statBean.getScrollip2()!=null && statBean.getScrollip2()>0)scrollip2 = statBean.getScrollip2();
		   if(statBean.getScrollip3()!=null && statBean.getScrollip3()>0)scrollip3 = statBean.getScrollip3();
		   if(statBean.getScrollip4()!=null && statBean.getScrollip4()>0)scrollip4 = statBean.getScrollip4();
		   if(statBean.getMoveip1()!=null && statBean.getMoveip1()>0)moveip1 = statBean.getMoveip1();
		   if(statBean.getMoveip2()!=null && statBean.getMoveip2()>0)moveip2 = statBean.getMoveip2();
		   if(statBean.getMoveip3()!=null && statBean.getMoveip3()>0)moveip3 = statBean.getMoveip3();
		   if(statBean.getMoveip4()!=null && statBean.getMoveip4()>0)moveip4 = statBean.getMoveip4();
		   
		   staytimeip1 = staytimeip1-staytimeip2>0?staytimeip1-staytimeip2:0;
		   staytimeip2 = staytimeip2-staytimeip3>0?staytimeip2-staytimeip3:0;
		   staytimeip3 = staytimeip3-staytimeip4>0?staytimeip3-staytimeip4:0;
		   
		   clickip1 = clickip1-clickip2>0?clickip1-clickip2:0;
		   clickip2 = clickip2-clickip3>0?clickip2-clickip3:0;
		   clickip3 = clickip3-clickip4>0?clickip3-clickip4:0;
		   
		   scrollip1 = scrollip1-scrollip2>0?scrollip1-scrollip2:0;
		   scrollip2 = scrollip2-scrollip3>0?scrollip2-scrollip3:0;
		   scrollip3 = scrollip3-scrollip4>0?scrollip3-scrollip4:0;
		   
		   moveip1 = moveip1-moveip2>0?moveip1-moveip2:0;
		   moveip2 = moveip2-moveip3>0?moveip2-moveip3:0;
		   moveip3 = moveip3-moveip4>0?moveip3-moveip4:0;
		}
		
		 list.add(ip);
		 list.add(pv);
		 list.add(uv);
		 list.add(olduserip);
		 list.add(oldip);
		 list.add(loginip);
		 list.add(targetpageip);
		 list.add(staytimeip1);
		 list.add(staytimeip2);
		 list.add(staytimeip3);
		 list.add(staytimeip4);
		 list.add(clickip1);
		 list.add(clickip2);
		 list.add(clickip3);
		 list.add(clickip4);
		 list.add(scrollip1);
		 list.add(scrollip2);
		 list.add(scrollip3);
		 list.add(scrollip4);
		 list.add(moveip1);
		 list.add(moveip2);
		 list.add(moveip3);
		 list.add(moveip4);
		
		return list;
	}
	
	protected <T> T reduct(BaseStat a,BaseStat b,Class<T> clazz){
		 BaseStat result = null;
			try {
				result = (BaseStat) clazz.newInstance();
			} catch (Exception e) {
			}
		
			 result.setIp             ((a.getIp()            < b.getIp()          )?0:(a.getIp()            - b.getIp()          ));  
			 result.setPv             ((a.getPv()            < b.getPv()          )?0:(a.getPv()            - b.getPv()          ));
			 result.setUv             ((a.getUv()            < b.getUv()          )?0:(a.getUv()            - b.getUv()          ));
			 result.setOlduserip      ((a.getOlduserip()     < b.getOlduserip()   )?0:(a.getOlduserip()     - b.getOlduserip()   ));
			 result.setOldip          ((a.getOldip()         < b.getOldip()       )?0:(a.getOldip()         - b.getOldip()       ));
			 result.setLoginip        ((a.getLoginip()       < b.getLoginip()     )?0:(a.getLoginip()       - b.getLoginip()     ));
			 result.setTargetpageip   ((a.getTargetpageip()  < b.getTargetpageip())?0:(a.getTargetpageip()  - b.getTargetpageip()));
			 result.setClickip1       ((a.getClickip1()      < b.getClickip1()    )?0:(a.getClickip1()      - b.getClickip1()    ));
			 result.setClickip2       ((a.getClickip2()      < b.getClickip2()    )?0:(a.getClickip2()      - b.getClickip2()    ));
			 result.setClickip3       ((a.getClickip3()      < b.getClickip3()    )?0:(a.getClickip3()      - b.getClickip3()    ));
			 result.setClickip4       ((a.getClickip4()      < b.getClickip4()    )?0:(a.getClickip4()      - b.getClickip4()    ));
			 result.setStaytimeip1    ((a.getStaytimeip1()   < b.getStaytimeip1() )?0:(a.getStaytimeip1()   - b.getStaytimeip1() ));
			 result.setStaytimeip2    ((a.getStaytimeip2()   < b.getStaytimeip2() )?0:(a.getStaytimeip2()   - b.getStaytimeip2() ));
			 result.setStaytimeip3    ((a.getStaytimeip3()   < b.getStaytimeip3() )?0:(a.getStaytimeip3()   - b.getStaytimeip3() ));
			 result.setStaytimeip4    ((a.getStaytimeip4()   < b.getStaytimeip4() )?0:(a.getStaytimeip4()   - b.getStaytimeip4() ));
			 result.setScrollip1      ((a.getScrollip1()     < b.getScrollip1()   )?0:(a.getScrollip1()     - b.getScrollip1()   ));
			 result.setScrollip2      ((a.getScrollip2()     < b.getScrollip2()   )?0:(a.getScrollip2()     - b.getScrollip2()   ));
			 result.setScrollip3      ((a.getScrollip3()     < b.getScrollip3()   )?0:(a.getScrollip3()     - b.getScrollip3()   ));
			 result.setScrollip4      ((a.getScrollip4()     < b.getScrollip4()   )?0:(a.getScrollip4()     - b.getScrollip4()   ));
			 result.setMoveip1        ((a.getMoveip1()       < b.getMoveip1()     )?0:(a.getMoveip1()       - b.getMoveip1()     ));
			 result.setMoveip2        ((a.getMoveip2()       < b.getMoveip2()     )?0:(a.getMoveip2()       - b.getMoveip2()     ));
			 result.setMoveip3        ((a.getMoveip3()       < b.getMoveip3()     )?0:(a.getMoveip3()       - b.getMoveip3()     ));
			 result.setMoveip4        ((a.getMoveip4()       < b.getMoveip4()     )?0:(a.getMoveip4()       - b.getMoveip4()     ));
		 return (T) result;
	}
}
