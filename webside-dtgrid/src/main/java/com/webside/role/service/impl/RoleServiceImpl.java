package com.webside.role.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webside.base.baseservice.impl.AbstractService;
import com.webside.exception.ServiceException;
import com.webside.role.mapper.RoleMapper;
import com.webside.role.model.RoleEntity;
import com.webside.role.service.RoleService;

@Service("roleService")
public class RoleServiceImpl extends AbstractService<RoleEntity, Long>
		implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(roleMapper);
	}

	@Override
	public boolean addRolePerm(int id, List<Integer> ids){
		boolean flag = false;
		try
		{
			int permCount = roleMapper.findRoleResourceById(id);
			boolean delFlag = true;
			if(permCount > 0)
			{
				int delResult = roleMapper.deleteRoleResource(id);
				if(permCount != delResult)
				{
					delFlag = false;
				}
			}
			
			if (delFlag) {
				if(ids.size() > 0)
				{
					Map<String, Object> parameter = new HashMap<String, Object>();
					parameter.put("roleId", id);
					parameter.put("resourceIds", ids);
					int addResult = roleMapper.addRoleResource(parameter);
					if (addResult == ids.size()) {
						flag = true;
					}
				}else
				{
					flag = true;
				}
			}
			return flag;
		}catch(Exception e)
		{
			throw new ServiceException(e);
		}
	}


}
