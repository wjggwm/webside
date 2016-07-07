package com.webside.activemq.receiver;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.TextMessage;
import javax.mail.AuthenticationFailedException;

import jodd.mail.MailException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.webside.activemq.model.Mail;
import com.webside.util.EmailUtil;

@Component
public class MailProcessor implements MessageListener{
	
	@Autowired
	private EmailUtil emailUtil;
	
	@Override
	public void onMessage(Message message) {
		try {
			String msg = ((TextMessage)message).getText();
			Mail mail = JSON.parseObject(msg, Mail.class);
			emailUtil.send126Mail(mail.getRecipient(), mail.getSubject(), mail.getMessage());
		} catch (JMSException e) {
			System.out.println(e);
		} catch (AuthenticationFailedException e) {
			System.out.println(e);
		}catch(MailException e)
		{
			System.out.println(e);
		}catch(Exception e)
		{
			System.out.println(e);
		}
	}
	
}
