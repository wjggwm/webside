package com.webside.user.model;

import java.util.Date;

import com.webside.base.basemodel.BaseEntity;

public class UserInfoEntity extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private Integer sex;
	
	/*
	 * 处理日期转换
	 */
	private Date birthday;
	
	private String telephone;
	
	private String email;
	
	private String address;
	
	private Date createTime;

	public Integer getSex() {
		return sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", sex=" + sex + ", birthday=" + birthday
				+ ", telephone=" + telephone + ", email=" + email
				+ ", address=" + address + ", createTime=" + createTime + "]";
	}
	
	
	
}
