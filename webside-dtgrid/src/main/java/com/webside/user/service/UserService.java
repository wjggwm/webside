package com.webside.user.service;

import java.util.List;
import java.util.Map;

import com.webside.exception.ServiceException;
import com.webside.user.model.UserEntity;

public interface UserService {

	public List<UserEntity> queryListByPage(Map<String, Object> parameter);

	public UserEntity findByName(String accountName);
	
	public int insert(UserEntity userEntity, String password);
	
	public UserEntity findById(Long id);

	public int update(UserEntity userEntity);
	
	public int updateOnly(UserEntity userEntity, String password) throws ServiceException;
    
    public int deleteBatchById(List<Long> userIds);
    
}