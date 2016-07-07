package com.webside.resource.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webside.base.baseservice.impl.AbstractService;
import com.webside.resource.mapper.ResourceMapper;
import com.webside.resource.model.ResourceEntity;
import com.webside.resource.service.ResourceService;

@Service("resourceService")
public class ResourceServiceImpl extends AbstractService<ResourceEntity, Long>
		implements ResourceService {

	@Autowired
	private ResourceMapper resourceMapper;

	// 这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(resourceMapper);
	}

	@Override
	public List<ResourceEntity> findResourcesByUserId(int userId) {
		return resourceMapper.findResourcesByUserId(userId);
	}

	@Override
	public List<ResourceEntity> queryResourceList(Map<String, Object> parameter) {
		return resourceMapper.queryResourceList(parameter);
	}

	@Override
	public List<ResourceEntity> findResourcesMenuByUserId(int userId) {
		return resourceMapper.findResourcesMenuByUserId(userId);
	}

}
