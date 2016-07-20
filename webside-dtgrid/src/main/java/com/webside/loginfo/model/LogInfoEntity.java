package com.webside.loginfo.model;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.webside.base.basemodel.BaseEntity;

/**
 * 
 * @ClassName: LogInfoEntity
 * @Description: 用户操作日志信息
 * @author gaogang
 * @date 2016年7月12日 下午2:44:55
 *
 */
@Alias("logInfoEntity")
public class LogInfoEntity extends BaseEntity{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/*
	 * 管理员id
	 */
	private Long userId;
	/*
	 * 用户账户
	 */
	private String accountName;
	/*
	 * 日期
	 */
	private Date createTime;
	/*
	 * 日志内容
	 */
	private String content; 
	/*
	 * 操作(主要是"添加"、"修改"、"删除"、"授权")等
	 */
	private String operation;

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getAccountName() {
		return accountName;
	}

	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOperation() {
		return operation;
	}

	public void setOperation(String operation) {
		this.operation = operation;
	}

}
