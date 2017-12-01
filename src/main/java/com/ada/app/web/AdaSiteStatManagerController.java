
package com.ada.app.web;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import cn.com.jiand.mvc.framework.utils.Reflections;
import cn.com.jiand.mvc.framework.web.AbstractJQueryEntityController;
import cn.com.jiand.mvc.framework.web.support.JsonEntityResult;
import cn.com.jiand.mvc.framework.web.support.JsonResult;
import cn.com.jiand.mvc.framework.web.support.Servlets;

import com.ada.app.domain.AdaSiteStat;
import com.ada.app.service.AdaSiteStatService;
import com.ada.app.util.Sessions;

@Controller
@Module(name="站点统计")
@RequestMapping(value = "/ada-site-stat")
public class AdaSiteStatManagerController extends AbstractJQueryEntityController<AdaSiteStat, AdaSiteStatService> {
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
	private AdaSiteStatService adaSiteStatService;

	

    @ModuleIndex
	@ModuleOperation(name="浏览",requiresPerm=View.class)
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.list(request, response, model);
	}
    
    protected Map<String, Object> getSearchParams(HttpServletRequest request) {
    	Map<String, Object> paramMap =  Servlets.getParametersStartingWith(request, "search_");		
		paramMap.put("EQ_siteId", Sessions.getCurrentSite().getId());
		
		return paramMap;
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
	public JsonEntityResult<AdaSiteStat> get(HttpServletRequest request,HttpServletResponse response, Model model) {
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
	public JsonEntityResult<AdaSiteStat> save(HttpServletRequest request,HttpServletResponse response) {
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
	public JsonEntityResult<AdaSiteStat> update(HttpServletRequest request,HttpServletResponse response) {
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
		return new String[]{"日期","IP","PV(访问量)"};
	}
	
//	protected List<String> doMarshalEntityToXls(AdaSiteStat entity) {
//		Set<String> simplePropertyNames = Reflections
//				.getSimpleFieldNames(entity.getClass());
//		String[] propertyNames = simplePropertyNames.toArray(new String[]{});
//		String[] propertyNames2 = new String[3];
//		propertyNames2[0] = propertyNames[4];
//		propertyNames2[1] = propertyNames[5];
//		propertyNames2[2] = propertyNames[3];
//		//propertyNames2 = Arrays.copyOfRange(propertyNames, 3, 6);
//		return Reflections.invokeGetterToString(entity, propertyNames2);
//	}
	
	
	protected List<String> doMarshalEntityToXls(AdaSiteStat entity) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		List<String> list = new ArrayList();
		list.add(df.format(entity.getDate()));
		list.add(entity.getIp().toString());
		list.add(entity.getPv().toString());
		
		return list;
	}
}
