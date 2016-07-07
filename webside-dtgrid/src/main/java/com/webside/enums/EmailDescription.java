package com.webside.enums;

public enum EmailDescription {

	ADD_EMAIL("新建账户通知","您好,您的账户已创建,账户名: %s ,密码: %s ,请尽快登录系统修改密码,谢谢."),
	UPDATE_EMAIL("密码重置通知","您好，您的密码已重置，新密码是: %s ");
	
	private String subject;
	
	private String message;
	
	private EmailDescription(String subject, String message)
	{
		this.subject = subject;
		this.message = message;
	}
	
	public String getSubject()
	{
		return this.subject;
	}
	
	public String getMessage()
	{
		return this.message;
	}
	
	
}
