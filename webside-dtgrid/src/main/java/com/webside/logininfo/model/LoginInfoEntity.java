package com.webside.logininfo.model;

import java.util.Date;

import com.webside.base.basemodel.BaseEntity;

/**
 * 
 * <p>Description: 用户登录日志信息</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年1月11日 下午5:06:29
 */
public class LoginInfoEntity extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer userId;
	
	private String accountName;
	
	private String loginIp;
	
	private Date loginTime;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getLoginIp() {
		return loginIp;
	}

	public void setLoginIp(String loginIp) {
		this.loginIp = loginIp;
	}

	public Date getLoginTime() {
		return loginTime;
	}

	public void setLoginTime(Date loginTime) {
		this.loginTime = loginTime;
	}
	
}
