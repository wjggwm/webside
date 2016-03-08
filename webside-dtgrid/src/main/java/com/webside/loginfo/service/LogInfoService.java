package com.webside.loginfo.service;

import java.util.List;
import java.util.Map;

import com.webside.loginfo.model.LogInfoEntity;

public interface LogInfoService {

	public int log(LogInfoEntity logInfo);
	
	public List<LogInfoEntity> queryListByPage(Map<String, Object> parameter);
}
