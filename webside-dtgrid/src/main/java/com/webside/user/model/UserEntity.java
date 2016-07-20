package com.webside.user.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.webside.base.basemodel.BaseEntity;
import com.webside.role.model.RoleEntity;

/**
 * 
 * @ClassName: UserEntity
 * @Description: 用户账户信息
 * @author gaogang
 * @date 2016年7月12日 下午2:39:12
 *
 */
@Alias("userEntity")
public class UserEntity extends BaseEntity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * 用户真实姓名
	 */
	private String userName;
	/*
	 * 这里账户名称统一使用邮箱
	 */
	private String accountName;
	/*
	 * 密码
	 */
	private String password;
	/*
	 * 逻辑删除状态：0：正常；1：删除
	 */
	private Integer deleteStatus;
	/*
	 * 是否锁定：0：正常；1：锁定
	 */
	private Integer locked;
	/*
	 * 描述
	 */
	private String description;
	/*
	 * 加密盐
	 */
	private String credentialsSalt;
	/*
	 * 这里使用accountName
	 */
	private String creatorName;
	/*
	 * 创建时间
	 */
	private Date createTime;
	/*
	 * 更新时间
	 */
	private Date updateTime;
	/*
	 * 所属角色
	 */
	private RoleEntity role;
	/*
	 * 个人资料信息
	 */
	private UserInfoEntity userInfo;
	/*
	 * 前端列表页使用
	 */
	private String roleName;

	public UserEntity() {

	}

	public UserEntity(UserEntity userEntity) {
		this.id = userEntity.getId();
		this.accountName = userEntity.getAccountName();
		this.password = userEntity.getPassword();
		this.deleteStatus = userEntity.getDeleteStatus();
		this.locked = userEntity.getLocked();
		this.description = userEntity.getDescription();
		this.credentialsSalt = userEntity.getCredentialsSalt();
		this.creatorName = userEntity.getCreatorName();
		this.createTime = userEntity.getCreateTime();
		this.updateTime = userEntity.getUpdateTime();
		this.role = userEntity.getRole();
		this.userInfo = userEntity.getUserInfo();
		this.roleName = userEntity.getRoleName();
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getDeleteStatus() {
		return deleteStatus;
	}

	public void setDeleteStatus(Integer deleteStatus) {
		this.deleteStatus = deleteStatus;
	}

	public Integer getLocked() {
		return locked;
	}

	public void setLocked(Integer locked) {
		this.locked = locked;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCredentialsSalt() {
		return credentialsSalt;
	}

	public void setCredentialsSalt(String credentialsSalt) {
		this.credentialsSalt = credentialsSalt;
	}

	public String getCreatorName() {
		return creatorName;
	}

	public void setCreatorName(String creatorName) {
		this.creatorName = creatorName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public RoleEntity getRole() {
		return role;
	}

	public void setRole(RoleEntity role) {
		this.role = role;
		// 设置角色名称,dtgrid使用
		this.roleName = role.getName();
	}

	public UserInfoEntity getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(UserInfoEntity userInfo) {
		this.userInfo = userInfo;
	}

	public String getRoleName() {
		return roleName;
	}

	@Override
	public String toString() {
		return "UserEntity [id=" + id + ", userName=" + userName
				+ ", accountName=" + accountName + ", password=" + password
				+ ", deleteStatus=" + deleteStatus + ", locked=" + locked
				+ ", description=" + description + ", credentialsSalt="
				+ credentialsSalt + ", creatorName=" + creatorName
				+ ", createTime=" + createTime + ", updateTime=" + updateTime
				+ ", role=" + role + "]";
	}

}
