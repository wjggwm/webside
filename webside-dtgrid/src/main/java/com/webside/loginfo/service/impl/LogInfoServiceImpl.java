package com.webside.loginfo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.webside.base.baseservice.impl.AbstractService;
import com.webside.loginfo.mapper.LogInfoMapper;
import com.webside.loginfo.model.LogInfoEntity;
import com.webside.loginfo.service.LogInfoService;

@Service("logInfoService")
public class LogInfoServiceImpl extends AbstractService<LogInfoEntity, Long> implements LogInfoService{

	@Autowired
	private LogInfoMapper logInfoMapper;
	
	//这句必须要加上。不然会报空指针异常，因为在实际调用的时候不是BaseMapper调用，而是具体的mapper，这里为userMapper
	@Autowired
	public void setBaseMapper() {
		super.setBaseMapper(logInfoMapper);
	}

	@Override
	public int log(LogInfoEntity logInfo) {
		return logInfoMapper.insert(logInfo);
	}
	
}
