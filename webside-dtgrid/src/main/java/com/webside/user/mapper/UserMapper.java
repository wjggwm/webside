package com.webside.user.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.webside.base.basemapper.BaseMapper;
import com.webside.user.model.UserEntity;

@Repository
public interface UserMapper extends BaseMapper<UserEntity, Long>{
	
	/**
	 * 添加用户和角色对应关系
	 * @param userEntity
	 * @return
	 */
	public int insertUserRole(UserEntity userEntity);
	
	/**
	 * 更新用户和角色对应关系
	 * @param userEntity
	 * @return
	 */
	public int updateUserRole(UserEntity userEntity);
	
	/**
	 * 删除用户和角色对应关系
	 * @param userEntity
	 * @return
	 */
	public int deleteBatchUserRole(List<Long> userIds);
	
	/**
	 * 添加用户个人资料信息
	 * @param userEntity
	 * @return
	 */
	public int insertUserInfo(UserEntity userEntity);
	
	/**
	 * 更新用户个人资料信息
	 * @param userEntity
	 * @return
	 */
	public int updateUserInfo(UserEntity userEntity);
}
