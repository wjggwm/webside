package com.webside.quartz.job;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

/**
 * 
 * @ClassName: SimpleJob
 * @Description: 任务具体实现类:普通job
 * @author wjggwm
 * @date 2016年7月28日 下午4:38:09
 *
 */
public class SimpleJob implements Job{

	@Override
	public void execute(JobExecutionContext context)
			throws JobExecutionException {
			
	}

}
