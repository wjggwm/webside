package com.webside.shiro.filter;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;





import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.alibaba.fastjson.JSON;



/**
 * 
 * @ClassName ShiroFilterUtils
 * @Description Shiro Filter
 *
 * @author wjggwm
 * @data 2016年12月12日 下午5:14:09
 */
public class ShiroUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(ShiroUtils.class);
	/*
	 * 登录地址：这里使用空的登录地址，是为了让程序根据contextPath自动跳转
	 */
	public static final String LOGIN_URL = "";
	/*
	 * 登录地址：这里使用空的登录地址，是为了让程序根据contextPath自动跳转
	 */
	public static final String INDEX_URL = "/";
	/*
	 * 没有权限提醒
	 */
	public static final String UNAUTHORIZED = "/denied.jsp";
	/*
	 * 存储在session中用户信息的名称
	 */
	public static final String USERSESSION = "userSession";
	/*
	 * 不需要认证和授权的路径
	 */
	public static final String OPENAPI = "/openapi";
	/*
     * 在线用户
     */
	public static final String ONLINE_USER = "session_online_user";
  	/*
  	 * 踢出状态，true表示踢出
  	 */
	public static final String KICKOUT_STATUS = "session_kickout_status";
	
	/**
	 * 是否是Ajax请求
	 * @param request
	 * @return
	 */
	public static boolean isAjax(ServletRequest request){
		return "XMLHttpRequest".equalsIgnoreCase(((HttpServletRequest) request).getHeader("X-Requested-With"));
	}
	
	/**
	 * response 输出JSON
	 * @param response
	 * @param resultMap
	 * @throws IOException
	 */
	public static void writeJson(ServletResponse response, Map<String, Object> resultMap){
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.print(JSON.toJSONString(resultMap));
		} catch (Exception e) {
			logger.error("输出JSON异常:", e);
		}finally{
			if(null != out){
				out.flush();
				out.close();
			}
		}
	}
}
