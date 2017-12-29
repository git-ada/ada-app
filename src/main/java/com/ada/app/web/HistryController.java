

package com.ada.app.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.jiand.mvc.framework.utils.Dates;

import com.ada.app.bean.BaseStat;
import com.ada.app.bean.BaseStatBean;
import com.ada.app.bean.DomainAreaStat;
import com.ada.app.dao.AdaDomainAd15mStatDao;
import com.ada.app.dao.AdaDomainAdStatDao;
import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainNotAd15mStatDao;
import com.ada.app.dao.AdaDomainNotAdStatDao;
import com.ada.app.dao.AdaDomainStatDao;
import com.ada.app.dao.AdaRegionAdStatDao;
import com.ada.app.dao.AdaRegionNotAdStatDao;
import com.ada.app.dao.AdaRegionStatDao;
import com.ada.app.dao.AdaSiteDao;
import com.ada.app.dao.AdaSiteStatDao;
import com.ada.app.domain.AdaDomain;
import com.ada.app.domain.AdaDomainAd15mStat;
import com.ada.app.domain.AdaDomainAdStat;
import com.ada.app.domain.AdaDomainNotad15mStat;
import com.ada.app.domain.AdaDomainNotadStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.domain.AdaRegionAdStat;
import com.ada.app.domain.AdaRegionNotAdStat;
import com.ada.app.domain.AdaRegionStat;
import com.ada.app.domain.AdaSite;
import com.ada.app.domain.AdaSiteStat;
import com.ada.app.service.StatService;
import com.ada.app.util.Sessions;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * 历史数据处理类
 * @author ASUS
 *
 */
@Controller
@SuppressWarnings("all")
public class HistryController {
	private final static Log log = LogFactory.getLog(HistryController.class);
	@Autowired
	private AdaSiteDao siteDao;
//	@Autowired
//	private AdaSiteStatDao adaSiteStatDao;
	@Autowired
	private StatService statService;
	@Autowired
	private AdaSiteStatDao statDao;
	@Autowired
	private AdaDomainDao adaDomainDao;
	@Autowired
	private AdaDomainStatDao domainStatDao;
	@Autowired
	private AdaDomainAdStatDao domainAdStatDao;
	@Autowired
	private AdaDomainNotAdStatDao domainNotAdStatDao;
	@Autowired
	private AdaRegionStatDao regioinStatDao;
	@Autowired
	private AdaRegionAdStatDao regioinAdStatDao;
	@Autowired
	private AdaRegionNotAdStatDao regioinNotAdStatDao;
	@Autowired
	private AdaDomainAdStatDao adStatDao;
	@Autowired
	private AdaDomainNotAdStatDao notAdStatDao;
	@Autowired
	private AdaDomainAd15mStatDao ad15mStatDao;
	@Autowired
	private AdaDomainNotAd15mStatDao notAd15mStatDao;
	private final static int Interval_time = 15;//域名分时统计的时间 间隔（单位：分钟）
	private final static int domainTime_PageSize = 30;//域名分时统计 图表数据 每一页的数据条数
	
