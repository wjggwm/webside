package com.webside.logininfo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.webside.base.basemodel.BaseEntity;

/**
 * 
 * @ClassName: LoginInfoEntity
 * @Description: 用户登录日志信息
 * @author gaogang
 * @date 2016年7月12日 下午2:46:00
 *
 */
@Alias("loginInfoEntity")
public class LoginInfoEntity extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * 用户id
	 */
	private Integer userId;
	/*
	 * 用户账户
	 */
	private String accountName;
	/*
	 * 用户登录机器ip
	 */
	private String loginIp;
	/*
	 * 用户登录时间
	 */
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
