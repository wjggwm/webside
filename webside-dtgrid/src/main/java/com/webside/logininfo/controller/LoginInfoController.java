package com.webside.logininfo.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.webside.base.basecontroller.BaseController;
import com.webside.dtgrid.model.Pager;
import com.webside.dtgrid.util.ExportUtils;
import com.webside.exception.SystemException;
import com.webside.logininfo.model.LoginInfoEntity;
import com.webside.logininfo.service.LoginInfoService;
import com.webside.util.Common;

@Controller
@Scope("prototype")
@RequestMapping(value = "/loginInfo/")
public class LoginInfoController extends BaseController {

	@Autowired
	private LoginInfoService loginInfoService;

	@RequestMapping("listUI.html")
	public String listUI() {
		try
		{
			return Common.BACKGROUND_PATH + "/logininfo/list";
		}catch(Exception e)
		{
			throw new SystemException(e);
		}
	}

	/**
	 * ajax分页动态加载模式
	 * 
	 * @param dtGridPager
	 *            Pager对象
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	@ResponseBody
	public Object list(String gridPager, HttpServletResponse response) throws Exception{
		Map<String, Object> parameters = null;
		// 映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		// 判断是否包含自定义参数
		parameters = pager.getParameters();
		if (parameters.size() < 0) {
			parameters.put("accountName", null);
		}
		//3、判断是否是导出操作
				if(pager.getIsExport())
				{
					if(pager.getExportAllData())
					{
						//3.1、导出全部数据
						List<LoginInfoEntity> list = loginInfoService.queryListByPage(parameters);
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
					// 设置分页，page里面包含了分页信息
					Page<Object> page = PageHelper.startPage(pager.getNowPage(),pager.getPageSize(), "l_login_time DESC");
					List<LoginInfoEntity> list = loginInfoService.queryListByPage(parameters);
					parameters.clear();
					parameters.put("isSuccess", Boolean.TRUE);
					parameters.put("nowPage", pager.getNowPage());
					parameters.put("pageSize", pager.getPageSize());
					parameters.put("pageCount", page.getPages());
					parameters.put("recordCount", page.getTotal());
					parameters.put("startRecord", page.getStartRow());
					parameters.put("exhibitDatas", list);
					return parameters;
				}
		
	}

}