	/**
	 * 全站历史数据图表统计
	 * @param pageSize
	 * @param len
	 * @param pageNo
	 * @throws Exception
	 * @return
	 */
	protected JSONObject siteChartHistryList(int pageSize,Integer pageNo) throws Exception{
		/** 从sessions中获取站点信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();//
		JSONObject json=new JSONObject();
		
		if(pageNo== null || pageNo<1){
			json.put("success", false);
			json.put("message", "已是最新统计数据 !");
			return json;
		}
		String yestoday = Dates.today();
		
		List<AdaSiteStat> siteList = statDao.findBySiteIdLoadHistryData(adaSite.getId(), yestoday,(pageNo-1)*pageSize,pageSize); 
		if((siteList==null || siteList.size()<1)){
			json.put("success", false);
			json.put("message", "暂无统计数据!!!");
			return json;
		}
		JSONArray ad_chart=new JSONArray();
		JSONArray notad_chart=new JSONArray();
		try {
			for(int i=siteList.size()-1;i>=0;i--){
				/** //全站历史数据图表  **/
				AdaSiteStat item = siteList.get(i);
				String date = new SimpleDateFormat("yyyy-MM-dd").format(item.getDate());
				
				JSONObject json_adChart_1=new JSONObject();
				json_adChart_1.put("date", date); // 统计日期
				json_adChart_1.put("adip", item.getAdIP());
				json_adChart_1.put("pv", item.getPv());
				json_adChart_1.put("uv", item.getUv());
				ad_chart.add(json_adChart_1);
				
				JSONObject json_notadChart_1=new JSONObject();
				json_notadChart_1.put("notadip", item.getNotAdIp());
				notad_chart.add(json_notadChart_1);
			}
			json.put("success", true);
			json.put("nextPage", pageNo-1);
			json.put("lastPage", pageNo+1);
			json.put("ad_chart_1", ad_chart);
			json.put("notad_chart_1", notad_chart);
		} catch (Exception e) {
			log.error("获取广告和非广告图形历史数据失败,msg->"+e.getMessage(),e);
		}
		//System.out.println(json);
		return json;
	}
	
	/**
	 * 历史数据页面 获取域名列表数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "dashboardHistry")
	public String defaultHistry(HttpServletRequest request,HttpServletResponse response, Model model,
			String dataType,String doamin,String clickDate,String top,String isRefresh,String isRetrun) throws Exception {
		model.addAttribute("ipTop", top);
		model.addAttribute("search", doamin);
		model.addAttribute("isRefresh", isRefresh);
		model.addAttribute("isRetrun", isRetrun);
		/** 从sessions中获取站点信息 **/ 
		AdaSite adaSite = Sessions.getCurrentSite();
		
		/** 获取当前站点默认历史统计信息 **/
