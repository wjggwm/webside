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
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

	private static final Logger logger = LoggerFactory.getLogger(KickoutSessionFilter.class);
	
	/*
	 * 强制退出后跳转地址
	 */
    private String kickoutUrl; 
    /*
     * 强制退出之前登录的/之后登录的用户,默认退出之前登录的用户
     */
    private boolean kickoutAfter = false;
    /*
     * 同一个帐号最大会话数,默认1
     */
    private int maxSession = 1; 
   /*
    * session获取
    */
    @Autowired
  	private ShiroSessionRepository shiroSessionRepository;
  	
    @Autowired
  	private RedisManager redisManager;
    /*
     * 在线用户
     */
  	final static String ONLINE_USER = KickoutSessionFilter.class.getCanonicalName()+ "_online_user";
  	/*
  	 * 踢出状态，true标示踢出
  	 */
  	final static String KICKOUT_STATUS = KickoutSessionFilter.class.getCanonicalName()+ "_kickout_status";

    public void setKickoutUrl(String kickoutUrl) {
        this.kickoutUrl = kickoutUrl;
    }

    public void setKickoutAfter(boolean kickoutAfter) {
        this.kickoutAfter = kickoutAfter;
    }

    public void setMaxSession(int maxSession) {
        this.maxSession = maxSession;
    }
    
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
		String url = httpRequest.getRequestURI();
		Subject subject = getSubject(request, response);
		//如果是相关目录 or 如果没有登录 就直接return true
		if(url.startsWith("/api/") || (!subject.isAuthenticated() && !subject.isRemembered())){
			return Boolean.TRUE;
		}
		Session session = subject.getSession();
		Serializable sessionId = session.getId();
		/**
		 * 判断是否已经踢出
		 * 1.如果是Ajax 访问，那么给予json返回值提示。
		 * 2.如果是普通请求，直接跳转到登录页
		 */
		Boolean marker = (Boolean)session.getAttribute(KICKOUT_STATUS);
		if (null != marker && marker ) {
			Map<String, Object> result = new HashMap<String, Object>();
			//判断是不是Ajax请求
			if (ShiroFilterUtils.isAjax(request) ) {
				if(logger.isDebugEnabled())
				{
					logger.debug( "当前用户已经在其他地方登录");
				}
				result.put("status", "403");
				result.put("message", "您已经被踢出，请重新登录！");
				result.put("url", ShiroFilterUtils.LOGIN_URL);
				ShiroFilterUtils.writeJson(response, result);
			}
			return  Boolean.FALSE;
		}
		
		
		//从缓存获取用户-Session信息 <UserId,SessionId>
		LinkedHashMap<Long, Serializable> infoMap = redisManager.get(ONLINE_USER, LinkedHashMap.class);
		//如果不存在，创建一个新的
		infoMap = null == infoMap ? new LinkedHashMap<Long, Serializable>() : infoMap;
		
		//获取tokenId
		Long userId = ShiroAuthenticationManager.getUserId();
		
		//如果已经包含当前Session，并且是同一个用户，跳过。
		if(infoMap.containsKey(userId) && infoMap.containsValue(sessionId)){
			//更新存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
			redisManager.setex(ONLINE_USER, infoMap, 3600);
			return Boolean.TRUE;
		}
		//如果用户相同，Session不相同，那么就要处理了
		/**
		 * 如果用户Id相同,Session不相同
		 * 1.获取到原来的session，并且标记为踢出。
		 * 2.继续走
		 */
		if(infoMap.containsKey(userId) && !infoMap.containsValue(sessionId)){
			Serializable oldSessionId = infoMap.get(userId);
			Session oldSession = shiroSessionRepository.getSession(oldSessionId);
			if(null != oldSession){
				//标记session已经踢出
				oldSession.setAttribute(KICKOUT_STATUS, Boolean.TRUE);
				shiroSessionRepository.saveSession(oldSession);//更新session
				if(logger.isDebugEnabled())
					logger.debug("kickout old session success,oldId[%s]",oldSessionId);
			}else{
				shiroSessionRepository.deleteSession(oldSessionId);
				infoMap.remove(userId);
				//存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
				redisManager.setex(ONLINE_USER, infoMap, 3600);
			}
			return  Boolean.TRUE;
		}
		
		if(!infoMap.containsKey(userId) && !infoMap.containsValue(sessionId)){
			infoMap.put(userId, sessionId);
			//存储到缓存1个小时（这个时间最好和session的有效期一致或者大于session的有效期）
			redisManager.setex(ONLINE_USER, infoMap, 3600);
		}
		return Boolean.TRUE;
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
    	//先退出
		Subject subject = getSubject(request, response);
		subject.logout();
		WebUtils.getSavedRequest(request);
		//再重定向
		WebUtils.issueRedirect(request, response,kickoutUrl);
		return false;
    }
}
