package com.webside.quartz.service;

import java.util.List;
import java.util.Map;

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
     * @Title: addJob
     * @Description: 动态添加job:1、添加job到数据库;2、注册job到schedule
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean addJob(ScheduleJobEntity job);
    
    /**
     * 
     * @Title: updateJob
     * @Description: 更新job:1、更新job到数据库;2、更新job到schedule
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean updateJob(ScheduleJobEntity job);
    
    /**
     * 
     * @Title: pauseJob
     * @Description: 暂停job:1、更新job状态到数据库;2、更新job状态到schedule
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean pauseJob(ScheduleJobEntity job);
    /**
     * 
     * @Title: resumeJob
     * @Description: 恢复job:1、更新job状态到数据库;2、更新job状态到schedule
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean resumeJob(ScheduleJobEntity job);
    /**
     * 
     * @Title: deleteJob
     * @Description: 删除job:1、从数据库删除job;2、从schedule中删除job
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean deleteJob(ScheduleJobEntity job);
    /**
     * 
     * @Title: deleteJobTrigger
     * @Description: 删除job触发器:1、从数据库删除job的触发器(这里不好判断从schedule中删除job触发器时是否也删除了该schedule,所以该方法咱不使用);2、从schedule中删除job触发器
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean deleteJobTrigger(ScheduleJobEntity job);
    /**
     * 
     * @Title: executeJob
     * @Description: 执行job
     * @param job
     * @return	boolean
     * @throws
     */
    public boolean executeJob(ScheduleJobEntity job);
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
