/**
 * 
 */
package com.webside.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;


/**
 * @ClassName InitializationListener
 * @Description 系统启动时执行初始化任务
 *
 * @author wjggwm
 * @data 2016年12月6日 下午4:21:41
 */
@Component
public class InitializationListener implements ApplicationListener<ContextRefreshedEvent> {

	private static final Logger logger = LoggerFactory.getLogger(InitializationListener.class);
	
	/* (non-Javadoc)
	 * @see org.springframework.context.ApplicationListener#onApplicationEvent(org.springframework.context.ApplicationEvent)
	 */
	@Override
	public void onApplicationEvent(ContextRefreshedEvent event) {
		if (null == event.getApplicationContext().getParent()) {
			
			/**
			 * 这里可以添加容器启动后需要执行的代码
			 */
			
			logger.info("系统初始化完成");
		}
	}

}
