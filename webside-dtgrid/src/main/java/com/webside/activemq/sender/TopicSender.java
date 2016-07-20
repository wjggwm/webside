package com.webside.activemq.sender;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.jms.core.MessageCreator;
import org.springframework.stereotype.Component;

/**
 * 
 * @ClassName: TopicSender
 * @Description: 多Subscribe模式发送消息
 * @author gaogang
 * @date 2016年7月12日 下午2:58:39
 *
 */
@Component
public class TopicSender {

	@Autowired
	@Qualifier("jmsTopicTemplate")
	private JmsTemplate jmsTemplate; // 通过@Qualifier修饰符来注入对应的bean

	/**
	 * 发送一条消息到指定的队列（目标）
	 * 
	 * @param queueName
	 *            队列名称
	 * @param message
	 *            消息内容
	 */
	public void send(String queueName, final String message) {
		jmsTemplate.send(queueName, new MessageCreator() {
			@Override
			public Message createMessage(Session session) throws JMSException {
				return session.createTextMessage(message);
			}
		});
	}
}
