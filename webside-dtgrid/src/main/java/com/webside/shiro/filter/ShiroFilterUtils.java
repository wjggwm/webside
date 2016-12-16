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
public class ShiroFilterUtils {
	
	private static final Logger logger = LoggerFactory.getLogger(ShiroFilterUtils.class);
	
	//登录页面
	static final String LOGIN_URL = "/login.html";
	//踢出登录提示
	final static String KICKED_OUT = "/login.html";
	//没有权限提醒
	final static String UNAUTHORIZED = "/denied.jsp";
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
	 * @param hresponse
	 * @param resultMap
	 * @throws IOException
	 */
	public static void writeJson(ServletResponse response, Map<String, Object> resultMap){
		
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			out.println(JSON.toJSONString(resultMap));
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
