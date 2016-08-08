package com.webside.user.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.webside.activemq.model.Mail;
import com.webside.activemq.sender.QueueSender;
import com.webside.base.baseservice.impl.AbstractService;
import com.webside.enums.EmailDescription;
import com.webside.exception.ServiceException;
import com.webside.user.mapper.UserMapper;
import com.webside.user.model.UserEntity;
import com.webside.user.service.UserService;
import com.webside.util.EmailUtil;

@Service("userService")
public class UserServiceImpl extends AbstractService<UserEntity, Long> implements UserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private EmailUtil emailUtil;
	
	@Autowired
	private QueueSender queueSender;
	
	//这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(userMapper);
	}
	
	/**
	 * 重写用户插入，逻辑：
	 * 1、插入用户
	 * 2、插入用户和角色的对应关系
	 * 3、插入用户的个人资料信息
	 */
	public int insert(UserEntity userEntity, String password){
		try
		{
			if(userMapper.insert(userEntity) == 1)
			{
				if(userMapper.insertUserRole(userEntity) == 1)
				{
					userEntity.getUserInfo().setId(userEntity.getId());
					int cnt = userMapper.insertUserInfo(userEntity);
					//发送邮件
					Mail mail = new Mail(null,userEntity.getAccountName(),EmailDescription.ADD_EMAIL.getSubject(),String.format(EmailDescription.ADD_EMAIL.getMessage(), userEntity.getAccountName(), password),null,null);
					queueSender.send("q.mail", JSON.toJSONString(mail));
					//emailUtil.send126Mail(userEntity.getAccountName(), "系统消息通知", "您好,您的账户已创建,账户名:"+userEntity.getAccountName() +" ,密码:" + password);
					return cnt;
				}else
				{
					throw new ServiceException("更新用户: "+userEntity.getId()+" 的权限信息失败");
				}
			}else
			{
				throw new ServiceException("新增用户: "+userEntity.getId()+" 失败");
			}
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}
	

	/**
	 * 重写用户更新逻辑：
	 * 1、更新用户
	 * 2、更新用户和角色的对应关系
	 * 3、更新用户个人资料信息
	 */
	public int update(UserEntity userEntity){
		try
		{
			if(userMapper.update(userEntity) == 1)
			{
				if(userMapper.updateUserRole(userEntity) == 1)
				{
					return userMapper.updateUserInfo(userEntity);
				}else
				{
					return 0;
				}
			}else
			{
				return 0;
			}
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}
	
	/**
	 * 重写用户删除逻辑：
	 * 1、删除用户和角色的对应关系
	 * 2、删除用户
	 */
	public int deleteBatchById(List<Long> userIds){
		try
		{
			int result = userMapper.deleteBatchUserRole(userIds);
			if(result == userIds.size())
			{
				return userMapper.deleteBatchById(userIds);
			}else
			{
				return 0;
			}
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}

	@Override
	public int updateOnly(UserEntity userEntity, String password) throws ServiceException{
		try
		{ 
			int cnt = userMapper.update(userEntity);
			//发送邮件
			Mail mail = new Mail(null,userEntity.getAccountName(),EmailDescription.UPDATE_EMAIL.getSubject(), String.format(EmailDescription.UPDATE_EMAIL.getMessage(),password),null,null);
			queueSender.send("q.mail", JSON.toJSONString(mail));
			//emailUtil.send126Mail(userEntity.getAccountName(), "系统密码重置", "您好，您的密码已重置，新密码是:" + password);
			return cnt;
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}
	
}
