package com.webside.shiro.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 
 * @ClassName RoleFilter
 * @Description 角色判断校验
 *
 * @author wjggwm
 * @data 2016年12月17日 上午12:46:48
 */
public class RoleFilter extends AccessControlFilter {

	
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		String[] arra = (String[])mappedValue;
		Subject subject = getSubject(request, response);
		for (String role : arra) {
			if(subject.hasRole(role)){
				return true;
			}
		}
		return false;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		
			Subject subject = getSubject(request, response);  
	        if (subject.getPrincipal() == null) {//表示没有登录，重定向到登录页面  
	            saveRequest(request);  
	            WebUtils.issueRedirect(request, response, ShiroFilterUtils.LOGIN_URL);  
	        } else {  
	        	if(ShiroFilterUtils.isAjax(request)){
	    			Map<String, Object> result = new HashMap<String, Object>();
	    			result.put("status", "401");
	    			result.put("message", "当前用户没有权限");
	    			result.put("url", ShiroFilterUtils.UNAUTHORIZED);
	    			ShiroFilterUtils.writeJson(response, result);
	    		}else
	    		{
	    			if (StringUtils.hasText(ShiroFilterUtils.UNAUTHORIZED)) {//如果有未授权页面跳转过去  
		                WebUtils.issueRedirect(request, response, ShiroFilterUtils.UNAUTHORIZED);  
		            } else {//否则返回401未授权状态码  
		                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);  
		            } 
	    		}
	        }  
		return false;
	}

}
