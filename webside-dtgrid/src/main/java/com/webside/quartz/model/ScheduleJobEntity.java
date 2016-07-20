package com.webside.quartz.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;
import org.quartz.Job;
import static org.quartz.JobBuilder.newJob;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.TriggerKey;

import com.webside.base.basemodel.BaseEntity;

@Alias("scheduleJobEntity")
public class ScheduleJobEntity extends BaseEntity {
	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * 任务名称
	 */
	private String jobName;
	/*
	 * 任务分组
	 */
	private String jobGroup;
	/*
	 * 任务状态：	 
	 * NONE:未知
	 * NORMAL:正常无任务
	 * PAUSED:暂停
	 * COMPLETE:完成
	 * ERROR:异常
	 * BLOCKED:等待运行,阻塞
	 * DELETE:删除
	 */
	private String jobStatus;
	/*
	 * 任务运行时间表达式
	 */
	private String cronExpression;
	/*
	 * 执行具体任务的任务类名
	 */
	private String jobClassName;
	/*
	 * 任务描述
	 */
	private String jobDesc;
	/*
	 * 开始时间
	 */
	private Date startDate;
	/*
	 * 结束时间
	 */
	private Date endDate;
	/*
	 * 创建时间
	 */
	private Date createTime;
	/*
	 * 更新时间
	 */
	private Date updateTime;
	/*
	 * 执行具体任务的任务类,必须继承自org.quartz.Job
	 */
	private transient Class<? extends Job> jobClass;

	private transient TriggerKey triggerKey;

	private transient JobDetail jobDetail;

	private transient JobKey jobKey;

	public ScheduleJobEntity() {
	}

	public ScheduleJobEntity(Long id, String jobName, String jobGroup,
			String jobStatus, String cronExpression, String jobDesc,
			Date startDate, Date endDate, String jobClassName, Date createTime,
			Date updateTime) {
		this.id = id;
		this.jobName = jobName;
		this.jobGroup = jobGroup;
		this.jobStatus = jobStatus;
		this.cronExpression = cronExpression;
		this.jobDesc = jobDesc;
		this.startDate = startDate;
		this.endDate = endDate;
		this.jobClassName = jobClassName;
		this.createTime = createTime;
		this.updateTime = updateTime;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobGroup() {
		return jobGroup;
	}

	public void setJobGroup(String jobGroup) {
		this.jobGroup = jobGroup;
	}

	public String getJobStatus() {
		return jobStatus;
	}

	public void setJobStatus(String jobStatus) {
		this.jobStatus = jobStatus;
	}

	public String getCronExpression() {
		return cronExpression;
	}

	public void setCronExpression(String cronExpression) {
		this.cronExpression = cronExpression;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getJobClassName() {
		return jobClassName;
	}

	public void setJobClassName(String jobClassName) {
		this.jobClassName = jobClassName;
	}

	public String getJobDesc() {
		return jobDesc;
	}

	public void setJobDesc(String jobDesc) {
		this.jobDesc = jobDesc;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	/*
	 * 根据jobClassName动态初始化JobClass
	 */
	public Class<? extends Job> getJobClass() {
		try {
			if(jobClass == null)
			{
				jobClass = Class.forName(getJobClassName()).asSubclass(Job.class);
			}
			} catch (ClassNotFoundException e) {
		}
		return jobClass;
	}

	public void setJobClass(Class<? extends Job> jobClass)
	{
		this.jobClass = jobClass;
		this.jobClassName = jobClass.getName();
	}
	
	/**
	 * 
	 * @Title: getTriggerKey
	 * @Description: 生成triggerKey
	 * @return TriggerKey
	 * @throws
	 */
	public TriggerKey getTriggerKey() {
		if (triggerKey == null) {
			triggerKey = TriggerKey.triggerKey(getJobName(), getJobGroup());
		}
		return triggerKey;
	}

	/**
	 * 
	 * @Title: getJobDetail
	 * @Description: 生成jobDetail
	 * @return JobDetail
	 * @throws
	 */
	public JobDetail getJobDetail() {
		if (jobDetail == null) {
			jobDetail = newJob(getJobClass())
					.withIdentity(getJobName(), getJobGroup())
					.withDescription(getJobDesc())
					.storeDurably(true).build();
		}
		return jobDetail;
	}

	public JobKey getJobKey() {
		if(jobKey == null)
		{
			jobKey = JobKey.jobKey(getJobName(), getJobGroup());
		}
		return jobKey;
	}

}
