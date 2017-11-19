package com.ada.app.web;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.jiand.mvc.framework.module.ModuleIndex;
import cn.com.jiand.mvc.framework.module.ModuleOperation;
import cn.com.jiand.mvc.framework.module.Permission;
import cn.com.jiand.mvc.framework.utils.Dates;
import cn.wanghl.jst.bean.KpiDailySummary;
import cn.wanghl.jst.bean.KpiTotalSummary;
import cn.wanghl.jst.dao.KpiBusDailyDao;
import cn.wanghl.jst.dao.KpiBusMonthDao;
import cn.wanghl.jst.dao.StatisticsDao;
import cn.wanghl.jst.domain.KpiBusDaily;
import cn.wanghl.jst.domain.KpiBusMonth;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Controller
@RequestMapping("/dashboard")
public class DashboardController {
	
		private static Log log = LogFactory.getLog(DashboardController.class);
		
		@Autowired
		private StatisticsDao statisticsDao;
	
		/** 权限列表 */
		public final static class View extends Permission {public View()     {super("查看");}}

		@Autowired
		private KpiBusDailyDao kpiBusDailyDao;
		
		@Autowired
		private KpiBusMonthDao kpiBusMonthDao;
 
//	 	
	 	@ModuleIndex
		@ModuleOperation(name="主页",requiresPerm=View.class)
	 	@RequestMapping("")
		public String dashboard(HttpServletRequest request,HttpServletResponse response,Model model) {
	 		KpiTotalSummary totalSummary = statisticsDao.statTotalSummary();

			model.addAttribute("totalSummary", totalSummary);
			
			Date today = Dates.todayStart();
			Date yestoday = Dates.yestoday();
			Date month = Dates.monthStart(today);
			Date lastMonth = Dates.reduce(new Date(month.getTime()), "1months");
			
			KpiBusDaily todaykpi = kpiBusDailyDao.findByDate(today);
			KpiBusDaily yestodaykpi = kpiBusDailyDao.findByDate(yestoday);
			
			KpiBusMonth monthkpi = kpiBusMonthDao.findByMon(Dates.toString( month, "yyyy-MM"));
			KpiBusMonth lastMonthkpi = kpiBusMonthDao.findByMon(Dates.toString( lastMonth, "yyyy-MM"));
			
			model.addAttribute("todaykpi", todaykpi);
			model.addAttribute("yestodaykpi", yestodaykpi);
			model.addAttribute("monthkpi", monthkpi);
			model.addAttribute("lastMonthkpi", lastMonthkpi);
			
			
			return "dashboard";
		}

		/**
		 * ajax获取图形数据
		 * @param request
		 * @param response
		 * @param model
		 */
	 	@ModuleOperation(name="分页加载",requiresPerm=View.class)
	 	@RequestMapping("ajaxLoadData")
		public void ajaxLoadData(HttpServletRequest request,HttpServletResponse response ,Model model){
			
			String page=null==request.getParameter("page")?"1":request.getParameter("page").isEmpty()?"1":request.getParameter("page");
			Integer pageSize=Integer.parseInt(request.getParameter("current"));
			
			try {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.print(this.graphicList(Integer.parseInt(page),pageSize).toJSONString());
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		/**
		 * 获取图形列表的数据
		 */
		protected JSONObject graphicList(Integer pageNo,Integer pageSize) {
			
			JSONArray array=new JSONArray();
			JSONObject json=new JSONObject();
			try {
				if(pageNo<1){
					json.put("success", false);
					json.put("message", "暂无统计数据！");
					return json;
				}
				
				List<KpiDailySummary> list = statisticsDao.statDailySummary(Dates.now(), (pageNo-1)*pageSize, pageSize);
				
				if(null==list || list.isEmpty()){
					json.put("success", false);
					json.put("message", "暂无统计数据！");
					return json;
				}
				
				for (int i=list.size()-1;i>=0; i--) { 
					KpiDailySummary item = list.get(i);
					JSONObject jsonitem=new JSONObject();
					jsonitem.put("date", new SimpleDateFormat("yyyy-MM-dd").format(item.getDate())); // 统计日期
					jsonitem.put("distance", item.getSalesAmount());// 钱
					jsonitem.put("duration", item.getOrderNumbers()); // 订单数
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
				log.info("查询图形列表失败!-->"+e.getMessage(),e);
			}
			
			return json;
		}

}
