package com.webside.quartz.job;

import javax.mail.AuthenticationFailedException;

import jodd.mail.MailException;

import org.apache.log4j.Logger;
import org.quartz.InterruptableJob;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.quartz.JobKey;
import org.quartz.UnableToInterruptJobException;
import org.springframework.beans.factory.annotation.Autowired;

import com.webside.util.EmailUtil;

/**
 * 
 * @ClassName: QuartzJobFactory
 * @Description: 任务具体实现类:无状态、可在正在运行时停止 ;这里实现的是无状态job,即job可以并发
 *               如果要实现有状态的job，只需给job类加上注解 @DisallowConcurrentExecution @DisallowConcurrentExecution
 * @author gaogang
 * @date 2016年7月15日 上午11:04:50
 *
 */
public class EmailJob implements InterruptableJob {

	private static Logger logger = Logger.getLogger(EmailJob.class);

	@Autowired
	EmailUtil emailUtil;

	private boolean interrupted = false;

	private JobKey jobKey = null;

	public EmailJob() {

	}

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		jobKey = context.getJobDetail().getKey();
		if (context.isRecovering()) {
			// job is recovering
			logger.info("job 已恢复");
		} else {
			// job is start
			logger.info("job 开始执行");
			try {
				if (!interrupted) {
					emailUtil.send126Mail("wjggwm@126.com", "job test", "job test");
				} else {
					logger.info("用户停止了这个任务job: " + jobKey);
					return;
				}
			} catch (MailException e) {
				logger.error("发送邮件异常", e);
			} catch (AuthenticationFailedException e) {
				logger.error("email工具认证失败：", e);
			}
		}

		System.out.println("任务成功运行");

	}

	@Override
	public void interrupt() throws UnableToInterruptJobException {
		interrupted = true;
		logger.info("用户停止了这个任务job: " + jobKey);
	}

}
