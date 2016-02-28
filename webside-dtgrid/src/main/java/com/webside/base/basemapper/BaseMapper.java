package com.webside.base.basemapper;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

/**
 * 
 * <p>Description: 基础mapper定义,可以自己进行重新定义</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年1月14日 下午3:21:50
 */
public interface BaseMapper<T,ID extends Serializable> {

    public int insert(T t);
    
    public int insertBatch(List<T> t);
    
    public int deleteBatchById(List<ID> ids);
 
    public int deleteById(@Param("id")ID id);
 
    public int deleteByUUID(String uuid);
 
    public int update(T t);
 
    public T find(Map<String, Object> parameter);
 
    public T findById(@Param("id")ID id);
 
    public T findByUUID(@Param("uuid")String uuid);
 
    public T findByName(@Param("name")String name);
 
    public List<T> queryListAll(Map<String, Object> parameter);
    
    public List<T> queryListByPage(Map<String, Object> parameter);
    
    int count(Map<String, Object> parameter);
	
}
