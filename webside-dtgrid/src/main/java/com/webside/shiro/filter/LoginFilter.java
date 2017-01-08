package com.webside.shiro.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.AccessControlFilter;

import com.webside.shiro.ShiroAuthenticationManager;
import com.webside.user.model.UserEntity;

/**
 * 
 * @ClassName LoginFilter
 * @Description 判断登录
 *
 * @author wjggwm
 * @data 2016年12月12日 下午4:57:14
 */
public class LoginFilter extends AccessControlFilter {

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.web.filter.AccessControlFilter#isAccessAllowed(javax
	 * .servlet.ServletRequest, javax.servlet.ServletResponse, java.lang.Object)
	 */
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		
		UserEntity userEntity = ShiroAuthenticationManager.getUserEntity();

		if (null != userEntity || isLoginRequest(request, response)) {
			//避免rememberme或其他情况session中用户信息丢失的情况
			UserEntity userSession = (UserEntity)ShiroAuthenticationManager.getSessionAttribute(ShiroUtils.USERSESSION);
			if(null == userSession)
			{
				ShiroAuthenticationManager.setSessionAttribute(ShiroUtils.USERSESSION, userEntity);
			}
			return Boolean.TRUE;
		}
		
		return Boolean.FALSE;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.apache.shiro.web.filter.AccessControlFilter#onAccessDenied(javax.
	 * servlet.ServletRequest, javax.servlet.ServletResponse)
	 */
	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		if (ShiroUtils.isAjax(request)) {// ajax请求
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("status", "403");
			result.put("message", "用户未登陆,请重新登录!");
			result.put("url", ShiroUtils.LOGIN_URL);
			ShiroUtils.writeJson(response, result);
		}else
		{
			// 保存Request和Response 到登录后的链接
			saveRequestAndRedirectToLogin(request, response);
		}
		return Boolean.FALSE;
	}

}
