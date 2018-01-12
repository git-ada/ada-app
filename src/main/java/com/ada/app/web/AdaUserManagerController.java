package com.ada.app.web;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.com.jiand.mvc.framework.module.Module;
import cn.com.jiand.mvc.framework.module.ModuleIndex;
import cn.com.jiand.mvc.framework.module.ModuleOperation;
import cn.com.jiand.mvc.framework.module.Permission;
import cn.com.jiand.mvc.framework.utils.MD5s;
import cn.com.jiand.mvc.framework.web.AbstractJQueryEntityController;
import cn.com.jiand.mvc.framework.web.support.JsonEntityResult;
import cn.com.jiand.mvc.framework.web.support.JsonResult;
import com.ada.app.domain.AdaUser;
import com.ada.app.service.AdaUserService;

@Controller
@Module(name="用户")
@RequestMapping(value = "/ada-user")
@SuppressWarnings("all")
public class AdaUserManagerController extends AbstractJQueryEntityController<AdaUser, AdaUserService> {
	/**
	 * 权限列表
	 */
	public final static class View extends Permission {public View()     {super("查看");}}
	public final static class Create extends Permission {public Create() {super("新增");}}
	public final static class Edit extends Permission {public Edit()     {super("编辑");}}
	public final static class Import extends Permission {public Import() {super("导入");}}
	public final static class Export extends Permission {public Export() {super("导出");}}
	public final static class Delete extends Permission {public Delete() {super("删除");}}
	
	private static Map<String, String> allSexs =  new TreeMap();
	static {
		allSexs.put("0", "未知");
		allSexs.put("1", "男");
		allSexs.put("2", "女");
	}
	private static Map<String, String> allStatuss =  new TreeMap();
	static {
		allStatuss.put("1", "正常");
		allStatuss.put("-1", "禁用");
	}
	private static Map<String, String> allIsAdmins =  new TreeMap();
	static {
		allIsAdmins.put("1", "是");
		allIsAdmins.put("0", "否");
	}

	@Autowired
	private AdaUserService adaUserService;

	
	@Override
	protected void referenceData(HttpServletRequest request, Map<String, Object> model) {
		model.put("allSexs", allSexs);
		model.put("allStatuss", allStatuss);
		model.put("allIsAdmins", allIsAdmins);
	}

    @ModuleIndex
	@ModuleOperation(name="浏览",requiresPerm=View.class)
	@RequestMapping(value = "list")
	public String list(HttpServletRequest request,HttpServletResponse response, Model model) {
		return super.list(request, response, model);
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
	public JsonEntityResult<AdaUser> get(HttpServletRequest request,HttpServletResponse response, Model model) {
		
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
	public JsonEntityResult<AdaUser> save(HttpServletRequest request,HttpServletResponse response) {
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
	public JsonEntityResult<AdaUser> update(HttpServletRequest request,HttpServletResponse response) {
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
		//return new String[]{"用户ID","用户名","密码,MD5","昵称","真名","身份证号码","邮箱","手机","生日","性别","头像URL","省ID","城市ID","地区ID","家庭住址","状态","创建时间","是否为管理员"};
		return new String[]{"用户ID","用户名","密码,MD5","昵称","状态","是否为管理员","创建时间"};
	}
	
	/*
	 * (non-Javadoc)
	 * @see cn.com.jiand.mvc.framework.web.AbstractFileOperationController#doMarshalEntityToXls(cn.com.jiand.mvc.framework.domain.AbstractEntity)
	 */
	protected List<String> doMarshalEntityToXls(AdaUser entity) {
		String createTime =  entity.getCreateTime().toString();
		createTime = createTime.replace(".0", "");
		
		List<String> list = new ArrayList();
		list.add(entity.getId().toString());
		list.add(entity.getUsername());
		list.add(entity.getPassword());
		list.add(entity.getNickname());
		list.add(entity.getStatus() == 1 ? "正常" : "禁用");
		list.add(entity.getIsAdmin() == 1 ?  "是" : "否");
		list.add(createTime);
		
		return list;
	}
	
	/*
	 * (non-Javadoc)
	 * @see cn.com.jiand.mvc.framework.web.AbstractOperationController#doSave(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, org.springframework.ui.Model, boolean)
	 */
	public AdaUser doSave(HttpServletRequest request,
			HttpServletResponse response, Model model, boolean isCreate)
			throws Exception {
		AdaUser entity = loadEntity(request);
		if (entity == null) {
			entity = getEntityClass().newInstance();
		}
		//System.out.println("Password :"+entity.getId()+"---"+entity.getPassword());
		doDataBinding(request, entity);
		onSave(request, response, model, entity, isCreate);
		// 这里服务层默认是根据entity的Id是否为空自动判断是SAVE还是UPDATE.
		if(isCreate){
			entity.setPassword(MD5s.encode(entity.getPassword()));
			getEntityService().save(entity);
		}else{
			getEntityService().update(entity);
			entity.setPassword(MD5s.encode(entity.getPassword()));
			getEntityService().update(entity);
		}
		//System.out.println("Password :"+entity.getId()+"---"+entity.getPassword());
		return entity;
	}
	
	
	
}
