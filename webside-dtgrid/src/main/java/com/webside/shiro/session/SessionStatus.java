package com.webside.shiro.session;

import java.io.Serializable;

/**
 * 
 * @ClassName SessionStatus
 * @Description session 状态
 *
 * @author wjggwm
 * @data 2016年12月13日 下午12:30:15
 */
public class SessionStatus implements Serializable {
	
	private static final long serialVersionUID = 1L;

	//是否在线(true:在线；false:已被剔出退出)
	private Boolean status = true;

	
	public Boolean isOnline(){
		return status;
	}


	public Boolean getStatus() {
		return status;
	}


	public void setStatus(Boolean status) {
		this.status = status;
	}
	
}
