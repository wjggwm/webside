package com.webside.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;

import com.webside.user.model.UserEntity;

/**
 * 
 * @ClassName: ShiroManager
 * @Description: shiro 认证信息操作工具类
 * @author gaogang
 * @date 2016年7月12日 下午4:31:10
 *
 */
public class ShiroAuthenticationManager {

	/**
	 * 获取shiro的session
	 * 
	 * @return
	 */
	public static Session getSession() {
		return SecurityUtils.getSubject().getSession();
	}

	/**
	 * 获取shiro Subject
	 * 
	 * @return
	 */
	public static Subject getSubject() {
		return SecurityUtils.getSubject();
	}

	/**
	 * 获取用户
	 * 
	 * @return
	 */
	public static UserEntity getUserEntity() {
		return (UserEntity) SecurityUtils.getSubject().getPrincipal();
	}

	/**
	 * 获取用户id
	 * 
	 * @return
	 */
	public static Long getUserId() {
		return getUserEntity() == null ? null : getUserEntity().getId();
	}
	
	/**
	 * 获取用户id
	 * 
	 * @return
	 */
	public static String getUserAccountName() {
		return getUserEntity() == null ? null : getUserEntity().getAccountName();
	}

	/**
	 * 把值放入到当前登录用户的Session里
	 * 
	 * @param key
	 * @param value
	 */
	public static void setSessionAttribute(Object key, Object value) {
		getSession().setAttribute(key, value);
	}

	/**
	 * 从当前登录用户的Session里取值
	 * 
	 * @param key
	 * @return
	 */
	public static Object getSessionAttribute(Object key) {
		return getSession().getAttribute(key);
	}

	/**
	 * 判断是否登录
	 * 
	 * @return
	 */
	public static boolean isLogin() {
		return null != SecurityUtils.getSubject().getPrincipal();
	}

	/**
	 * 退出登录
	 */
	public static void logout() {
		SecurityUtils.getSubject().logout();
	}

	/**
	 * 获取验证码，获取后删除
	 * 
	 * @return
	 */
	public static String getKaptcha(String key) {
		String kaptcha = getSessionAttribute(key).toString();
		getSession().removeAttribute(key);
		return kaptcha;
	}

}
