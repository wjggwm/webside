package com.webside.logininfo.mapper;

import org.springframework.stereotype.Repository;

import com.webside.base.basemapper.BaseMapper;
import com.webside.logininfo.model.LoginInfoEntity;

@Repository
public interface LoginInfoMapper extends BaseMapper<LoginInfoEntity, Long> {

}
