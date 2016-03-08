package com.webside.loginfo.mapper;

import org.springframework.stereotype.Repository;

import com.webside.base.basemapper.BaseMapper;
import com.webside.loginfo.model.LogInfoEntity;

@Repository
public interface LogInfoMapper extends BaseMapper<LogInfoEntity, Long> {

}
