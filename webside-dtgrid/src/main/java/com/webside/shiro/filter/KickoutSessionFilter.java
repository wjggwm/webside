package com.webside.shiro.filter;

import java.io.Serializable;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.beans.factory.annotation.Autowired;

import com.webside.redis.RedisManager;
import com.webside.shiro.ShiroAuthenticationManager;
import com.webside.shiro.session.ShiroSessionRepository;

/**
 * 当同一用户在多个地方登录时，如果超出最大会话数，则最早登录的用户会被强制退出
 * @author wjggwm
 *
 */
public class KickoutSessionFilter extends AccessControlFilter {

	
   /*
    * session获取
    */
    @Autowired
  	private ShiroSessionRepository shiroSessionRepository;
  	
    @Autowired
  	private RedisManager redisManager;

    public void setShiroSessionRepository(
			ShiroSessionRepository shiroSessionRepository) {
		this.shiroSessionRepository = shiroSessionRepository;
	}

	public void setRedisManager(RedisManager redisManager) {
		this.redisManager = redisManager;
	}

	@SuppressWarnings("unchecked")
	@Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) throws Exception {
    	HttpServletRequest httpRequest = ((HttpServletRequest)request);
		Subject subject = getSubject(request, response);
		//取到请求的uri ，进行权限判断
		String url = httpRequest.getRequestURI();
		String contextPath = httpRequest.getContextPath();
		if(url != null && url.startsWith(contextPath))
		{
			url = url.replace(contextPath, "");
		}
		//如果是相关目录 or 没有登录 就直接return true
		if(null != url && url.startsWith("/openapi/") || (!subject.isAuthenticated() && !subject.isRemembered())){
			return Boolean.TRUE;
		}
		Session session = subject.getSession();
		Serializable sessionId = session.getId();
		/**
		 * 判断是否被踢出
		 * 1.如果是ajax请求,则返回json提示信息
		 * 2.如果是普通请求，直接跳转到登录页
		 */
		Boolean marker = (Boolean)session.getAttribute(ShiroUtils.KICKOUT_STATUS);
		if (null != marker && marker ) {
			Map<String, Object> result = new HashMap<String, Object>();
			//判断是不是Ajax请求
			if (ShiroUtils.isAjax(request) ) {
				result.put("status", "403");
				result.put("message", "您已经被踢出，请重新登录！");
				result.put("url", ShiroUtils.LOGIN_URL);
				ShiroUtils.writeJson(response, result);
			}else
			{
				WebUtils.getSavedRequest(request);
				//再重定向到登录页面
				WebUtils.issueRedirect(request, response, ShiroUtils.LOGIN_URL);
			}
			return Boolean.FALSE;
		}
		
		//从缓存获取用户-Session信息 <UserId,SessionId>
		LinkedHashMap<Long, Serializable> infoMap = redisManager.get(ShiroUtils.ONLINE_USER, LinkedHashMap.class);
		//如果不存在，创建一个新的
		infoMap = null == infoMap ? new LinkedHashMap<Long, Serializable>() : infoMap;
		
		//获取tokenId
		Long userId = ShiroAuthenticationManager.getUserId();
		
		//如果已经包含当前Session，并且是同一个用户则跳过
		if(infoMap.containsKey(userId) && infoMap.containsValue(sessionId)){
			//缓存30分钟（这个时间最好和session的有效期一致或者大于session的有效期）
			redisManager.setex(ShiroUtils.ONLINE_USER, infoMap, 1800);
			return Boolean.TRUE;
		}
		
		/**
		 * 如果用户相同，session不相同，则该用户在其他地方登录
		 * 1、获取到原来的session，并且标记为踢出
		 * 2、记录新的session
		 */
		if(infoMap.containsKey(userId) && !infoMap.containsValue(sessionId)){
			Serializable oldSessionId = infoMap.get(userId);
			Session oldSession = shiroSessionRepository.getSession(oldSessionId);
			if(null != oldSession){
				//标记session已经踢出
				oldSession.setAttribute(ShiroUtils.KICKOUT_STATUS, Boolean.TRUE);
				shiroSessionRepository.saveSession(oldSession);//更新session
			}else{
				shiroSessionRepository.deleteSession(oldSessionId);
				infoMap.remove(userId);
				//缓存30分钟（这个时间最好和session的有效期一致或者大于session的有效期）
				redisManager.setex(ShiroUtils.ONLINE_USER, infoMap, 1800);
			}
			return  Boolean.TRUE;
		}
		
		if(!infoMap.containsKey(userId) && !infoMap.containsValue(sessionId)){
			infoMap.put(userId, sessionId);
			//存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
			redisManager.setex(ShiroUtils.ONLINE_USER, infoMap, 1800);
		}
		return Boolean.TRUE;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
    	//退出
		Subject subject = getSubject(request, response);
		subject.logout();
		return  Boolean.FALSE;
    }
}
