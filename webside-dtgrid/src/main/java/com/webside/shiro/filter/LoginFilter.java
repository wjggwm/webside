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
		UserEntity user = ShiroAuthenticationManager.getUserEntity();

		if (null != user || isLoginRequest(request, response)) {
			return Boolean.TRUE;
		}
		if (ShiroFilterUtils.isAjax(request)) {// ajax请求
			Map<String, Object> result = new HashMap<String, Object>();
			result.put("status", "403");
			result.put("success", false);
			result.put("message", "当前用户没有登录");
			ShiroFilterUtils.writeJson(response, result);
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
		// 保存Request和Response 到登录后的链接
		saveRequestAndRedirectToLogin(request, response);
		return Boolean.FALSE;
	}

}
