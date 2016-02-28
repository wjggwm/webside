package com.webside.util;

import jodd.mail.Email;
import jodd.mail.EmailMessage;
import jodd.mail.SendMailSession;
import jodd.mail.SmtpServer;
import jodd.mail.SmtpSslServer;
import jodd.util.MimeTypes;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * 
 * <p>
 * Description: 邮件发送工具类
 * </p>
 * <p>
 * Company: 静之殇工作室
 * </p>
 * 
 * @author wjggwm
 * @date 2016年1月19日 上午1:19:06
 */
@Component
public class EmailUtil {
	
	@Value("${mail.QQ.username}")
	private String USER_QQ;

	@Value("${mail.QQ.password}")
	private String PASSWORD_QQ;

	@Value("${mail.126.username}")
	private String USER_126;

	@Value("${mail.126.password}")
	private String PASSWORD_126;

	/**
	 * 发送QQ邮箱
	 * 
	 * @param toMail
	 * @param subject
	 * @param text
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public boolean sendQQMail(String toMail, String subject, String text) throws Exception{
		boolean flag = false;
		try {
			Email email = Email.create();
			email.addMessage(new EmailMessage("Hello!",
					MimeTypes.MIME_TEXT_PLAIN));
			email.from(USER_QQ).to(toMail).subject(subject).addText(text);
			SmtpServer smtpServer = SmtpSslServer.create("smtp.qq.com")
					.authenticateWith(USER_QQ, PASSWORD_QQ);
			SendMailSession session = smtpServer.createSession();
			session.open();
			session.sendMail(email);
			session.close();
			flag = true;
		} catch (Exception e) {
			throw new RuntimeException("邮件发送失败:"+ e.getMessage());
		}
		return flag;
	}

	/**
	 * 发送126邮箱
	 * 
	 * @param toMail
	 * @param subject
	 * @param text
	 * @return
	 */
	@SuppressWarnings("rawtypes")
	public boolean send126Mail(String toMail, String subject, String text) throws Exception{
		boolean flag = false;
		try {
			Email email = Email.create().from(USER_126).to(toMail)
					.subject(subject).addText(text);
			SmtpServer smtpServer = SmtpServer.create("smtp.126.com")
					.authenticateWith(USER_126, PASSWORD_126);
			SendMailSession session = smtpServer.createSession();
			session.open();
			session.sendMail(email);
			session.close();
			flag = true;
		} catch (Exception e) {
			throw new RuntimeException("邮件发送失败:"+ e.getMessage());
		}
		return flag;
	}
}
