package com.webside.shiro.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.util.StringUtils;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;

/**
 * 
 * @ClassName URLFilter
 * @Description 校验用户是否直接通过浏览器输入url进行操作
 *
 * @author wjggwm
 * @data 2016年12月17日 上午12:48:01
 */
public class URLFilter extends AccessControlFilter {
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {

		HttpServletRequest httpRequest = (HttpServletRequest)request;
		String uri = httpRequest.getRequestURI();
		String contextPath = httpRequest.getContextPath();
		if(null != contextPath)
		{
			uri = uri.replace(contextPath, "");
			if(uri.equals("/") || uri.equals("/index.html") || uri.equals("login.html") || uri.equals("signin.html"))
			{
				return Boolean.TRUE;
			}
		}
		String uriParam = httpRequest.getParameter("baseUri");
		if(uriParam != null)
		{
			uriParam = uriParam.replace(contextPath, "");
			if(uriParam.equals("/") || uriParam.equals("/index.html"))
				return Boolean.TRUE;
		}
		
		return Boolean.FALSE;
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request,
			ServletResponse response) throws Exception {
    		if(ShiroUtils.isAjax(request)){
    			Map<String, Object> result = new HashMap<String, Object>();
    			result.put("status", "401");
    			result.put("message", "非法操作");
    			result.put("url", ShiroUtils.INDEX_URL);
    			ShiroUtils.writeJson(response, result);
    		}else
    		{
    			if (StringUtils.hasText(ShiroUtils.INDEX_URL)) {//如果有未授权页面跳转过去  
	                WebUtils.issueRedirect(request, response, ShiroUtils.INDEX_URL);
	            } else {//否则返回401未授权状态码
	                WebUtils.toHttp(response).sendError(HttpServletResponse.SC_UNAUTHORIZED);  
	            } 
    		}
		return Boolean.FALSE;
	}

}
