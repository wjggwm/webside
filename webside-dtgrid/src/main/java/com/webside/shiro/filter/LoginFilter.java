package com.webside.shiro.filter;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.log4j.Logger;
import org.apache.shiro.web.filter.AccessControlFilter;

import com.webside.shiro.ShiroAuthenticationManager;
import com.webside.user.model.UserEntity;


/**
 * 
 * <p>Description: 判断登录</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年7月12日 上午11:34:40
 */
public class LoginFilter  extends AccessControlFilter {
	
	private Logger logger = Logger.getLogger(LoginFilter.class);
	
	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) throws Exception {
		
		UserEntity user = ShiroAuthenticationManager.getUserEntity();
		
		if(null != user || isLoginRequest(request, response)){// && isEnabled()
            return Boolean.TRUE;
        } 
		if (ShiroFilterUtils.isAjax(request)) {// ajax请求
			Map<String,String> resultMap = new HashMap<String, String>();
			logger.debug("当前用户没有登录，并且是Ajax请求！");
			resultMap.put("login_status", "300");
			resultMap.put("message", "\u5F53\u524D\u7528\u6237\u6CA1\u6709\u767B\u5F55\uFF01");//当前用户没有登录！
			ShiroFilterUtils.out(response, resultMap);
		}
		return Boolean.FALSE ;
            
	}

	@Override
	protected boolean onAccessDenied(ServletRequest request, ServletResponse response)
			throws Exception {
		//保存Request和Response 到登录后的链接
		saveRequestAndRedirectToLogin(request, response);
		return Boolean.FALSE ;
	}
	

}
