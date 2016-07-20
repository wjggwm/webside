package com.webside.quartz.job;

import javax.mail.AuthenticationFailedException;

import jodd.mail.MailException;

import org.apache.log4j.Logger;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.QuartzJobBean;

import com.webside.util.EmailUtil;

/**
 * 
 * @ClassName: QuartzJobFactory
 * @Description: 任务具体实现类
 * 	这里实现的是无状态job，如果要实现有状态的job，只需给job类加上注解 @DisallowConcurrentExecution @DisallowConcurrentExecution
 * @author gaogang
 * @date 2016年7月15日 上午11:04:50
 *
 */
public class EmailJob extends QuartzJobBean {
	
	private static Logger logger  = Logger.getLogger(EmailJob.class);
	
	@Autowired
	EmailUtil emailUtil;

	public EmailJob()
	{
		
	}
	
	@Override
	protected void executeInternal(JobExecutionContext context)
			throws JobExecutionException {
		if(context.isRecovering())
		 {
			 //job is recovering
			 logger.info("job 已恢复");
		 }else
		 {
			 //job is start
			 logger.info("job 开始执行");
			 try {
				emailUtil.send126Mail("wjggwm@126.com", "job test", "job test");
			} catch (MailException e) {
				logger.error("发送邮件异常",e);
			} catch (AuthenticationFailedException e) {
				logger.error("email工具认证失败：",e);
			}
		 }
		 
		System.out.println("任务成功运行");
	}
	
}
