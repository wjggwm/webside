package com.webside.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import com.webside.shiro.ShiroAuthenticationManager;
import com.webside.user.model.UserEntity;

public class RememberMeFilter extends FormAuthenticationFilter {
	
	@Override
	protected boolean onLoginSuccess(AuthenticationToken token,
			Subject subject, ServletRequest request, ServletResponse response)
			throws Exception {
		// 获取session看看是不是空的
		if(null == ShiroAuthenticationManager.getSessionAttribute(ShiroUtils.USERSESSION))
		{
			// 初始化
			UserEntity userEntity = (UserEntity) subject.getPrincipal();
			ShiroAuthenticationManager.setSessionAttribute(ShiroUtils.USERSESSION, userEntity);
		}
		return super.onLoginSuccess(token, subject, request, response);
	}

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) {
		Subject subject = getSubject(request, response);

		// 如果 isAuthenticated 为 false 证明不是登录过的，同时 isRememberd 为true 证明是没登陆直接通过记住我功能进来的
		if (!subject.isAuthenticated() && subject.isRemembered()) {
			// 获取session的USERSESSION属性来看session是不是空的
			if(null == ShiroAuthenticationManager.getSessionAttribute(ShiroUtils.USERSESSION))
			{
				// 初始化
				UserEntity userEntity = (UserEntity) subject.getPrincipal();
				ShiroAuthenticationManager.setSessionAttribute(ShiroUtils.USERSESSION, userEntity);
			}
		}

		// 这个方法本来只返回 subject.isAuthenticated() 现在我们加上 subject.isRemembered()
		// 让它同时也兼容remember这种情况
		return subject.isAuthenticated() || subject.isRemembered();
	}

}