//		Date yestoday = Dates.yestoday();
//		System.out.println(yestoday+"----------");
//		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd");
//		String date = dfs.format(yestoday);
		String date = "";
		Calendar c = Calendar.getInstance(); 
		if(!"".equals(clickDate) && clickDate !=null){
			date =  clickDate;
		}else{
			Date now = new Date();
			c.setTime(now);
			int day=c.get(Calendar.DATE); 
			c.set(Calendar.DATE,day-1); 
			date =new SimpleDateFormat("yyyy-MM-dd").format(c.getTime()); 
		}
		
		Integer ipTop = 50;
		if(!"".equals(top) && top != null){
			ipTop = Integer.valueOf(top);
		}
		
		//默认加载昨天的历史数据
		AdaSiteStat siteStat = statDao.findBySiteIdAndDate(adaSite.getId(), date);
		model.addAttribute("siteStat", siteStat);
		if(dataType!=null){
			if("domain".equals(dataType)){
				/** 获取站点下域名统计信息 **/
				Map sumMap = getDomainStat_histryList(date,ipTop,doamin);
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				Map map = new HashMap();
				map.put("data_list", data_list);
				map.put("dataType", dataType);
				map.put("lasttime", date);
				map.put("siteStat", siteStat);
				JSONObject json  = new JSONObject(map);
				System.out.println("json:-->"+json);
				model.addAttribute("tbodydata", json);
			}else if("domainAd".equals(dataType)){
				/** 获取站点下域名统计信息 **/
				Map sumMap = getDomainAdStat_histryList(date,ipTop,doamin);
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				Map map = new HashMap();
				map.put("data_list", data_list);
				map.put("dataType", dataType);
				map.put("lasttime", date);
				map.put("siteStat", siteStat);
				JSONObject json  = new JSONObject(map);
				model.addAttribute("tbodydata", json);
			}else if("domainNotAd".equals(dataType)){
				/** 获取站点下域名统计信息 **/
				Map sumMap = getDomainNotAdStat_histryList(date,ipTop,doamin);
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				Map map = new HashMap();
				map.put("data_list", data_list);
				map.put("dataType", dataType);
				map.put("lasttime", date);
				map.put("siteStat", siteStat);
				JSONObject json  = new JSONObject(map);
				model.addAttribute("tbodydata", json);
			}
				
		}
		model.addAttribute("lasttime", date); 
		model.addAttribute("dataType", dataType);
		
		if(adaSite.getId()!=null && !"".equals(adaSite.getId())){
			JSONObject json = siteChartHistryList(domainTime_PageSize,1);
			model.addAttribute("histryJson", json);
		}
		c.clear();
		return "dashboardHistry";
	}
	
	/**
	 * 历史数据页面 点击图表获取域名列表数据
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value = "clickLoadHistryData")
	public void ajaxdashboard_domainTime3(HttpServletRequest request,HttpServletResponse response ,Model model,
			String dataType,String clickDate,String top,String  timestamp){
		Integer ipTop = 50;
		if(!"".equals(top) && top != null){
			ipTop = Integer.valueOf(top);
		}
		JSONObject json=new JSONObject();
		/** 从sessions中获取站点信息 **/ 
		AdaSite adaSite = Sessions.getCurrentSite();
		AdaSiteStat siteStat = statDao.findBySiteIdAndDate(adaSite.getId(), clickDate);
		json.put("siteStat", siteStat);
		if(dataType!=null){
			if("domain".equals(dataType)){
				/** 点击图表获取站点下域名历史统计信息 **/
//				Map sumMap = getDefaultDomainStat_histryList(clickDate, ipTop);
				Map sumMap = getDomainStat_histryList(clickDate, ipTop,"");
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				json.put("data_list", data_list);
			}else if("domainAd".equals(dataType)){
				/** 点击图表获取站点下域名历史统计信息 **/
				Map sumMap = getDomainAdStat_histryList(clickDate, ipTop,"");
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				json.put("data_list", data_list);
			}else if("domainNotAd".equals(dataType)){
				/** 点击图表获取站点下域名历史统计信息 **/
				Map sumMap = getDomainNotAdStat_histryList(clickDate, ipTop,"");
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				json.put("data_list", data_list);
			}
		}
		json.put("dataType", dataType);
		json.put("lasttime", clickDate);
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
	 * 历史数据页面 点击获取列表数据
	 * @param request
	 * @param response
	 * @param model
	 * @param domainId  域名ID
	 * @param dataType  数据类型{1:domain; 2:domainAd; 3:domainNotAd; 4:domainRegion;……}
	 * @param clickDate 查询日期
	 * @param domain    域名
	 * @param top       查询条目数
	 * @param timestamp 时间戳
	 * @throws Exception
	 */
	@RequestMapping(value = "ajaxRefreshHistryDataPage")
	public void ajax_clickLoadAreaHistryData(HttpServletRequest request,HttpServletResponse response ,Model model,
			Integer domainId,String dataType,String clickDate,String domain,String top,String timestamp) throws Exception{
		
		JSONObject json=new JSONObject();
		/** 获取当前站点统计信息 **/
		AdaSite adaSite = Sessions.getCurrentSite();
		String date = clickDate;
		int ipTop = 50;
		if(top!=null && !"".equals(top)){
			ipTop = Integer.valueOf(top).intValue();
		}
		System.out.println("dataType: --->"+dataType+"  date: ---> "+clickDate);
		AdaSiteStat siteStat = statDao.findBySiteIdAndDate(adaSite.getId(), date);
		json.put("siteStat", siteStat);
		
		if(dataType!=null){
			if("domain".equals(dataType)){/** 获取域名统计信息 **/
				Map sumMap = getDomainStat_histryList(date, ipTop, domain);
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				json.put("data_list", data_list);
			}else if("domainAd".equals(dataType)){/** 获取域名广告入口统计信息 **/
				Map sumMap = getDomainAdStat_histryList(date, ipTop, domain);
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				json.put("data_list", data_list);
				//System.out.println("data_listAd:"+ json);
			}else if("domainNotAd".equals(dataType)){/** 获取域名非广告入口统计信息 **/
				Map sumMap = getDomainNotAdStat_histryList(date, ipTop, domain);
				List<List<Object>> data_list = (List<List<Object>>) sumMap.get("DomainStat_list");
				json.put("data_list", data_list);
			}else if("domainRegion".equals(dataType)){/**获取域名地域统计信息**/
				Map map = getDomainRegion(date,Integer.valueOf(domainId),ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				AdaDomainStat domainStat = (AdaDomainStat) map.get("domainStat");
				json.put("data_list", data_list);
				json.put("domainStat", domainStat);
			}else if("domainRegionAd".equals(dataType)){/** 获取域名地域广告入口统计信息 **/
				Map map = getDomainRegionAd_data(date,Integer.valueOf(domainId),ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				AdaDomainAdStat adaDomainAdStat = (AdaDomainAdStat) map.get("domainAdStat");
				json.put("data_list", data_list);
				json.put("domainAdStat", adaDomainAdStat);
			}else if("domainRegionNotAd".equals(dataType)){/** 获取域名地域非广告入口统计信息 **/
				Map map =getDomainRegionNotAd_data(date,Integer.valueOf(domainId),ipTop);
				List<List<Object>> data_list = (List<List<Object>>) map.get("data_list");
				AdaDomainNotadStat adaDomainNotadStat = (AdaDomainNotadStat) map.get("domainNotAdStat");
				json.put("data_list", data_list);
				json.put("domainNotAdStat", adaDomainNotadStat);
			}
		}
		json.put("dataType", dataType);
		json.put("domainId", domainId);
		json.put("lasttime",date);
		json.put("timestamp", timestamp);
		//System.out.println("data_list_json:--->"+json);
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
	 * 实时数据页面 域名分时统计信息异步分页查询
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("ajaxdashboard_domainTime_one_histry")
	public void ajaxdashboard_domainTime_one_histry(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo,String domainId,String dataType,String clickDate){
		
		Integer pageno = Integer.valueOf(pageNo);
		Integer domainid = Integer.valueOf(domainId);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(dataType!=null && !"".equals(dataType)){
				if("domain".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,domainTime_PageSize,Interval_time,pageno,dataType,clickDate));
				}else if("domainAd".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,domainTime_PageSize,Interval_time,pageno,dataType,clickDate));
				}else if("domainNotAd".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,domainTime_PageSize,Interval_time,pageno,dataType,clickDate));
				}else if("AdAndNotAd".equals(dataType)){
					out.print(this.domainTimechartList(domainid,domainTime_PageSize,Interval_time,pageno,clickDate));
				}
			}
			
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("ajaxdashboard_domainTime_histry")
	public void ajaxdashboard_domainTime_histry(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo,String domainId,String clickDate){
		Integer pageno = Integer.valueOf(pageNo);
		Integer domainid = Integer.valueOf(domainId);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.domainTimechartList(domainid,domainTime_PageSize,Interval_time,pageno,clickDate));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("ajaxdashboard_domainTime3_histry")
	public void ajaxdashboard_domainTime3_histry(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo,String domainId,String clickDate){
		Integer pageno = Integer.valueOf(pageNo);
		Integer domainid = Integer.valueOf(domainId);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.domainTimechartList(domainid,domainTime_PageSize,Interval_time,pageno,clickDate));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("ajaxLoadDashboardHistry")
	public void loadDashboardHistry(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo){
		Integer pageno = Integer.valueOf(pageNo);
//		System.out.println("pageno: -->"+pageno);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print(this.siteChartHistryList(domainTime_PageSize,pageno));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 历史数据页面 域名分时统计信息
	 * @return
	 */
	@RequestMapping(value = "dashboard_domainTime_one_histry")
	public String domainTimechartList_one_histry(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain,String clickDate,String dataType){
		//System.out.println(clickDate);
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = domainTimechartList_one(Integer.valueOf(domainId),domainTime_PageSize,Interval_time,1, dataType,clickDate);
			//System.out.println("1: -->"+json);
			model.addAttribute("json", json);
		}
		model.addAttribute("domainId", domainId);
		model.addAttribute("dataType", "domain");
		model.addAttribute("domain", domain);
		model.addAttribute("lasttime", clickDate);
		model.addAttribute("dataType", dataType);
		return "dashboard_domainTime_one_histry";
	}
	@RequestMapping(value = "dashboard_domainTime_histry")
	public String dashboard_domainTime_histry(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain,String clickDate,String dataType){
		//System.out.println(clickDate);
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = domainTimechartList(Integer.valueOf(domainId),domainTime_PageSize,Interval_time,1,clickDate);
			//System.out.println("2: -->"+json);
			model.addAttribute("json", json);
		}
		model.addAttribute("domainId", domainId);
		model.addAttribute("dataType", "domain");
		model.addAttribute("domain", domain);
		model.addAttribute("lasttime", clickDate);
		model.addAttribute("dataType", dataType);
		return "dashboard_domainTime_histry";
	}
	@RequestMapping(value = "dashboard_domainTime3_histry")
	public String dashboard_domainTime3_histry(HttpServletRequest request,HttpServletResponse response, Model model,
			String domainId,String domain,String clickDate,String dataType){
		//System.out.println(clickDate);
		if(domainId!=null && !"".equals(domainId)){
			JSONObject json = domainTimechartList(Integer.valueOf(domainId),domainTime_PageSize,Interval_time,1,clickDate);
			//System.out.println("3: -->"+json);
			model.addAttribute("json", json);
		}
		model.addAttribute("domainId", domainId);
		model.addAttribute("dataType", "domain");
		model.addAttribute("domain", domain);
		model.addAttribute("lasttime", clickDate);
		model.addAttribute("dataType", dataType);
		return "dashboard_domainTime3_histry";
	}
	
	@RequestMapping("ajaxLoadHistryData")
	public void ajaxLoadHistryData(HttpServletRequest request,HttpServletResponse response ,Model model){
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
	 * 历史数据页面 域名分时统计信息异步分页查询
	 * @param request
	 * @param response
	 * @param model
	 */
	@RequestMapping("ajaxdashboard_domainHistryTime")
	public void ajaxdashboard_domainHistryTime(HttpServletRequest request,HttpServletResponse response ,Model model,
			String pageNo,String domainId,String dataType,String clickDate){
		
//		Date dataDate = new SimpleDateFormat("yyyy-MM-dd").parse(date);
		Integer pageno = Integer.valueOf(pageNo);
		Integer domainid = Integer.valueOf(domainId);
		try {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			if(dataType!=null && !"".equals(dataType)){
				if("domain".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,domainTime_PageSize,Interval_time,pageno,dataType,clickDate));
				}else if("domainAd".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,domainTime_PageSize,Interval_time,pageno,dataType,clickDate));
				}else if("domainNotAd".equals(dataType)){
					out.print(this.domainTimechartList_one(domainid,domainTime_PageSize,Interval_time,pageno,dataType,clickDate));
				}
			}
			
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
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
			List<AdaSiteStat> list = this.statDao.findBySiteIdOrderByDate(siteId,(pageNo-1)*30);
			
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
	
	protected JSONObject domainTimechartList_one(Integer domainId,int pageSize,int len,Integer pageNo,
			String dataType,String clickDate){
		
		JSONObject json=new JSONObject();
		if(pageNo== null || pageNo<1 || dataType==null){
			json.put("success", false);
			json.put("message", "已是最新统计数据！");
			return json;
		}
		List list = new ArrayList();
		
		try {
			if("domain".equals(dataType)){
				List<AdaDomainAd15mStat> adlist = ad15mStatDao.findByDomainIdOrderByStartTimeHistry(domainId, clickDate, (pageNo-1)*pageSize, pageSize);
				List<AdaDomainNotad15mStat> notAdlist = notAd15mStatDao.findByDomainIdOrderByStartTimeHistry(domainId, clickDate, (pageNo-1)*pageSize, pageSize);
				for(int i=0;i<adlist.size();i++){
					BaseStatBean item = new BaseStatBean();
					AdaDomainAd15mStat ad = adlist.get(i);
					AdaDomainNotad15mStat notAd =  notAdlist.get(i);
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
				list = ad15mStatDao.findByDomainIdOrderByStartTimeHistry(domainId,clickDate, (pageNo-1)*pageSize, pageSize);
			}else if("domainNotAd".equals(dataType)){
				list = notAd15mStatDao.findByDomainIdOrderByStartTimeHistry(domainId,clickDate, (pageNo-1)*pageSize, pageSize);
			}
			
			if((list==null || list.size()<1)){
				json.put("success", false);
				json.put("message", "暂无统计数据！");
				return json;
			}
			
			JSONArray chart_1=new JSONArray();// IP、PV、UV
			JSONArray chart_2=new JSONArray();//老用户数、老ip、登陆用户数、进入目标页
			JSONArray chart_3=new JSONArray();//用户停留时长5-30、31-120、121-300、300+秒
			JSONArray chart_4=new JSONArray();//鼠标点击次数1-2、3-5、6-10、10+
			JSONArray chart_5=new JSONArray();//鼠标滚动次数1-2、3-5、6-10、10+
			JSONArray chart_6=new JSONArray();//鼠标移动次数1-2、3-5、6-10、10+
			
			if(list.size()<pageSize){//数据条数不足时 补充条数
				for(int i=0;i<pageSize-list.size();i++){
					BaseStatBean item = new BaseStatBean();
					BeanUtils.copyProperties(list.get(list.size()-1), item);
					String date = new SimpleDateFormat("HH:mm").format(item.getEndTime());
					String strdate = com.ada.app.util.Dates.getbeforeTime(date, len*(i+1));
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
			}
			for(int i=list.size()-1;i>=0;i--){
				/** 广告入口数据  **/
				BaseStatBean item = new BaseStatBean();
				BeanUtils.copyProperties(list.get(i), item);
				
				String date = new SimpleDateFormat("HH:mm").format(item.getEndTime());
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
				if (i == 0) { // 判断如果是最后一单则需要加上颜色等特殊信息
					json_adChart_6.put("color", "#EF3F3F");
					json_adChart_6.put("lcolor", "red");
					json_adChart_6.put("alpha", 1);
				}
				chart_6.add(json_adChart_6);
			}
			
			json.put("success", true);
			json.put("nextPage", pageNo-1);
			json.put("lastPage", pageNo+1);
			json.put("dataType", dataType);
			
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
	protected JSONObject domainTimechartList(Integer domainId,int pageSize,int len,Integer pageNo,String clickDdate){
		
		JSONObject json=new JSONObject();
		if(pageNo== null || pageNo<1){
			json.put("success", false);
			json.put("message", "已是最新统计数据！");
			return json;
		}
		
		List<AdaDomainAd15mStat> adList = ad15mStatDao.findByDomainIdOrderByStartTimeHistry(domainId,clickDdate,(pageNo-1)*pageSize,pageSize);
		List<AdaDomainNotad15mStat> notadList = notAd15mStatDao.findByDomainIdOrderByStartTimeHistry(domainId,clickDdate,(pageNo-1)*pageSize,pageSize);
		
		if((adList==null || adList.size()<1)&&(notadList==null || notadList.size()<1)){
			json.put("success", false);
			json.put("message", "暂无统计数据！");
			return json;
		}
	
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
		
		try {
			if(adList.size()<pageSize){//广告入口
				for(int i=0;i<pageSize-adList.size();i++){
					String date = new SimpleDateFormat("HH:mm").format(adList.get(adList.size()-1).getEndTime());
					String strdate = com.ada.app.util.Dates.getbeforeTime(date, len*(i+1));
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
			}
			if(notadList.size()<pageSize){
				for(int i=0;i<pageSize-notadList.size();i++){
					String date = new SimpleDateFormat("HH:mm").format(notadList.get(notadList.size()-1).getEndTime());
					String strdate = com.ada.app.util.Dates.getbeforeTime(date, len*(i+1));
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
			}
			for(int i=adList.size()-1;i>=0;i--){
//				for(int ii=notadList.size()-1;ii>=0;ii--){
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
				json_adChart_1.put("ip", item.getIp());//进入目标页
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
				String date = new SimpleDateFormat("HH:mm").format(notad.getEndTime());
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
//			}
			json.put("success", true);
			json.put("nextPage", pageNo-1);
			json.put("lastPage", pageNo+1);
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
	
	/** 域名统计历史信息 **/
	protected Map getDomainStat_histryList(String date,Integer ipTop,String serachDomain){
		 /** 从sessions中获取站点信息 **/
		 AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 
		 if(!"".equals(serachDomain) && serachDomain != null ){
			 AdaDomainStat domainStats = domainStatDao.onlyOneQuerryDomain(adaSite.getId(), date ,serachDomain);
			 if(domainStats != null){
				 List<Object> list = new ArrayList();
				 list=getList(domainStats);
				 list.add(domainStats.getDomainId());
				 list.add(serachDomain);
				 if(serachDomain.length()>18){
					 list.add(serachDomain.substring(0, 18));
				 }else{
					 list.add(serachDomain);
				 }
				 DomainStat_list.add(list);
					 
			 }
			 Map map = new HashMap();
			 map.put("DomainStat_list", DomainStat_list);
			 return map;
		 }else{
			 List<AdaDomainStat> domainStats = domainStatDao.findByDateLoadData(adaSite.getId(), date ,ipTop);
			 System.out.println(domainStats.size());
			 if(domainStats!=null && domainStats.size()>0){
				 for(AdaDomainStat domainStat : domainStats){
					 List<Object> list = new ArrayList();
					 list=getList(domainStat);
					 list.add(domainStat.getDomainId());
					 list.add(domainStat.getDomain().getDomain());
					 
					 String domain = domainStat.getDomain().getDomain();
					 if(domain.length()>18){
						 list.add(domain.substring(0, 18));
					 }else{
						 list.add(domain);
					 }
					 DomainStat_list.add(list);
					 
				 }
			 }
			 Map map = new HashMap();
			 map.put("DomainStat_list", DomainStat_list);
			 
			 return map;
		 }
		 
	}
	/** 默认域名统计历史信息 **/
	protected Map getDefaultDomainStat_histryList(String date,Integer ipTop){
		/** 从sessions中获取站点信息 **/
		 AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 
		 List<AdaDomainStat> domainStats = domainStatDao.findByDateLoadData(adaSite.getId(), date ,ipTop);
		 if(domainStats!=null && domainStats.size()>0){
			 for(AdaDomainStat domainStat : domainStats){
				 List<Object> list = new ArrayList();
				 list=getList(domainStat);
				 list.add(domainStat.getDomainId());
				 list.add(domainStat.getDomain().getDomain());
				 
				 String domain = domainStat.getDomain().getDomain();
				 if(domain.length()>18){
					 list.add(domain.substring(0, 18));
				 }else{
					 list.add(domain);
				 }
				 DomainStat_list.add(list);
			 }
		 }
		 Map map = new HashMap();
		 map.put("DomainStat_list", DomainStat_list);
		 return map;
	}
	
	/** 域名广告统计历史信息 **/
	protected Map getDomainAdStat_histryList(String date, Integer ipTop,String serachDomain){
		/** 从sessions中获取站点信息 **/
		 AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 if(!"".equals(serachDomain) && serachDomain != null ){
			 AdaDomainStat domainStats = domainStatDao.onlyOneQuerryDomainAd(adaSite.getId(), date ,serachDomain);
			 if(domainStats != null){
				 List<Object> list = new ArrayList();
				 list=getList(domainStats);
				 list.add(domainStats.getDomainId());
				 list.add(serachDomain);
				 if(serachDomain.length()>18){
					 list.add(serachDomain.substring(0, 18));
				 }else{
					 list.add(serachDomain);
				 }
				 DomainStat_list.add(list);
			 }
			 Map map = new HashMap();
			 map.put("DomainStat_list", DomainStat_list);
			 return map;
		 }else{
			 List<AdaDomainStat> domainStats = domainStatDao.findByDateLoadAdData(adaSite.getId(), date ,ipTop);
			 if(domainStats!=null && domainStats.size()>0){
				 for(AdaDomainStat domainStat : domainStats){
					 List<Object> list = new ArrayList();
					 list=getList(domainStat);
					 list.add(domainStat.getDomainId());
					 list.add(domainStat.getDomain().getDomain());
					 
					 String domain = domainStat.getDomain().getDomain();
					 if(domain.length()>18){
						 list.add(domain.substring(0, 18));
					 }else{
						 list.add(domain);
					 }
					 DomainStat_list.add(list);
				 }
			 }
			 Map map = new HashMap();
			 map.put("DomainStat_list", DomainStat_list);
			 return map;
		 }
	}
	
	/** 域名非广告统计历史信息 **/
	protected Map getDomainNotAdStat_histryList(String date, Integer ipTop,String serachDomain){
		 /** 从sessions中获取站点信息 **/
		 AdaSite adaSite = Sessions.getCurrentSite();
		 /** 域名列表信息 **/
		 List<List<Object>> DomainStat_list = new ArrayList<List<Object>>();
		 if(!"".equals(serachDomain) && serachDomain != null ){
			 AdaDomainStat domainStats = domainStatDao.onlyOneQuerryDomainNotAd(adaSite.getId(), date ,serachDomain);
			 if(domainStats != null){
				 List<Object> list = new ArrayList();
				 list=getList(domainStats);
				 list.add(domainStats.getDomainId());
				 list.add(serachDomain);
				 if(serachDomain.length()>18){
					 list.add(serachDomain.substring(0, 18));
				 }else{
					 list.add(serachDomain);
				 }
				 DomainStat_list.add(list);
			 }
			 Map map = new HashMap();
			 map.put("DomainStat_list", DomainStat_list);
			 return map;
		 }else{
			 List<AdaDomainStat> domainStats = domainStatDao.findByDateLoadNotAdData(adaSite.getId(), date ,ipTop);
			 if(domainStats!=null && domainStats.size()>0){
				 for(AdaDomainStat domainStat : domainStats){
					 List<Object> list = new ArrayList();
					 list=getList(domainStat);
					 list.add(domainStat.getDomainId());
					 list.add(domainStat.getDomain().getDomain());
					 
					 String domain = domainStat.getDomain().getDomain();
					 if(domain.length()>18){
						 list.add(domain.substring(0, 18));
					 }else{
						 list.add(domain);
					 }
					 DomainStat_list.add(list);
				 }
			 }
			 Map map = new HashMap();
			 map.put("DomainStat_list", DomainStat_list);
			 return map;
		 }
	}
	
	/** 地域历史统计信息  **/
	protected Map getDomainRegion(String date,Integer domainId,Integer top){
		AdaSite adaSite = Sessions.getCurrentSite();
		List<List<Object>> region_list = new ArrayList<List<Object>>();
		Map map = new HashMap();
		AdaDomainStat domainStat = domainStatDao.findByIdHistry(adaSite.getId(), domainId, date);
		List<AdaRegionStat> regionStats = regioinStatDao.loadDomainRegion(adaSite.getId(),domainId, date,top);
		
		if(regionStats!=null && regionStats.size()>0){
			for(AdaRegionStat regionStat : regionStats){
				List<Object> list = getList(regionStat);
//				String fullname =  regionStat.getRegions().getFullname(); 
				String fullname =  regionStat.getRegion();
				list.add(fullname);
			    region_list.add(list);
			}
		}
		map.put("data_list", region_list);
		map.put("domainStat", domainStat);
		return map;
	}
	
	/** 地域历史广告入口统计数据 **/
	protected Map getDomainRegionAd_data(String date,Integer domainId,Integer top){
		AdaSite adaSite = Sessions.getCurrentSite();
		List<List<Object>> region_list = new ArrayList<List<Object>>();
		Map map = new HashMap();
		AdaDomainAdStat domainAdStat = domainAdStatDao.findByIdHistry(adaSite.getId(), domainId, date);
		List<AdaRegionAdStat> regionAdStats = regioinAdStatDao.loadDomainRegionAd(adaSite.getId(),domainId, date,top);
		
		if(regionAdStats!=null && regionAdStats.size()>0){
			for(AdaRegionAdStat regionStat : regionAdStats){
				List<Object> list = getList(regionStat);
//				String fullname =  regionStat.getRegions().getFullname(); 
				String fullname =  regionStat.getRegion();
				list.add(fullname);
			    region_list.add(list);
			}
		}
		
		map.put("data_list", region_list);
		map.put("domainAdStat", domainAdStat);
		return map;
	}
	/** 地域历史非广告入口统计数据 **/
	protected Map getDomainRegionNotAd_data(String date,Integer domainId,Integer top) {
		AdaSite adaSite = Sessions.getCurrentSite();
		List<List<Object>> region_list = new ArrayList<List<Object>>();
		Map map = new HashMap();
		AdaDomainNotadStat domainNotadStat = domainNotAdStatDao.findByIdHistry(adaSite.getId(), domainId, date);
		List<AdaRegionNotAdStat> regionNotAdStats = regioinNotAdStatDao.loadDomainRegionNotAd(adaSite.getId(),domainId, date,top);
		
		if(regionNotAdStats!=null && regionNotAdStats.size()>0){
			for(AdaRegionNotAdStat regionStat : regionNotAdStats){
				List<Object> list = getList(regionStat);
//				String fullname =  regionStat.getRegions().getFullname(); 
				String fullname =  regionStat.getRegion();
				list.add(fullname);
			    region_list.add(list);
			}
		}
		map.put("data_list", region_list);
		map.put("domainNotAdStat", domainNotadStat);
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
