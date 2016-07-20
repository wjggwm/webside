package com.webside.quartz.job;

import org.apache.log4j.Logger;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.webside.quartz.model.ScheduleJobEntity;

/**
 * 
 * @ClassName: MyJob
 * @Description: 可动态添加的job
 * @author gaogang
 * @date 2016年7月18日 下午5:54:08
 *
 */
public class MyJob implements Job {

	private static Logger logger = Logger.getLogger(MyJob.class);
	
	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
		logger.info("任务执行了...");
		/*
		 * JobExecutionContext 将会合并JobDetail与Trigger的JobDataMap，如果其中属性名相同，后者将覆盖前者。
		 * 可以使用JobExecutionContext.getMergedJobDataMap()方法来获取合并后的JobDataMap
		 */
		ScheduleJobEntity scheduleJob = (ScheduleJobEntity) context.getMergedJobDataMap().get("scheduleJob");
		
		System.out.println("任务名称 = [" + scheduleJob.getJobName() + "]");
	}

}
