package com.webside.activemq.receiver;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import javax.mail.AuthenticationFailedException;

import jodd.mail.MailException;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.webside.activemq.model.Mail;
import com.webside.util.EmailUtil;
/**
 * 
 * @ClassName: MailProcessor
 * @Description: 邮件消息处理
 * @author gaogang
 * @date 2016年7月12日 下午2:49:16
 *
 */
@Component
public class MailProcessor implements MessageListener{
	
	private static Logger logger = Logger.getLogger(MailProcessor.class);
	
	@Autowired
	private EmailUtil emailUtil;
	
	@Override
	public void onMessage(Message message) {
		try {
			String msg = ((TextMessage)message).getText();
			Mail mail = JSON.parseObject(msg, Mail.class);
			emailUtil.send126Mail(mail.getRecipient(), mail.getSubject(), mail.getMessage());
		} catch (JMSException e) {
			logger.error("消息队列获取邮件消息失败", e);
		} catch (AuthenticationFailedException e) {
			logger.error("邮件客户端认证失败", e);
		}catch(MailException e)
		{
			logger.error("发送邮件失败", e);
		}catch(Exception e)
		{
			logger.error("消息队列->发送邮件失败", e);
		}
	}
	
}
