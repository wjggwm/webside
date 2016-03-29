package com.webside.shiro.filter;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;

import com.webside.user.model.UserEntity;

public class RememberAuthenticationFilter extends FormAuthenticationFilter {

	@Override
	protected boolean isAccessAllowed(ServletRequest request,
			ServletResponse response, Object mappedValue) {
		Subject subject = getSubject(request, response);

		// 如果 isAuthenticated 为 false 证明不是登录过的，同时 isRememberd 为true
		// 证明是没登陆直接通过记住我功能进来的
		if (!subject.isAuthenticated() && subject.isRemembered()) {

			// 获取session看看是不是空的
			Session session = subject.getSession(true);

			// 随便拿session的一个属性来看session当前是否是空的，我用userSessionId，你们的项目可以自行发挥
			if (session.getAttribute("userSessionId") == null) {
				// 初始化
				UserEntity userEntity = (UserEntity) subject.getPrincipal();
				session.setAttribute("userSession", userEntity);
				session.setAttribute("userSessionId", userEntity.getId());
			}
		}

		// 这个方法本来只返回 subject.isAuthenticated() 现在我们加上 subject.isRemembered()
		// 让它同时也兼容remember这种情况
		return subject.isAuthenticated() || subject.isRemembered();
	}

}
