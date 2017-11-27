package com.ada.app.web;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.jiand.mvc.framework.module.Module;
import cn.com.jiand.mvc.framework.module.ModuleIndex;
import cn.com.jiand.mvc.framework.module.ModuleOperation;
import cn.com.jiand.mvc.framework.module.Permission;
import cn.com.jiand.mvc.framework.web.AbstractJQueryEntityController;
import cn.com.jiand.mvc.framework.web.support.JsonEntityResult;
import cn.com.jiand.mvc.framework.web.support.JsonResult;
import cn.com.jiand.mvc.framework.web.support.Servlets;

import com.ada.app.dao.AdaChannelDao;
import com.ada.app.dao.AdaChannelStatDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaChannelStat;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.service.AdaChannelStatService;
import com.ada.app.util.Sessions;

@Controller
@Module(name="渠道统计")
@RequestMapping(value = "/ada-channel-stat")
public class AdaChannelStatManagerController extends AbstractJQueryEntityController<AdaChannelStat, AdaChannelStatService> {
	/**
	 * 权限列表
	 */
	public final static class View extends Permission {public View()     {super("查看");}}
	public final static class Create extends Permission {public Create() {super("新增");}}
	public final static class Edit extends Permission {public Edit()     {super("编辑");}}
	public final static class Import extends Permission {public Import() {super("导入");}}
	public final static class Export extends Permission {public Export() {super("导出");}}
	public final static class Delete extends Permission {public Delete() {super("删除");}}
	

	@Autowired
	private AdaChannelStatService adaChannelStatService;
	
	@Autowired
	private AdaChannelDao adaChannelDao;
	@Autowired
	private AdaChannelStatDao adaChannelStatDao;

