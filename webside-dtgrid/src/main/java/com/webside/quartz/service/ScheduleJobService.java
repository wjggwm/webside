package com.webside.quartz.service;

import java.util.List;
import java.util.Map;

import org.quartz.JobKey;
import org.quartz.TriggerKey;

import com.webside.quartz.model.ScheduleJobEntity;

public interface ScheduleJobService {

	public List<ScheduleJobEntity> queryListByPage(Map<String, Object> parameter);

	public int insert(ScheduleJobEntity job);
	
	public ScheduleJobEntity findById(Long id);

	public int update(ScheduleJobEntity job);
    
    public int deleteById(Long id);
    
    /**
     * 
     * @Title: getPlanJobList
     * @Description: 获取计划中的任务列表
     * @return	List<ScheduleJobEntity>
     * @throws
     */
    public List<ScheduleJobEntity> getPlanJobList();
    
    /**
     * 
     * @Title: getRunningJobList
     * @Description: 获取正在运行的任务列表
     * @return	List<ScheduleJobEntity>
     * @throws
     */
    public List<ScheduleJobEntity> getRunningJobList();
    /**
     * 
     * @Title: getTriggers
     * @Description: 根据job获取和该job绑定的trigger列表信息
     * @param job
     * @return	List<Trigger>
     * @throws
     */
    public List<ScheduleJobEntity> getTriggers(ScheduleJobEntity job);
    /**
     * 
     * @Title: getScheduleJobEntity
     * @Description: 根据job从scheduler中获取ScheduleJobEntity信息
     * @param job
     * @return	ScheduleJobEntity
     * @throws
     */
    public ScheduleJobEntity getScheduleJobEntity(ScheduleJobEntity job);
    /**
     * 
     * @Title: addJob
     * @Description: 动态添加job
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean addJob(ScheduleJobEntity job);
    /**
     * 
     * @Title: addJobTrigger
     * @Description: 动态添加trigger
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean addJobTrigger(ScheduleJobEntity job);
    /**
     * 
     * @Title: updateJobTrigger
     * @Description: 更新triggerr
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean updateJobTrigger(ScheduleJobEntity job);
    /**
     * 
     * @Title: pauseJob
     * @Description: 暂停job
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean pauseJob(JobKey jobKey);
    /**
     * 
     * @Title: pauseJobTrigger
     * @Description: 暂停trigger
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean pauseJobTrigger(TriggerKey triggerKey);
    /**
     * 
     * @Title: resumeJob
     * @Description: 恢复job
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean resumeJob(JobKey jobKey);
    /**
     * 
     * @Title: resumeJobTrigger
     * @Description: 恢复trigger
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean resumeJobTrigger(TriggerKey triggerKey);
    /**
     * 
     * @Title: deleteJob
     * @Description: 删除job,同时会删除和job相关的trigger
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean deleteJob(JobKey jobKey);
    /**
     * 
     * @Title: deleteJobTrigger
     * @Description: 删除job触发器
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean deleteJobTrigger(TriggerKey triggerKey);
    /**
     * 
     * @Title: executeJob
     * @Description: 执行job
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean executeJob(JobKey jobKey);
    
    public boolean interruptJob(JobKey jobKey);
    /**
     * 
     * @Title: startAllJob
     * @Description: 开始所有job
     * @return	boolean
     * @throws
     */
    public boolean startAllJob();
    /**
     * 
     * @Title: shutdownAllJob
     * @Description: 暂停所有job
     * @return	boolean
     * @throws
     */
    public boolean shutdownAllJob();
}
