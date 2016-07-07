package com.webside.resource.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.webside.base.basecontroller.BaseController;
import com.webside.exception.AjaxException;
import com.webside.exception.SystemException;
import com.webside.dtgrid.model.Pager;
import com.webside.resource.model.ResourceEntity;
import com.webside.resource.service.ResourceService;
import com.webside.roleresource.service.RoleResourceService;
import com.webside.util.Common;
import com.webside.util.JSTreeEntity;
import com.webside.util.PageUtil;
import com.webside.util.Select2Entity;
import com.webside.util.TreeUtil;

@Controller
@Scope("prototype")
@RequestMapping("/resource/")
public class ResourceController extends BaseController {

	@Autowired
	private ResourceService resourceService;
	
	@Autowired
	private RoleResourceService roleResourceService;
	
	@RequestMapping("listUI.html")
	public String listUI(Model model, HttpServletRequest request) {
		try
		{
			PageUtil page = new PageUtil();
			if(request.getParameterMap().containsKey("page")){
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/resource/list";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	
	@RequestMapping("list.html")
	@ResponseBody
	public Object list(String gridPager) throws Exception{
		Map<String,Object> parameters = null;
		// 映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		// 判断是否包含自定义参数
		parameters = pager.getParameters();
		if (parameters.size() < 0) {
			parameters.put("name", null);
		}
		// 设置分页，page里面包含了分页信息
		Page<Object> page = PageHelper.startPage(pager.getNowPage(),pager.getPageSize(), "s_id DESC");
	
		List<ResourceEntity> list = resourceService.queryListByPage(parameters);
		parameters.clear();
		parameters.put("isSuccess", Boolean.TRUE);
		parameters.put("nowPage", pager.getNowPage());
		parameters.put("pageSize", pager.getPageSize());
		parameters.put("pageCount", page.getPages());
		parameters.put("recordCount", page.getTotal());
		parameters.put("startRecord", page.getStartRow());
		//列表展示数据
		parameters.put("exhibitDatas", list);
		return parameters;
	}
	
	
	@RequestMapping("resourceTree.html")
	@ResponseBody
	public Object resourceTree(int roleId) {
		Map<String,Object> parameter = new HashMap<String,Object>();
		List<JSTreeEntity> jstreeList = null;
		try{
			parameter.put("isHide", 0);
			//parameter.put("type", 0);
			parameter.put("roleId", roleId);
			List<ResourceEntity> list = resourceService.queryResourceList(parameter);
			jstreeList = new TreeUtil().generateJSTree(list);
		}
		catch (Exception e) {
			jstreeList = new ArrayList<JSTreeEntity>();
			logger.error(e.getMessage(), e);
		}
		return jstreeList;
	}
	
	
	@RequestMapping("resourceSelectTree.html")
	@ResponseBody
	public Object resourceSelectTree() {
		List<Select2Entity> select2Entity = null;
		try
		{
			Map<String,Object> parameter = new HashMap<String,Object>();
			List<ResourceEntity> list = resourceService.queryListByPage(parameter);
			select2Entity = new TreeUtil().getSelectTree(list, null);
			parameter.clear();
			parameter.put("items", select2Entity);
			return parameter;
		}catch (Exception e) {
			select2Entity = new ArrayList<Select2Entity>();
			throw new AjaxException(e);
		}
	}
	
	
	@RequestMapping("addUI.html")
	public String addUI(Model model, HttpServletRequest request) {
		try
		{
			List<ResourceEntity> list = resourceService.queryListByPage(new HashMap<String,Object>());
			List<Select2Entity> select2List = new TreeUtil().getSelectTree(list, null);
			
			model.addAttribute("select2List", select2List);
			return Common.BACKGROUND_PATH + "/resource/form";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	@RequestMapping("add.html")
	@ResponseBody
	public Object add(ResourceEntity resourceEntity)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			resourceEntity.setIsHide(0);
			resourceEntity.setCreateTime(new Date());
			if(resourceEntity.getParentId() != null)
			{
				resourceEntity.setIcon(null);
			}
			boolean result = roleResourceService.insertRoleAndResource(resourceEntity);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "添加成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "添加失败");
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return map;
	}
	
	
	@RequestMapping("editUI.html")
	public String editUI(Model model, HttpServletRequest request, Long id) {
		try
		{
			ResourceEntity resourceEntity = resourceService.findById(id);
			PageUtil page = new PageUtil();
			page.setPageNum(Integer.valueOf(request.getParameter("page")));
			page.setPageSize(Integer.valueOf(request.getParameter("rows")));
			page.setOrderByColumn(request.getParameter("sidx"));
			page.setOrderByType(request.getParameter("sord"));
			
			List<ResourceEntity> list = resourceService.queryListByPage(new HashMap<String,Object>());
			List<Select2Entity> select2List = new TreeUtil().getSelectTree(list, null);
			
			model.addAttribute("page", page);
			model.addAttribute("resourceEntity", resourceEntity);
			model.addAttribute("select2List", select2List);
			return Common.BACKGROUND_PATH + "/resource/form";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	@RequestMapping("edit.html")
	@ResponseBody
	public Object update(ResourceEntity resourceEntity)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			if(resourceEntity.getType() == 1)
			{
				resourceEntity.setIcon(null);
			}
			int result = resourceService.update(resourceEntity);
			if(result > 0)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "编辑成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "编辑失败");
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return map;
	}
	
	
	@RequestMapping("deleteBatch.html")
	@ResponseBody
	public Object deleteBatch(String ids) {
		Map<String, Object> result = new HashMap<String, Object>();
		try
		{
			String[] roleIds = ids.split(",");
			List<Long> list = new ArrayList<Long>();
			for (String string : roleIds) {
				list.add(Long.valueOf(string));
			}
			int cnt = resourceService.deleteBatchById(list);
			if(cnt == list.size())
			{
				result.put("success", true);
				result.put("data", null);
				result.put("message", "删除成功");
			}else
			{
				result.put("success", false);
				result.put("data", null);
				result.put("message", "删除失败");
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return result;
	}
	
	
	@RequestMapping("icon.html")
	public String icon() {
		return Common.BACKGROUND_PATH + "/resource/icon";
	}
	
}
