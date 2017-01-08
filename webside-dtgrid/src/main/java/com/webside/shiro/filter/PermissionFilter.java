package com.webside.shiro.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 
 * @ClassName PermissionFilter
 * @Description 权限校验 Filter
 *
 * @author wjggwm
 * @data 2016年12月17日 上午12:48:01
 */
public class PermissionFilter extends AccessControlFilter {
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		
		//先判断带参数的权限判断
		Subject subject = getSubject(request, response);
		if(null != mappedValue){
			String[] arra = (String[])mappedValue;
			for (String permission : arra) {
				if(subject.isPermitted(permission)){
					return Boolean.TRUE;
				}
			}
		}
		//取到请求的uri ，进行权限判断
		HttpServletRequest httpRequest = (HttpServletRequest)request;
		
		String uri = httpRequest.getRequestURI();
		String contextPath = httpRequest.getContextPath();
		if(uri != null && uri.startsWith(contextPath))
		{
			uri = uri.replace(contextPath, "");
		}
		if(uri.equals("/")) //http://localhost:8070/webside/  处理这样的url
			return Boolean.TRUE;
		if(subject.isPermitted(uri))
			return Boolean.TRUE;
		return Boolean.FALSE;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
		
			Subject subject = getSubject(request, response);  
	        if (null == subject.getPrincipal()) {//表示没有登录，重定向到登录页面  
	            saveRequest(request);
	            WebUtils.issueRedirect(request, response, ShiroUtils.LOGIN_URL);  
	        } else {
	    		if(ShiroUtils.isAjax(request)){
	    			Map<String, Object> result = new HashMap<String, Object>();
	    			result.put("status", "401");
	    			result.put("message", "当前用户没有权限");
	    			result.put("url", ShiroUtils.UNAUTHORIZED);
	    			ShiroUtils.writeJson(response, result);
	    		}else
	    		{
	    			if (StringUtils.hasText(ShiroUtils.UNAUTHORIZED)) {//如果有未授权页面跳转过去  
		                WebUtils.issueRedirect(request, response, ShiroUtils.UNAUTHORIZED);  
		            } else {//否则返回401未授权状态码  
		                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);  
		            } 
	    		}
	        }  
		return Boolean.FALSE;
	}

}
