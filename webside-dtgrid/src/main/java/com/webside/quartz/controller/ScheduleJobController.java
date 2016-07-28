package com.webside.quartz.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.quartz.CronExpression;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.util.StringUtils;
import com.alibaba.fastjson.JSONArray;
import com.webside.common.Common;
import com.webside.exception.AjaxException;
import com.webside.exception.ServiceException;
import com.webside.quartz.model.ScheduleJobEntity;
import com.webside.quartz.service.ScheduleJobService;

@Controller
@Scope("prototype")
@RequestMapping(value = "/scheduleJob/")
public class ScheduleJobController {

	@Autowired
	private ScheduleJobService scheduleJobService;
	
	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;
	
	@Value("${quartz.job.jobGroup}")
	private String jobGroup;

	@RequestMapping("planningJobListUI.html")
	public String planJobListUI(Model model) {
		try {
			return Common.BACKGROUND_PATH + "/schedule/planningList";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("runningJobListUI.html")
	public String runningJobListUI(Model model) {
		try {
			return Common.BACKGROUND_PATH + "/schedule/runningList";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("jobTriggerListUI.html")
	public String jobTriggerListUI(Model model, ScheduleJobEntity job) {
		try {
			model.addAttribute("scheduleJobEntity", job);
			return Common.BACKGROUND_PATH + "/schedule/triggerList";
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
	public Object planJobList(String timestamp) throws Exception {
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
	public Object runningJobList(String timestamp) throws Exception {
		// 1、映射Pager对象
		List<ScheduleJobEntity> list = scheduleJobService.getRunningJobList();
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
	@RequestMapping(value = "/jobTriggerList.html", method = RequestMethod.POST)
	@ResponseBody
	public Object jobTriggerList(ScheduleJobEntity job) throws Exception {
		List<ScheduleJobEntity> list = scheduleJobService.getTriggers(job);
		// 列表展示数据
		return list;
	}
	
	@RequestMapping("addJobUI.html")
	public String addJobUI(Model model) {
		try {
			model.addAttribute("jobGroup", JSONArray.parseArray(jobGroup).toArray());
			return Common.BACKGROUND_PATH + "/schedule/jobForm";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}
	
	@RequestMapping("addTriggerUI.html")
	public String addTriggerUI(Model model,ScheduleJobEntity job) {
		try {
			model.addAttribute("jobGroup", JSONArray.parseArray(jobGroup).toArray());
			model.addAttribute("scheduleJobEntity", job);
			return Common.BACKGROUND_PATH + "/schedule/triggerForm";
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
	@RequestMapping(value = "/addJob.html")
	@ResponseBody
	public Object addQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if (!scheduler.checkExists(job.getJobKey())) {
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
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "job已存在");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		} catch (SchedulerException e) {
			throw new AjaxException(e);
		}
		return map;
	}
	
	/**
	 * 
	 * @Title: addQuartzJob
	 * @Description: 任务创建
	 * @param job
	 * @return Object
	 * @throws
	 */
	@RequestMapping(value = "/addTrigger.html")
	@ResponseBody
	public Object addQuartzTrigger(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if(StringUtils.isEmpty(job.getTriggerGroup()))
			{
				//使用默认组名称:DEFAULT
				job.setTriggerGroup(Scheduler.DEFAULT_GROUP);
			}
			if (!scheduler.checkExists(job.getTriggerKey())) {
				boolean result = scheduleJobService.addJobTrigger(job);
				if (result) {
					map.put("success", Boolean.TRUE);
					map.put("data", null);
					map.put("message", "添加成功");
				} else {
					map.put("success", Boolean.FALSE);
					map.put("data", null);
					map.put("message", "添加失败");
				}
			}else
			{
				map.put("success", Boolean.FALSE);
				map.put("data", null);
				map.put("message", "trigger已存在");
			}
		} catch (ServiceException e) {
			throw new AjaxException(e);
		} catch (SchedulerException e) {
			throw new AjaxException(e);
		}
		return map;
	}

	@RequestMapping("editTriggerUI.html")
	public String editUI(Model model, ScheduleJobEntity job) {
		try {
			ScheduleJobEntity scheduleJobEntity = scheduleJobService.getScheduleJobEntity(job);
			model.addAttribute("jobGroup", JSONArray.parseArray(jobGroup).toArray());
			model.addAttribute("scheduleJobEntity", scheduleJobEntity);
			return Common.BACKGROUND_PATH + "/schedule/triggerForm";
		} catch (Exception e) {
			throw new AjaxException(e);
		}
	}

	/**
	 * 
	 * @Title: updateQuartzTrigger
	 * @Description: 更新trigger
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/editTrigger.html")
	@ResponseBody
	public Object updateQuartzTrigger(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.updateJobTrigger(job);
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
	 * 
	 * @Title: pauseQuartzJob
	 * @Description: 暂停job
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/pauseJob.html")
	@ResponseBody
	public Object pauseQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.pauseJob(job.getJobKey());
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
	 * 
	 * @Title: pauseQuartzTrigger
	 * @Description: 暂停trigger
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/pauseTrigger.html")
	@ResponseBody
	public Object pauseQuartzTrigger(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.pauseJobTrigger(job.getTriggerKey());
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
	 * 
	 * @Title: resumeQuartzJob
	 * @Description: 恢复job
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/resumeJob.html")
	@ResponseBody
	public Object resumeQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.resumeJob(job.getJobKey());
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
	 * 
	 * @Title: resumeQuartzTrigger
	 * @Description: 恢复trigger
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/resumeTrigger.html")
	@ResponseBody
	public Object resumeQuartzTrigger(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.resumeJobTrigger(job.getTriggerKey());
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
	 * 
	 * @Title: deleteQuartzJob
	 * @Description: 删除job
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/deleteJob.html")
	@ResponseBody
	public Object deleteQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.deleteJob(job.getJobKey());
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
	 * 
	 * @Title: deleteQuartzTrigger
	 * @Description: 删除trigger
	 * @param job
	 * @return	Object
	 * @throws
	 */
	@RequestMapping(value = "/deleteTrigger.html")
	@ResponseBody
	public Object deleteQuartzTrigger(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.deleteJobTrigger(job.getTriggerKey());
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
	 * 执行一次job
	 * 
	 * @param request
	 * @param response
	 * @param scheduleJob
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/executeJob.html")
	@ResponseBody
	public Object executeQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.executeJob(job.getJobKey());
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
	
	/**
	 * 执行一次j
	 * 
	 * @param request
	 * @param response
	 * @param scheduleJob
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/interruptJob.html")
	@ResponseBody
	public Object interruptQuartzJob(ScheduleJobEntity job) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			boolean result = scheduleJobService.interruptJob(job.getJobKey());
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
