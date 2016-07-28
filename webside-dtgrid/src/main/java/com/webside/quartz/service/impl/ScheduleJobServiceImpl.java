package com.webside.quartz.service.impl;

import static org.quartz.TriggerBuilder.newTrigger;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import jxl.common.Logger;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.JobExecutionContext;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.Trigger;
import org.quartz.TriggerKey;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import com.alibaba.druid.util.StringUtils;
import com.webside.base.baseservice.impl.AbstractService;
import com.webside.exception.ServiceException;
import com.webside.quartz.mapper.ScheduleJobMapper;
import com.webside.quartz.model.ScheduleJobEntity;
import com.webside.quartz.service.ScheduleJobService;

@Service("scheduleJobService")
public class ScheduleJobServiceImpl extends
		AbstractService<ScheduleJobEntity, Long> implements ScheduleJobService {

	private static Logger logger = Logger.getLogger(ScheduleJobServiceImpl.class);

	@Autowired
	private ScheduleJobMapper scheduleJobMapper;

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(scheduleJobMapper);
	}

	@Override
	public List<ScheduleJobEntity> getPlanJobList() {
		List<ScheduleJobEntity> jobList = new ArrayList<>();
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		try {
			GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
			Set<JobKey> jobKeySet = scheduler.getJobKeys(matcher);
			for (JobKey jobKey : jobKeySet) {
				/*
				List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
				for (Trigger trigger : triggers) {
					ScheduleJobEntity scheduleJob = new ScheduleJobEntity();
					this.wrapScheduleJob(scheduleJob, scheduler, jobKey, trigger);
					jobList.add(scheduleJob);
				}
				*/
				JobDetail jobDetail = scheduler.getJobDetail(jobKey);
				ScheduleJobEntity scheduleJob = new ScheduleJobEntity();
				scheduleJob.setJobName(jobKey.getName());
				scheduleJob.setJobGroup(jobKey.getGroup());
				scheduleJob.setJobClassName(jobDetail.getJobClass().getName());
				scheduleJob.setJobDesc(jobDetail.getDescription());
				jobList.add(scheduleJob);
			}
		} catch (SchedulerException e) {
			logger.error("获取计划任务列表失败", e);
			throw new ServiceException("获取计划任务列表失败", e);
		}
		return jobList;
	}

	@Override
	public List<ScheduleJobEntity> getRunningJobList() {
		List<ScheduleJobEntity> jobList = null;
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		try {
		List<JobExecutionContext> executingJobList = scheduler.getCurrentlyExecutingJobs();
		jobList = new ArrayList<>(executingJobList.size());
		for (JobExecutionContext executingJob : executingJobList) {
			ScheduleJobEntity scheduleJob = new ScheduleJobEntity();
			JobDetail jobDetail = executingJob.getJobDetail();
			JobKey jobKey = jobDetail.getKey();
			Trigger trigger = executingJob.getTrigger();
			this.wrapScheduleJob(scheduleJob, scheduler, jobKey, trigger);
			jobList.add(scheduleJob);
		}
		} catch (Exception e) {
			logger.error("获取计划任务列表失败", e);
			throw new ServiceException("获取计划任务列表失败", e);
		}
		return jobList;
	}
	
	@Override
	public List<ScheduleJobEntity> getTriggers(ScheduleJobEntity job){
		List<ScheduleJobEntity> scheduleJobList = new ArrayList<ScheduleJobEntity>();
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
			for (Trigger jobTrigger : triggers) {
				ScheduleJobEntity scheduleJob = new ScheduleJobEntity();
				this.wrapScheduleJob(scheduleJob, scheduler, jobKey, jobTrigger);
				scheduleJobList.add(scheduleJob);
			}
			
		} catch (SchedulerException e) {
			logger.error("jobName: "+job.getJobName()+" jobGroup: "+job.getJobGroup()+" 获取trigger异常：",e);
			throw new ServiceException("获取job失败", e);
		}
		return scheduleJobList;
	}

	@Override
	 public ScheduleJobEntity getScheduleJobEntity(ScheduleJobEntity job){
		try {
		Scheduler scheduler = schedulerFactoryBean.getScheduler();
		JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
		TriggerKey triggerKey = job.getTriggerKey();
		Trigger trigger = scheduler.getTrigger(triggerKey);
		this.wrapScheduleJob(job, scheduler, jobKey, trigger);
		} catch (SchedulerException e) {
			logger.error("获取job失败", e);
			throw new ServiceException("获取job失败", e);
		}
		return job;
	 }
	 
	@Override
	public boolean addJob(ScheduleJobEntity job) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobDetail jobDetail = job.getJobDetail();
			if(StringUtils.isEmpty(job.getTriggerGroup()))
			{
				//使用默认组名称:DEFAULT
				job.setTriggerGroup(Scheduler.DEFAULT_GROUP);
			}
			// 存储job
			jobDetail.getJobDataMap().put("scheduleJob", job);
			if(!StringUtils.isEmpty(job.getTriggerName())){
				// 表达式调度构建器
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
					.cronSchedule(job.getCronExpression());
				// 按新的cronExpression表达式构建一个新的trigger
				CronTrigger trigger = newTrigger()
					.withIdentity(job.getTriggerName(),job.getTriggerGroup())
					.startAt(job.getStartDate()) // job开始日期
					.endAt(job.getEndDate())// job结束日期
					.withSchedule(scheduleBuilder).build();
				// 将job添加到quartz的scheduler容器
				scheduler.scheduleJob(jobDetail, trigger);
			}else
			{
				scheduler.addJob(jobDetail, true);
			}
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public boolean updateJobTrigger(ScheduleJobEntity job) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			// 获取触发器标识
			TriggerKey triggerKey = job.getTriggerKey();
			CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

			// Trigger已存在，更新相应的定时设置
			// 表达式调度构建器
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
					.cronSchedule(job.getCronExpression());

			// 按新的cronExpression表达式重新构建trigger
			trigger = trigger.getTriggerBuilder()
					.forJob(job.getJobKey())
					.withIdentity(triggerKey)
					.startAt(job.getStartDate()) // job开始日期
					.endAt(job.getEndDate())// job结束日期
					.withSchedule(scheduleBuilder).build();
			// 按新的trigger重新设置job执行
			scheduler.rescheduleJob(triggerKey, trigger);
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public boolean pauseJob(JobKey jobKey) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.pauseJob(jobKey);
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public boolean resumeJob(JobKey jobKey) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.resumeJob(jobKey);
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public boolean deleteJob(JobKey jobKey) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			return scheduler.deleteJob(jobKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}
	


	@Override
	public boolean executeJob(JobKey jobKey) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if(scheduler.checkExists(jobKey))
			{
				scheduler.triggerJob(jobKey);
			}
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		return Boolean.TRUE;
	}


	@Override
	public boolean addJobTrigger(ScheduleJobEntity job) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			// 表达式调度构建器
			CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
					.cronSchedule(job.getCronExpression());
			// 按新的cronExpression表达式构建一个新的trigger
			CronTrigger trigger = newTrigger()
					.forJob(job.getJobKey()) //绑定job
					.withIdentity(job.getTriggerKey())
					.startAt(job.getStartDate()) // job开始日期
					.endAt(job.getEndDate())// job结束日期
					.withSchedule(scheduleBuilder).build();
			// 将trigger添加到quartz的scheduler容器
			scheduler.scheduleJob(trigger);
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}
	
	@Override
	public boolean deleteJobTrigger(TriggerKey triggerKey) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			return scheduler.unscheduleJob(triggerKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public boolean pauseJobTrigger(TriggerKey triggerKey) {
		try
		{
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.pauseTrigger(triggerKey);
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	@Override
	public boolean resumeJobTrigger(TriggerKey triggerKey) {
		try
		{
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.resumeTrigger(triggerKey);
			return Boolean.TRUE;
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	/**
	 * 封装ScheduleJob对象
	 * 
	 * @param scheduleJob
	 * @param scheduler
	 * @param jobKey
	 * @param trigger
	 */
	private void wrapScheduleJob(ScheduleJobEntity scheduleJob,
			Scheduler scheduler, JobKey jobKey, Trigger trigger) {
		try {
			scheduleJob.setJobName(jobKey.getName());
			scheduleJob.setJobGroup(jobKey.getGroup());

			JobDetail jobDetail = scheduler.getJobDetail(jobKey);
			scheduleJob.setJobClass(jobDetail.getJobClass());
			scheduleJob.setJobDesc(jobDetail.getDescription());
			
			Trigger.TriggerState triggerState = scheduler.getTriggerState(trigger.getKey());
			scheduleJob.setTriggerStatus(triggerState.name());
			
			if (trigger instanceof CronTrigger) {
				CronTrigger cronTrigger = (CronTrigger) trigger;
				TriggerKey triggerKey = cronTrigger.getKey();
				scheduleJob.setTriggerName(triggerKey.getName());
				scheduleJob.setTriggerGroup(triggerKey.getGroup());
				scheduleJob.setNextFireTime(cronTrigger.getNextFireTime());
				scheduleJob.setCronExpression(cronTrigger.getCronExpression());
				scheduleJob.setStartDate(cronTrigger.getStartTime());
				scheduleJob.setEndDate(cronTrigger.getEndTime());
			}
		} catch (SchedulerException e) {
			logger.error("获取触发器状态失败", e);
			throw new ServiceException(e);
		}
	}
	
	@Override
	public boolean startAllJob() {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.start();
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		return Boolean.TRUE;
	}

	@Override
	public boolean shutdownAllJob() {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.shutdown(false);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		return Boolean.TRUE;
	}

	@Override
	public boolean interruptJob(JobKey jobKey) {
		try
		{
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.getSchedulerInstanceId();
			return scheduler.interrupt(jobKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
	}

	
}
