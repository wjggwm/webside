package com.webside.role.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jodd.util.StringUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.webside.base.basecontroller.BaseController;
import com.webside.dtgrid.model.Pager;
import com.webside.dtgrid.util.ExportUtils;
import com.webside.exception.AjaxException;
import com.webside.exception.SystemException;
import com.webside.role.model.RoleEntity;
import com.webside.role.service.RoleService;
import com.webside.util.Common;
import com.webside.util.PageUtil;

@Controller
@Scope("prototype")
@RequestMapping("/role/")
public class RoleController extends BaseController {

	@Autowired
	private RoleService roleService;
	
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
			return Common.BACKGROUND_PATH + "/role/list";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "list.html", method = RequestMethod.POST)
	public Object list(String gridPager, HttpServletResponse response) throws Exception{
		Map<String, Object> parameters = null;
		// 映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		// 判断是否包含自定义参数
		parameters = pager.getParameters();
		if (parameters.size() < 0) {
			parameters.put("name", null);
		}
		//3、判断是否是导出操作
				if(pager.getIsExport())
				{
					if(pager.getExportAllData())
					{
						//3.1、导出全部数据
						List<RoleEntity> list = roleService.queryListByPage(parameters);
						ExportUtils.exportAll(response, pager, list);
						return null;
					}else
					{
						//3.2、导出当前页数据
						ExportUtils.export(response, pager);
						return null;
					}
				}else
				{
					//设置分页，page里面包含了分页信息
					Page<Object> page = PageHelper.startPage(pager.getNowPage(),pager.getPageSize(), "r_id DESC");
					List<RoleEntity> list = roleService.queryListByPage(parameters);
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
	}
	
	
	@RequestMapping("addUI.html")
	public String addUI() {
		return Common.BACKGROUND_PATH + "/role/form";
	}
	
	@RequestMapping("add.html")
	@ResponseBody
	public Object add(RoleEntity roleEntity)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			roleEntity.setCreateTime(new Date());
			roleEntity.setStatus(0);
			int result = roleService.insert(roleEntity);
			if(result > 0)
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
			RoleEntity roleEntity = roleService.findById(id);
			PageUtil page = new PageUtil();
			page.setPageNum(Integer.valueOf(request.getParameter("page")));
			page.setPageSize(Integer.valueOf(request.getParameter("rows")));
			page.setOrderByColumn(request.getParameter("sidx"));
			page.setOrderByType(request.getParameter("sord"));
			model.addAttribute("page", page);
			model.addAttribute("roleEntity", roleEntity);
			return Common.BACKGROUND_PATH + "/role/form";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	@RequestMapping("edit.html")
	@ResponseBody
	public Object update(RoleEntity roleEntity)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			int result = roleService.update(roleEntity);
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
			//1、检查该角色下是否有用户，如果有则抛异常，没有则执行后面删除操作
			int userCount = roleService.findRoleUserById(Integer.valueOf(roleIds[0]));
			if(userCount>0)
			{
				result.put("success", false);
				result.put("data", null);
				result.put("message", "该角色已分配用户,请去掉用户角色关联后再删除");
			}else
			{
				Boolean flag = roleService.deleteRoleById(Long.valueOf(roleIds[0]));
				if(flag)
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
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return result;
	}
	
	
	@RequestMapping("permissionUI.html")
	public String permissionUI(Model model, HttpServletRequest request, Long id) {
		try
		{
			RoleEntity roleEntity = roleService.findById(id);
			PageUtil page = new PageUtil();
			page.setPageNum(Integer.valueOf(request.getParameter("page")));
			page.setPageSize(Integer.valueOf(request.getParameter("rows")));
			page.setOrderByColumn(request.getParameter("sidx"));
			page.setOrderByType(request.getParameter("sord"));
			model.addAttribute("page", page);
			model.addAttribute("roleEntity", roleEntity);
			return Common.BACKGROUND_PATH + "/role/permission";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}
	
	
	@RequestMapping("permission.html")
	@ResponseBody
	public Object permission(int roleId, String resourceIds)
	{
		Map<String, Object> map = new HashMap<String, Object>();
		try
		{
			List<Integer> list = new ArrayList<Integer>();
			if(StringUtil.isNotBlank(resourceIds))
			{
				for (String id : resourceIds.split(",")) {
					list.add(Integer.valueOf(id));
				}
			}
			boolean result = roleService.addRolePermBatch(roleId, list);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "授权成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "授权失败");
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
		return map;
	}
	
	@RequestMapping("withoutAuth/validateRoleName.html")
	@ResponseBody
	public Object validateRoleName(@RequestParam(value="name")String roleName){
		try
		{
			roleName = new String(roleName.getBytes("iso-8859-1"),"utf-8");
			RoleEntity roleEntity = roleService.findByName(roleName);
			if(roleEntity == null)
			{
				return true;
			}else
			{
				return false;
			}
		}catch(Exception e)
		{
			throw new AjaxException(e);
		}
	}
	
}
