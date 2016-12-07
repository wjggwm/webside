package com.webside.util;

import javax.servlet.http.HttpServletRequest;

/**
 * IP地址转化
 * @author wukun
 *
 */

public class IpUtil {
	
	/**
	 * 
	 * @Description 获取客户端真实ip
	 * @param request
	 * @return
	 *
	 * @author wjggwm
	 * @data 2016年11月21日 下午5:10:22
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("X-Real-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

}
