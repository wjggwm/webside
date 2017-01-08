package com.webside.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;

/**
 * 
 * @ClassName: SpringContextUtil
 * @Description: 静态获取Bean
 * @author gaogang
 * @date 2016年7月12日 下午4:21:26
 *
 */
@Component
public class SpringContextUtil implements ApplicationContextAware {
	
	/*
	 * 当前IOC上下文环境
	 */
	private static ApplicationContext applicationContext; 

	/*
	 * 设置当前上下文环境，此方法由spring自动装配 (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.context.ApplicationContextAware#setApplicationContext
	 * (org.springframework.context.ApplicationContext)
	 */
	@Override
	public void setApplicationContext(ApplicationContext applicationContext)
			throws BeansException {
		SpringContextUtil.applicationContext = applicationContext;
	}

	public static ApplicationContext getApplicationContext() {
		return applicationContext;
	}

	/**
	 * 
	 * @Description 从spring容器获取bean实例</br>
	 * 	<font color='red'>注意，这里beanId是spring ioc中bean实例的名字,如果是注解扫描方式，没有特意指定名称，一般为类名，首字母小写(java遵从驼峰命名规则)，如果有指定名称，则为指定的bean名称</font>
	 * @param name	bean name,infact it's name in spring IOC
	 * @return	bean实例
	 *
	 * @author wjggwm
	 * @data 2016年8月25日 下午2:22:16
	 */
	public static Object getBean(String name) throws BeansException {
		return getApplicationContext().getBean(name);
	}

	/**
	 * 
	 * @Description 从spring容器获取bean实例</br>
	 * 	<font color='red'>注意，这里beanId是spring ioc中bean实例的名字,如果是注解扫描方式，没有特意指定名称，一般为类名，首字母小写(java遵从驼峰命名规则)，如果有指定名称，则为指定的bean名称</font>
	 * @param name	bean name,infact it's name in spring IOC
	 * @param requiredType	bean class类型
	 * @return	bean实例
	 * @throws BeansException
	 *
	 * @author wjggwm
	 * @data 2017年1月5日 下午5:58:27
	 */
	public static <T> T getBean(String name, Class<T> requiredType) throws BeansException {
		return getApplicationContext().getBean(name, requiredType);
	}


}