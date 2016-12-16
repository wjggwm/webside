package com.webside.shiro.cache.redis;

import java.util.Collection;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.webside.redis.RedisManager;
import com.webside.util.SerializeUtil;

/**
 * 
 * @ClassName RedisShiroCache
 * @Description 使用redis来实现shiro cache接口
 * @param <K>
 * @param <V>
 *
 * @author wjggwm
 * @data 2016年12月13日 下午1:05:00
 */

public class RedisShiroCache<K, V> implements Cache<K, V> {

	private static final Logger logger = LoggerFactory.getLogger(RedisShiroCache.class);
	
	/**
	 * 为了不和其他的缓存混淆，采用追加前缀方式以作区分
	 */
    private static final String REDIS_SHIRO_CACHE = "shiro_cache:";
    /**
     * Redis 分片(分区)，也可以在配置文件中配置,默认dbIndex=0
     */
    private static final int DB_INDEX = 1;

    private RedisManager redisManager;
    
    private String name;

    
    public RedisShiroCache(String name, RedisManager redisManager) {
        this.name = name;
        this.redisManager = redisManager;
    }


    public String getName() {
        if (name == null)
            return "";
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @SuppressWarnings("unchecked")
	@Override
    public V get(K key) throws CacheException {
        byte[] byteValue = new byte[0];
        try {
            byteValue = redisManager.getValueByKey(DB_INDEX, generateCacheKey(key).getBytes());
        } catch (Exception e) {
        	logger.error("get value by cache throw exception",e);
        }
        return (V) SerializeUtil.deserialize(byteValue);
    }

    @Override
    public V put(K key, V value) throws CacheException {
        V previos = get(key);
        try {
        	redisManager.saveValueByKey(DB_INDEX, generateCacheKey(key).getBytes(), SerializeUtil.serialize(value), -1);
        } catch (Exception e) {
        	logger.error("put cache throw exception",e);
        }
        return previos;
    }

    @Override
    public V remove(K key) throws CacheException {
        V previos = get(key);
        try {
        	redisManager.deleteByKey(DB_INDEX, generateCacheKey(key).getBytes());
        } catch (Exception e) {
        	logger.error("remove cache  throw exception",e);
        }
        return previos;
    }

    @Override
    public void clear() throws CacheException {
    }

    @Override
    public int size() {
        if (keys() == null)
            return 0;
        return keys().size();
    }

    @Override
    public Set<K> keys() {
        return null;
    }

    @Override
    public Collection<V> values() {
        return null;
    }

    private String generateCacheKey(Object key) {
        return REDIS_SHIRO_CACHE + getName() + ":" + key;
    }

}
