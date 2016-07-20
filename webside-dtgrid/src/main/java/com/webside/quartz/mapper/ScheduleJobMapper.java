package com.webside.quartz.mapper;

import org.springframework.stereotype.Repository;

import com.webside.base.basemapper.BaseMapper;
import com.webside.quartz.model.ScheduleJobEntity;

@Repository
public interface ScheduleJobMapper extends BaseMapper<ScheduleJobEntity, Long>{

}
