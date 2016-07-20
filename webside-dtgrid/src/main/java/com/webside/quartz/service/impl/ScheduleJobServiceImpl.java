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
import org.quartz.impl.StdScheduler;
import org.quartz.impl.matchers.GroupMatcher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;

import com.webside.base.baseservice.impl.AbstractService;
import com.webside.exception.ServiceException;
import com.webside.quartz.mapper.ScheduleJobMapper;
import com.webside.quartz.model.ScheduleJobEntity;
import com.webside.quartz.service.ScheduleJobService;

@Service("scheduleJobService")
public class ScheduleJobServiceImpl extends
		AbstractService<ScheduleJobEntity, Long> implements ScheduleJobService {

	private static Logger logger = Logger
			.getLogger(ScheduleJobServiceImpl.class);

	@Autowired
	private ScheduleJobMapper scheduleJobMapper;

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;

	@Autowired
	private StdScheduler scheduler;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(scheduleJobMapper);
	}

	@Override
	public List<ScheduleJobEntity> getPlanJobList() {
		List<ScheduleJobEntity> jobList = new ArrayList<>();
		try {
			GroupMatcher<JobKey> matcher = GroupMatcher.anyJobGroup();
			Set<JobKey> jobKeySet = scheduler.getJobKeys(matcher);
			for (JobKey jobKey : jobKeySet) {
				List<? extends Trigger> triggers = scheduler.getTriggersOfJob(jobKey);
				for (Trigger trigger : triggers) {
					ScheduleJobEntity scheduleJob = new ScheduleJobEntity();
					this.wrapScheduleJob(scheduleJob, scheduler, jobKey, trigger);
					jobList.add(scheduleJob);
				}
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
		try {
		List<JobExecutionContext> executingJobList = scheduler
				.getCurrentlyExecutingJobs();
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
	public boolean addJob(ScheduleJobEntity job) {
		int result = 0;
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if (null != job && !scheduler.checkExists(job.getJobKey()) && !scheduler.checkExists(job.getTriggerKey())) {
				// 把任务插入数据库
				result = insert(job);
				// 创建任务
				JobDetail jobDetail = job.getJobDetail();
				// 存储job
				jobDetail.getJobDataMap().put("scheduleJob", job);
				// 表达式调度构建器
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
						.cronSchedule(job.getCronExpression());
				// 按新的cronExpression表达式构建一个新的trigger
				CronTrigger trigger = newTrigger()
						.withIdentity(job.getJobName(),job.getJobGroup())
						.startAt(job.getStartDate()) // job开始日期
						.endAt(job.getEndDate())// job结束日期
						.withSchedule(scheduleBuilder).build();
				// 将job添加到quartz的scheduler容器
				scheduler.scheduleJob(jobDetail, trigger);
			}else
			{
				throw new ServiceException("Already exist job [" + job.getJobKey() + "] by triggerKey [" + job.getTriggerKey() + "] in Scheduler");
			}
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		if (result != 0) {
			return Boolean.TRUE;
		} else {
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean updateJob(ScheduleJobEntity job) {
		int result = 0;
		try {
			// 更新数据库中的任务
			result = update(job);
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			if (null != job) {
				// 获取触发器标识
				TriggerKey triggerKey = job.getTriggerKey();
				CronTrigger trigger = (CronTrigger) scheduler.getTrigger(triggerKey);

				// Trigger已存在，更新相应的定时设置
				// 表达式调度构建器
				CronScheduleBuilder scheduleBuilder = CronScheduleBuilder
						.cronSchedule(job.getCronExpression());

				// 按新的cronExpression表达式重新构建trigger
				trigger = trigger.getTriggerBuilder().withIdentity(triggerKey)
						.startAt(job.getStartDate()) // job开始日期
						.endAt(job.getEndDate())// job结束日期
						.withSchedule(scheduleBuilder).build();

				// 按新的trigger重新设置job执行
				scheduler.rescheduleJob(triggerKey, trigger);
			}
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		if (result != 0) {
			return Boolean.TRUE;
		} else {
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean pauseJob(ScheduleJobEntity job) {
		int result = 0;
		try {
			//同步更新job的状态,系统自有job无需更新
			if(job.getId() != null)
			{
				result = update(job);
			}else
			{
				result = 1;
			}
			
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			scheduler.pauseJob(jobKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		if (result != 0) {
			return Boolean.TRUE;
		} else {
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean resumeJob(ScheduleJobEntity job) {
		int result = 0;
		try {
			//同步更新job的状态,系统自有job无需更新
			if(job.getId() != null)
			{
				result = update(job);
			}else
			{
				result = 1;
			}
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			scheduler.resumeJob(jobKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		if (result != 0) {
			return Boolean.TRUE;
		} else {
			return Boolean.FALSE;
		}
	}

	@Override
	public boolean deleteJob(ScheduleJobEntity job) {
		int result = 0;
		try {
			//这里只修改job的状态，不做物理删除
			result = update(job);
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			scheduler.deleteJob(jobKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		if (result != 0) {
			return Boolean.TRUE;
		} else {
			return Boolean.FALSE;
		}
	}
	
	@Override
	public boolean deleteJobTrigger(ScheduleJobEntity job) {
		try {
			//考虑是否需要删除数据库中的job记录
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			scheduler.unscheduleJob(job.getTriggerKey());
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		return Boolean.TRUE;
	}

	@Override
	public boolean executeJob(ScheduleJobEntity job) {
		try {
			Scheduler scheduler = schedulerFactoryBean.getScheduler();
			JobKey jobKey = JobKey.jobKey(job.getJobName(), job.getJobGroup());
			scheduler.triggerJob(jobKey);
		} catch (SchedulerException e) {
			throw new ServiceException(e);
		}
		return Boolean.TRUE;
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
			scheduleJob.setJobStatus(triggerState.name());
			if (trigger instanceof CronTrigger) {
				CronTrigger cronTrigger = (CronTrigger) trigger;
				String cronExpression = cronTrigger.getCronExpression();
				scheduleJob.setCronExpression(cronExpression);
				scheduleJob.setStartDate(cronTrigger.getStartTime());
				scheduleJob.setEndDate(cronTrigger.getEndTime());
			}
		} catch (SchedulerException e) {
			logger.error("获取触发器状态失败", e);
			throw new ServiceException(e);
		}
	}


}
