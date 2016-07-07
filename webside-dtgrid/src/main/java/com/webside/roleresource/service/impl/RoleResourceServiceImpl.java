package com.webside.roleresource.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webside.exception.ServiceException;
import com.webside.resource.model.ResourceEntity;
import com.webside.resource.service.ResourceService;
import com.webside.role.model.RoleEntity;
import com.webside.role.service.RoleService;
import com.webside.roleresource.service.RoleResourceService;

@Service("roleResourceService")
public class RoleResourceServiceImpl implements RoleResourceService{

	@Autowired
	private RoleService roleService;
	
	@Autowired
	private ResourceService resourceService;
	
	@Override
	public boolean insertRoleAndResource(ResourceEntity resourceEntity) {
		try
		{
			//1、添加资源
			resourceService.insert(resourceEntity);
			//2、超级管理员直接赋予该权限
			RoleEntity role = roleService.findByName("超级管理员");
			roleService.addRolePerm(role.getId(), resourceEntity.getId());
			return true;
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}

}
