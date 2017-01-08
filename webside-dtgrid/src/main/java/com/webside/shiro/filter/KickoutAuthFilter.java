package com.webside.shiro.filter;

import java.util.HashMap;
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

import com.webside.shiro.session.SessionStatus;
import com.webside.user.service.impl.UserSessionServiceImpl;



/**
 * 
 * @ClassName SimpleAuthFilter
 * @Description 判断用户是否踢出
 *
 * @author wjggwm
 * @data 2016年12月13日 下午12:46:55
 */
public class KickoutAuthFilter extends AccessControlFilter {
	
	private static final Logger logger = LoggerFactory.getLogger(KickoutAuthFilter.class);
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {

		HttpServletRequest httpRequest = ((HttpServletRequest)request);
		String url = httpRequest.getRequestURI();
		if(url.startsWith(ShiroUtils.OPENAPI)){
			return Boolean.TRUE;
		}
		Subject subject = getSubject(request, response);
		Session session = subject.getSession();
		SessionStatus sessionStatus = (SessionStatus) session.getAttribute(UserSessionServiceImpl.SESSION_STATUS);
		if (null != sessionStatus && !sessionStatus.isOnline()) {
			return  Boolean.FALSE;
		}
		return Boolean.TRUE;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		//先退出
		Subject subject = getSubject(request, response);
		subject.logout();
		/**
		 * shiro保存上次请求地址：
		 * WebUtils.getSavedRequest(request);
		 * 然后在需要使用的地方：String url = WebUtils.getSavedRequest(request).getRequestUrl();
		 */
		//判断是不是Ajax请求
		if (ShiroUtils.isAjax(request) ) {
			Map<String, Object> result = new HashMap<String, Object>();
			logger.debug("当前用户已经被踢出，并且是Ajax请求！");
			result.put("status", "403");
			result.put("message", "您已经被踢出，请重新登录！");
			result.put("url", ShiroUtils.LOGIN_URL);
			ShiroUtils.writeJson(response, result);
		}else
		{
			WebUtils.getSavedRequest(request);
			//再重定向
			WebUtils.issueRedirect(request, response, ShiroUtils.LOGIN_URL);
		}
		return false;
	}

}
