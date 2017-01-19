/**
 * 
 */
package com.webside.shiro.service.impl;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.annotation.Resource;

import jodd.props.Props;
import jodd.props.PropsEntry;

import org.apache.shiro.spring.web.ShiroFilterFactoryBean;
import org.apache.shiro.web.filter.mgt.DefaultFilterChainManager;
import org.apache.shiro.web.filter.mgt.PathMatchingFilterChainResolver;
import org.apache.shiro.web.servlet.AbstractShiroFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.webside.exception.SystemException;
import com.webside.shiro.service.ChainDefinitionService;

/**
 * @ClassName ShiroManagerImpl
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月11日 下午10:51:41
 */
public class ChainDefinitionServiceImpl implements ChainDefinitionService{
	
	private static final Logger logger = LoggerFactory.getLogger(ChainDefinitionServiceImpl.class);
	
	@Resource
	private ShiroFilterFactoryBean shiroFilterFactoryBean;
	
	/*
	 * 回车换行符
	 */
	private static final String CRLF = "\r\n";

	/* (non-Javadoc)
	 * @see com.webside.shiro.manager.ShiroService#initFilterChainDefinitions()
	 */
	@Override
	public String initFilterChainDefinitions() {
		StringBuffer chain = new StringBuffer();
		Map<String, String> chainMap = initChainDefinitionsMap();
		chainMap.forEach((key, value) -> {
			chain.append(key).append(" = ").append(value).append(CRLF);
		});
		return chain.toString();
	}

	/* (non-Javadoc)
	 * @see com.webside.shiro.manager.ShiroService#reInitFilterChainDefinitions()
	 */
	@Override
	public synchronized void reloadFilterChainDefinitions() {
		AbstractShiroFilter shiroFilter = null;
		try {
			shiroFilter = (AbstractShiroFilter) shiroFilterFactoryBean.getObject();

			PathMatchingFilterChainResolver filterChainResolver = (PathMatchingFilterChainResolver) shiroFilter
					.getFilterChainResolver();
			DefaultFilterChainManager manager = (DefaultFilterChainManager) filterChainResolver
					.getFilterChainManager();
	
			// 清空老的权限控制
			manager.getFilterChains().clear();
	
			shiroFilterFactoryBean.getFilterChainDefinitionMap().clear();
			shiroFilterFactoryBean.setFilterChainDefinitions(initFilterChainDefinitions());
			// 重新构建生成
			Map<String, String> chains = shiroFilterFactoryBean
					.getFilterChainDefinitionMap();
			for (Map.Entry<String, String> entry : chains.entrySet()) {
				String url = entry.getKey();
				String chainDefinition = entry.getValue().trim().replace(" ", "");
				manager.createChain(url, chainDefinition);
			}
		} catch (Exception e) {
			logger.error("getShiroFilter from shiroFilterFactoryBean error!", e);
			throw new SystemException("get ShiroFilter from shiroFilterFactoryBean error!");
		}
	}

	/* (non-Javadoc)
	 * @see com.webside.shiro.manager.ShiroService#initChainDefinitionsMap()
	 */
	@Override
	public Map<String, String> initChainDefinitionsMap() {
		Map<String, String> chainMap = new LinkedHashMap<String, String>();
		try {
			String shiroConfig = ChainDefinitionServiceImpl.class.getResource("/shiroAuth.props").toURI().getPath();
			Props props = new Props();
			props.load(new File(shiroConfig), "UTF-8");
			Iterator<PropsEntry>  baseAuth = props.entries().iterator();
			while(baseAuth.hasNext()){
				PropsEntry pe = baseAuth.next();
				chainMap.put(pe.getKey(), pe.getValue());
			}
		} catch (URISyntaxException e) {
			logger.error("获取文件shiro默认权限配置文件路径", e);
		} catch (IOException e) {
			logger.error("读取文件shiro默认权限配置文件异常:", e);
		}
		return chainMap;
	}

	
}
