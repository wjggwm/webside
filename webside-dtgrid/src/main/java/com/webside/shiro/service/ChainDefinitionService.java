/**
 * 
 */
package com.webside.shiro.service;

import java.util.Map;

/**
 * @ClassName ShiroManager
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月11日 下午10:44:50
 */
public interface ChainDefinitionService {

	/**
	 * 
	 * @Description 从配置文件读取固定的权限信息
	 * @return
	 *
	 * @author wjggwm
	 * @data 2016年12月11日 下午10:47:34
	 */
	public Map<String, String> initChainDefinitionsMap();
	
	/**
	 * 
	 * @Description 从配置文件读取固定的权限信息
	 * @return
	 *
	 * @author wjggwm
	 * @data 2016年12月11日 下午10:47:34
	 */
	public String initFilterChainDefinitions();
	
	/**
	 * 
	 * @Description 重新设置权限
	 * <br/>在重新设置了权限等信息时调用该方法
	 * 
	 * @author wjggwm
	 * @data 2016年12月11日 下午10:47:39
	 */
	public void reloadFilterChainDefinitions();
	
}
