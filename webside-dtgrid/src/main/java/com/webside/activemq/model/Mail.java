package com.webside.activemq.model;

import java.io.Serializable;
import java.util.List;

/**
 * 
 * @ClassName: Mail
 * @Description: 邮件信息
 * @author gaogang
 * @date 2016年7月12日 下午2:48:19
 *
 */
public class Mail implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
	 * 邮件发件人
	 */
	private String sender;
	/*
	 * 邮件收件人
	 */
	private String recipient;
	/*
	 * 邮件主题
	 */
	private String subject;
	/*
	 * 邮件内容
	 */
	private String message;
	/*
	 * 邮件附件
	 */
	private String attchment;
	/*
	 * 邮件抄送人集合
	 */
	private List<String> cc;
	
	public Mail() {
	}

	public Mail(String sender, String recipient, String subject,
			String message, String attchment, List<String> cc) {
		this.sender = sender;
		this.recipient = recipient;
		this.subject = subject;
		this.message = message;
		this.attchment = attchment;
		this.cc = cc;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getRecipient() {
		return recipient;
	}

	public void setRecipient(String recipient) {
		this.recipient = recipient;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getAttchment() {
		return attchment;
	}

	public void setAttchment(String attchment) {
		this.attchment = attchment;
	}

	public List<String> getCc() {
		return cc;
	}

	public void setCc(List<String> cc) {
		this.cc = cc;
	}

}
