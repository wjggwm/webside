package com.webside.quartz.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.quartz.CronExpression;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.webside.common.Common;
import com.webside.dtgrid.model.Pager;
import com.webside.enums.JobStatus;
import com.webside.exception.AjaxException;
import com.webside.exception.ServiceException;
import com.webside.quartz.model.ScheduleJobEntity;
import com.webside.quartz.service.ScheduleJobService;
import com.webside.util.PageUtil;

@Controller
@Scope("prototype")
@RequestMapping(value = "/scheduleJob/")
public class ScheduleJobController {

	@Autowired
	private ScheduleJobService scheduleJobService;
	
	@Value("${quartz.job.jobGroup}")
	private String jobGroup;

	@RequestMapping("planningJobListUI.html")
	public String planJobListUI(Model model, HttpServletRequest request) {
		try {
			PageUtil page = new PageUtil();
			if (request.getParameterMap().containsKey("page")) {
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/schedule/planningList";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("runningJobListUI.html")
	public String runningJobListUI(Model model, HttpServletRequest request) {
		try {
			PageUtil page = new PageUtil();
			if (request.getParameterMap().containsKey("page")) {
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/schedule/runningList";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("listUI.html")
	public String listUI(Model model, HttpServletRequest request) {
		try {
			PageUtil page = new PageUtil();
			if (request.getParameterMap().containsKey("page")) {
				page.setPageNum(Integer.valueOf(request.getParameter("page")));
				page.setPageSize(Integer.valueOf(request.getParameter("rows")));
				page.setOrderByColumn(request.getParameter("sidx"));
				page.setOrderByType(request.getParameter("sord"));
			}
			model.addAttribute("page", page);
			return Common.BACKGROUND_PATH + "/schedule/list";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	/**
	 * 
	 * @Title: planJobList
	 * @Description: 获取计划中的任务列表
	 * @param gridPager
	 * @param response
	 * @return Object
	 * @throws Exception
	 */
	@RequestMapping(value = "/planningJobList.html", method = RequestMethod.POST)
	@ResponseBody
	public Object planJobList() throws Exception {
		// 1、映射Pager对象
		List<ScheduleJobEntity> list = scheduleJobService.getPlanJobList();
		// 列表展示数据
		return list;
	}
	
	/**
	 * 
	 * @Title: runningJobList
	 * @Description: 获取正在运行的任务列表
	 * @param gridPager
	 * @param response
	 * @return Object
	 * @throws Exception
	 */
	@RequestMapping(value = "/runningJobList.html", method = RequestMethod.POST)
	@ResponseBody
	public Object runningJobList() throws Exception {
		// 1、映射Pager对象

		List<ScheduleJobEntity> list = scheduleJobService.getRunningJobList();
		// 列表展示数据
		return list;
	}
	
	/**
	 * 
	 * @Title: list
	 * @Description: ajax分页动态加载模式
	 * @param gridPager
	 * @param response
	 * @return Object
	 * @throws Exception
	 */
	@RequestMapping(value = "/list.html", method = RequestMethod.POST)
	@ResponseBody
	public Object list(String gridPager)
			throws Exception {
		Map<String, Object> parameters = null;
		// 1、映射Pager对象
		Pager pager = JSON.parseObject(gridPager, Pager.class);
		// 2、设置查询参数
		parameters = pager.getParameters();
		if (parameters.size() < 0) {
			parameters.put("jobName", null);
		}
		// 设置分页，page里面包含了分页信息
		Page<Object> page = PageHelper.startPage(pager.getNowPage(),pager.getPageSize(), "j_id DESC");
		List<ScheduleJobEntity> list = scheduleJobService.queryListByPage(parameters);
		parameters.clear();
		parameters.put("isSuccess", Boolean.TRUE);
		parameters.put("nowPage", pager.getNowPage());
		parameters.put("pageSize", pager.getPageSize());
		parameters.put("pageCount", page.getPages());
		parameters.put("recordCount", page.getTotal());
		parameters.put("startRecord", page.getStartRow());
		// 列表展示数据
		parameters.put("exhibitDatas", list);
		return parameters;
	}
	
	

	@RequestMapping("addUI.html")
	public String addUI(Model model) {
		try {
			model.addAttribute("jobGroup", JSONArray.parseArray(jobGroup).toArray());
			return Common.BACKGROUND_PATH + "/schedule/form";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	/**
	 * 
	 * @Title: addQuartzJob
	 * @Description: 任务创建
	 * @param job
	 * @return Object
	 * @throws
	 */
	@RequestMapping(value = "/add.html")
	@ResponseBody
	public Object addQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			job.setCreateTime(new Date(System.currentTimeMillis()));
			job.setJobStatus(JobStatus.NORMAL.name());
			boolean result = scheduleJobService.addJob(job);
			if (result) {
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "添加成功");
			} else {
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "添加失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}
		return map;
	}

	@RequestMapping("editUI.html")
	public String editUI(Model model, HttpServletRequest request, Long id) {
		try {
			ScheduleJobEntity scheduleJobEntity = scheduleJobService.findById(id);
			PageUtil page = new PageUtil();
			page.setPageNum(Integer.valueOf(request.getParameter("page")));
			page.setPageSize(Integer.valueOf(request.getParameter("rows")));
			page.setOrderByColumn(request.getParameter("sidx"));
			page.setOrderByType(request.getParameter("sord"));
			
			model.addAttribute("jobGroup", JSONArray.parseArray(jobGroup).toArray());
			model.addAttribute("page", page);
			model.addAttribute("scheduleJobEntity", scheduleJobEntity);
			return Common.BACKGROUND_PATH + "/schedule/form";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	/**
	 * 
	 * @Title: updateQuartzJob
	 * @Description: 任务更新:任务名称和组不可更新
	 * @param job
	 * @return Object
	 * @throws
	 */
	@RequestMapping(value = "/edit.html")
	@ResponseBody
	public Object updateQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.updateJob(job);
			if (result) {
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "编辑成功");
			} else {
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "编辑失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}

		return map;
	}

	/**
	 * 暂停任务
	 * 
	 * @param request
	 * @param response
	 * @param job
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/pause.html")
	@ResponseBody
	public Object pauseQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			job.setJobStatus(JobStatus.PAUSED.name());
			boolean result = scheduleJobService.pauseJob(job);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "暂停成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "暂停失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}
		return map;
	}

	/**
	 * 恢复任务
	 * 
	 * @param request
	 * @param response
	 * @param scheduleJob
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/resume.html")
	@ResponseBody
	public Object resumeQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			job.setJobStatus(JobStatus.NORMAL.name());
			boolean result = scheduleJobService.resumeJob(job);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "恢复成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "恢复失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}
		return map;
	}

	/**
	 * 删除任务
	 * 
	 * @param request
	 * @param response
	 * @param scheduleJob
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/delete.html")
	@ResponseBody
	public Object deleteQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			job.setJobStatus(JobStatus.DELETE.name());
			boolean result = scheduleJobService.deleteJob(job);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "删除成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "删除失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}
		return map;
	}

	/**
	 * 执行一次任务
	 * 
	 * @param request
	 * @param response
	 * @param scheduleJob
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/executeOnce.html")
	@ResponseBody
	public Object executeQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.executeJob(job);
			if(result)
			{
				map.put("success", Boolean.TRUE);
				map.put("data", null);
				map.put("message", "执行成功");
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "执行失败");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		}
		return map;
	}
	
	@RequestMapping("withoutAuth/validateCron.html")
	@ResponseBody
	public Object validateCronExpression(String cronExpression){
		try
		{
			boolean result = CronExpression.isValidExpression(cronExpression);
			if(result)
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
