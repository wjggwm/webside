package com.webside.quartz.job.stateful;

import org.quartz.DisallowConcurrentExecution;
import org.quartz.PersistJobDataAfterExecution;

import com.webside.quartz.job.EmailJob;

/**
 * 
 * @ClassName: QuartzStatefulJob
 * @Description: 
 * 这里实现的是有状态job,即job不可并发,只能串行
 * 实现方式:
 * 1、添加注解@DisallowConcurrentExecution
 * 2、继承StatefulJob
 * This job has the same functionality of SimpleRecoveryJob except 
 * that this job implements is 'stateful', in that it will have it's data 
 * (JobDataMap) automatically re-persisted after each execution, and only one
 * instance of the JobDetail can be executed at a time.
 * @DisallowConcurrentExecution，如果使用该注解，那么同一时间将只有一个Job实例被执行。如，ReportJob有个实例为ReportForJoe，那么同一时间只有一个ReportForJoe被执行。而ReportForMike等都可以执行
 * @PersistJobDataAfterExecution，如果使用该注解，在Job被执行结束后，将会更新JobDataMap，这样下次Job执行后就会使用新的值而不是初始值。
 * 如果使用@PersistJobDataAfterExecution注解，推荐也使用@DisallowConcurrentExecution注解，这是为了避免并发问题导致数据紊乱。
 * @author gaogang
 * @date 2016年7月15日 下午3:11:19
 *
 */
@PersistJobDataAfterExecution
@DisallowConcurrentExecution
public class EmailStatefulJob extends EmailJob{

	public EmailStatefulJob()
	{
		super();
	}
}
