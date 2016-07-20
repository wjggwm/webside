package com.webside.base.baseservice;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

/**
 * 
 * @ClassName: BaseService
 * @Description: service层接口
 * @author gaogang
 * @date 2016年7月12日 下午3:03:19
 *
 * @param <T>
 * @param <ID>
 */
public interface BaseService<T,ID extends Serializable> {

	/**
	 * 
	 * @Title: insert
	 * @Description: 插入对象
	 * @param t	插入的对象
	 * @return	int	返回影响的行数
	 * @throws
	 */
    public int insert(T t);
    /**
     * 
     * @Title: insertBatch
     * @Description: 批量插入对象
     * @param t	插入的对象
     * @return	int	返回影响的行数
     * @throws
     */
    public int insertBatch(List<T> t);
    /**
     * 
     * @Title: deleteBatchById
     * @Description: 批量删除
     * @param ids	删除的id
     * @return	int	返回影响的行数
     * @throws
     */
    public int deleteBatchById(List<ID> ids);
    /**
     * 
     * @Title: deleteById
     * @Description: 根据id删除
     * @param id	id
     * @return	int	返回影响的行数
     * @throws
     */
    public int deleteById(ID id);
    /**
     * 
     * @Title: deleteById
     * @Description: 根据id删除
     * @param id	id
     * @return	int	返回影响的行数
     * @throws
     */
    public int deleteById(String id);
    /**
     * 
     * @Title: update
     * @Description: 更新对象
     * @param t	更新的对象
     * @return	int	返回影响的行数
     * @throws
     */
    public int update(T t);
    /**
     * 
     * @Title: find
     * @Description: 根据参数查询对象
     * @param parameter	查询参数map
     * @return	T	返回查询的对象
     * @throws
     */
    public T find(Map<String, Object> parameter);
    /**
     * 
     * @Title: findById
     * @Description: 根据id查询对象
     * @param id	id
     * @return	T	返回查询的对象
     * @throws
     */
    public T findById(ID id);
    /**
     * 
     * @Title: findById
     * @Description: 根据id查询对象
     * @param id	id
     * @return	T	返回查询的对象
     * @throws
     */
    public T findById(String id);
    /**
     * 
     * @Title: findByName
     * @Description: 根据名称查询
     * @param name	名称
     * @return	T	返回查询的对象
     * @throws
     */
    public T findByName(String name);
    /**
     * 
     * @Title: queryListAll
     * @Description: 根据参数查询全部对象
     * @param parameter	查询参数map
     * @return	List<T>	返回查询的对象集合
     * @throws
     */
    public List<T> queryListAll(Map<String, Object> parameter);
    /**
     * 
     * @Title: queryListAll
     * @Description: 根据分页参数查询对象
     * @param parameter	查询参数map
     * @return	List<T>	返回查询的对象集合
     * @throws
     */
    public List<T> queryListByPage(Map<String, Object> parameter);
    /**
     * 
     * @Title: count
     * @Description: 根据参数查询对象总条数
     * @param parameter	查询参数map
     * @return	int	返回查询的对象总条数
     * @throws
     */
    int count(Map<String, Object> parameter);

}
