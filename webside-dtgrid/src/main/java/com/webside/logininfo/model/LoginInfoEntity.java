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
	 * 用户省份
	 */
	private String province;
	/*
	 * 用户城市
	 */
	private String city;
	/*
	 * 用户地域信息
	 */
	private String region;
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

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}
	
	
}
