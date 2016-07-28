package com.webside.quartz.job;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.webside.quartz.model.ScheduleJobEntity;

/**
 * 
 * @ClassName: InjectJob
 * @Description: QuartzJobBean:This allows to implement dependency-injected Quartz Jobs without a dependency on Spring base classes
 * @author wjggwm
 * @date 2016年7月18日 下午5:54:08
 *
 */
public class InjectJob extends QuartzJobBean {

	private static Logger logger = Logger.getLogger(InjectJob.class);
	

	@Override
	protected void executeInternal(JobExecutionContext context)
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