    @ModuleIndex
	@ModuleOperation(name="浏览",requiresPerm=View.class)
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.list(request, response, model);
	}
    
    protected Map<String, Object> getSearchParams(HttpServletRequest request) {
    	Map<String, Object> paramMap =  Servlets.getParametersStartingWith(request, "search_");
		String channelName = (String) paramMap.get("EQ_channelName");
		if(channelName!=null){
			List<AdaChannel> channels = adaChannelDao.findByChannelName(channelName);
			if(channels!=null && !channels.isEmpty()){
				AdaChannel channel = channels.get(0);
				paramMap.put("EQ_channelId", channel.getId());
			}
			paramMap.remove("EQ_channelName");
		}
		
		paramMap.put("EQ_siteId", Sessions.getCurrentSite().getId());
		
		return paramMap;
	}
	
    @RequestMapping(value = "stat")
    public String channelstat(HttpServletRequest request,HttpServletResponse response, Model model,
    		String search_GTE_date,String channelName){
    	String channelNamestr =channelName==null?"":channelName.trim();
    	model.addAttribute("channelName", channelNamestr);
    	String date = "";
    	if(search_GTE_date!=null && !"".equals(search_GTE_date)){
    		date = search_GTE_date;
    	}else{
    		/** 获取昨天的日期*/
        	Calendar cal=Calendar.getInstance();
        	cal.add(Calendar.DATE,-1);
        	Date time=cal.getTime();
        	 date = new SimpleDateFormat("yyyy-MM-dd").format(time);
    	}
    	model.addAttribute("search_GTE_date", date);
    	List<AdaChannelStat> channelstatList = null;
    	if(!"".equals(channelNamestr)){
    		channelstatList = adaChannelStatDao.findBySiteIdandDateAndChannelname(Sessions.getCurrentSite().getId(), date,channelNamestr);
    	}else{
    		channelstatList = adaChannelStatDao.findBySiteIdandDate(Sessions.getCurrentSite().getId(), date);
    	}
        
    	List<Map> list = new ArrayList<Map>();
    	for(int i=0;i<channelstatList.size();i++){
    		AdaChannelStat adaChannelStat = channelstatList.get(i);
    		Map map = new HashMap();
    		Integer ip = adaChannelStat.getIp()==null?0:adaChannelStat.getIp();
    		Integer pv = adaChannelStat.getPv()==null?0:adaChannelStat.getPv();
    		Integer targetpageip = adaChannelStat.getTargetpageip()==null?0:adaChannelStat.getTargetpageip();
    		Integer clickip1 = adaChannelStat.getClickip1()==null?0:adaChannelStat.getClickip1();
    		Integer clickip2 = adaChannelStat.getClickip2()==null?0:adaChannelStat.getClickip2();
    		Integer clickip3 = adaChannelStat.getClickip3()==null?0:adaChannelStat.getClickip3();
    		Integer clickip4 = adaChannelStat.getClickip4()==null?0:adaChannelStat.getClickip4();
    		Integer staytimeip1 = adaChannelStat.getStaytimeip1()==null?0:adaChannelStat.getStaytimeip1();
    		Integer staytimeip2 = adaChannelStat.getStaytimeip2()==null?0:adaChannelStat.getStaytimeip2();
    		Integer staytimeip3 = adaChannelStat.getStaytimeip3()==null?0:adaChannelStat.getStaytimeip3();
    		Integer staytimeip4 = adaChannelStat.getStaytimeip4()==null?0:adaChannelStat.getStaytimeip4();
    		Integer scrollip1 = adaChannelStat.getScrollip1()==null?0:adaChannelStat.getScrollip1();
    		Integer scrollip2 = adaChannelStat.getScrollip2()==null?0:adaChannelStat.getScrollip2();
    		Integer scrollip3 = adaChannelStat.getScrollip3()==null?0:adaChannelStat.getScrollip3();
    		Integer scrollip4 = adaChannelStat.getScrollip4()==null?0:adaChannelStat.getScrollip4();
    		Integer moveip1 = adaChannelStat.getMoveip1()==null?0:adaChannelStat.getMoveip1();
    		Integer moveip2 = adaChannelStat.getMoveip2()==null?0:adaChannelStat.getMoveip2();
    		Integer moveip3 = adaChannelStat.getMoveip3()==null?0:adaChannelStat.getMoveip3();
    		Integer moveip4 = adaChannelStat.getMoveip4()==null?0:adaChannelStat.getMoveip4();
    		Integer olduserip = adaChannelStat.getOlduserip()==null?0:adaChannelStat.getOlduserip();
    		
    		map.put("date", adaChannelStat.getDate());
    		map.put("channelName", adaChannelStat.getChannel().getChannelName());
    	
    		map.put("ip", ip);
    		map.put("pv", pv);
    		map.put("targetpageip",targetpageip);
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
		    NumberFormat numberFormat = NumberFormat.getInstance();     
		    numberFormat.setMaximumFractionDigits(2);
    		if(ip>0){
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
    		
    		list.add(map);
    	}
    	
    	model.addAttribute("channelstatList", list);
    	
    	return "ada-channel-stat";
    }
    
    
	@ModuleOperation(name="查看",requiresPerm=View.class)
	@RequestMapping(value = "show")
	public String show(HttpServletRequest request,
			HttpServletResponse response, Model model) {
		return super.show(request, response, model);
	}
	
	@ModuleOperation(name="获取",requiresPerm=View.class)
	@RequestMapping(value = "get")
	@ResponseBody
	public JsonEntityResult<AdaChannelStat> get(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.showJson(request, response);
	}

	@ModuleOperation(name="新增",requiresPerm=Create.class)
	@RequestMapping(value = "create")
	public String create(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.create(request, response, model);
	}
	
	@ModuleOperation(name="保存",requiresPerm=Create.class)
	@RequestMapping(value = "save")
	@ResponseBody
	public JsonEntityResult<AdaChannelStat> save(HttpServletRequest request,HttpServletResponse response) {
		return super.saveJson(request, response);
	}
	
	@ModuleOperation(name="编辑",requiresPerm=Edit.class)
	@RequestMapping(value = "edit")
	public String edit(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.edit(request, response, model);
	}
	
	@ModuleOperation(name="更新",requiresPerm=Edit.class)
	@RequestMapping(value = "update")
	@ResponseBody
	public JsonEntityResult<AdaChannelStat> update(HttpServletRequest request,HttpServletResponse response) {
		return super.updateJson(request, response);
	}
	
	@ModuleOperation(name="导出",requiresPerm=Export.class)
	@RequestMapping(value = "export")
	public String export(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.exportExcel(request, response, model);
	}
	
	@ModuleOperation(name="导入",requiresPerm=Import.class)
	@RequestMapping(value = "import")
	public String importXls(Model model, HttpServletRequest request,HttpServletResponse response) {
		return super.importXls(model, request, response);
	}
	
	@ModuleOperation(name="删除",requiresPerm=Delete.class)
	@RequestMapping(value = "delete")
	@ResponseBody
	public JsonResult delete(HttpServletRequest request,HttpServletResponse response) {
		return super.deleteJson(request, response);
	}
	
	protected String[] getExportTitles() {
		return new String[]{"ID","站点ID","渠道ID","IP","PV","1-2次点击","3-5次点击","6-10次点击","10+次点击","目标页访问","日期","创建时间",""};
	}
}
