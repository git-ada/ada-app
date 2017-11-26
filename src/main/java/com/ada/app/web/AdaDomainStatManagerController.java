package com.ada.app.web;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

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

import com.ada.app.dao.AdaDomainDao;
import com.ada.app.dao.AdaDomainStatDao;
import com.ada.app.domain.AdaChannel;
import com.ada.app.domain.AdaDomainStat;
import com.ada.app.service.AdaDomainStatService;
import com.ada.app.util.Dates;
import com.ada.app.util.Sessions;


@Controller
@Module(name="域名统计")
@RequestMapping(value = "/ada-domain-stat")
public class AdaDomainStatManagerController extends AbstractJQueryEntityController<AdaDomainStat, AdaDomainStatService> {
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
	private AdaDomainStatService adaDomainStatService;

	@Autowired
	private AdaDomainStatDao adaDomainStatDao;
	

    @ModuleIndex
	@ModuleOperation(name="浏览",requiresPerm=View.class)
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.list(request, response, model);
	}
    
    @RequestMapping(value = "stat")
    public String domainstat(HttpServletRequest request,HttpServletResponse response, Model model){
    	/** 获取昨天的日期*/
    	Calendar cal=Calendar.getInstance();
    	cal.add(Calendar.DATE,-1);
    	Date time=cal.getTime();
    	String date = new SimpleDateFormat("yyyy-MM-dd").format(time);
    	
    	List<AdaDomainStat> domainstatList = adaDomainStatDao.findBySiteIdandDate(Sessions.getCurrentSite().getId(), date);
    	List<Map> list = new ArrayList<Map>();
    	for(int i=0;i<domainstatList.size();i++){
    		AdaDomainStat adaDomainStat = domainstatList.get(i);
    		Map map = new HashMap();
    		Integer ip = adaDomainStat.getIp()==null?0:adaDomainStat.getIp();
    		Integer pv = adaDomainStat.getPv()==null?0:adaDomainStat.getPv();
    		Integer targetpageip = adaDomainStat.getTargetpageip()==null?0:adaDomainStat.getTargetpageip();
    		Integer clickip1 = adaDomainStat.getClickip1()==null?0:adaDomainStat.getClickip1();
    		Integer clickip2 = adaDomainStat.getClickip2()==null?0:adaDomainStat.getClickip2();
    		Integer clickip3 = adaDomainStat.getClickip3()==null?0:adaDomainStat.getClickip3();
    		Integer clickip4 = adaDomainStat.getClickip4()==null?0:adaDomainStat.getClickip4();
    		Integer staytimeip1 = adaDomainStat.getStaytimeip1()==null?0:adaDomainStat.getStaytimeip1();
    		Integer staytimeip2 = adaDomainStat.getStaytimeip2()==null?0:adaDomainStat.getStaytimeip2();
    		Integer staytimeip3 = adaDomainStat.getStaytimeip3()==null?0:adaDomainStat.getStaytimeip3();
    		Integer staytimeip4 = adaDomainStat.getStaytimeip4()==null?0:adaDomainStat.getStaytimeip4();
    		Integer scrollip1 = adaDomainStat.getScrollip1()==null?0:adaDomainStat.getScrollip1();
    		Integer scrollip2 = adaDomainStat.getScrollip2()==null?0:adaDomainStat.getScrollip2();
    		Integer scrollip3 = adaDomainStat.getScrollip3()==null?0:adaDomainStat.getScrollip3();
    		Integer scrollip4 = adaDomainStat.getScrollip4()==null?0:adaDomainStat.getScrollip4();
    		Integer moveip1 = adaDomainStat.getMoveip1()==null?0:adaDomainStat.getMoveip1();
    		Integer moveip2 = adaDomainStat.getMoveip2()==null?0:adaDomainStat.getMoveip2();
    		Integer moveip3 = adaDomainStat.getMoveip3()==null?0:adaDomainStat.getMoveip3();
    		Integer moveip4 = adaDomainStat.getMoveip4()==null?0:adaDomainStat.getMoveip4();
    		Integer olduserip = adaDomainStat.getOlduserip()==null?0:adaDomainStat.getOlduserip();
    		
    		map.put("date", adaDomainStat.getDate());
    		map.put("domain", adaDomainStat.getDomain().getDomain());
    		if(adaDomainStat.getDomain().getDomain().length()>18){
    			map.put("subdoamin", adaDomainStat.getDomain().getDomain().substring(0, 18));
    		}else{
    			map.put("subdoamin", adaDomainStat.getDomain());
    		}
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
    	
    	model.addAttribute("domainstatList", list);
    	
    	return "ada-domain-stat";
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
	public JsonEntityResult<AdaDomainStat> get(HttpServletRequest request,HttpServletResponse response, Model model) {
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
	public JsonEntityResult<AdaDomainStat> save(HttpServletRequest request,HttpServletResponse response) {
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
	public JsonEntityResult<AdaDomainStat> update(HttpServletRequest request,HttpServletResponse response) {
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
