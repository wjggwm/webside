package com.webside.shiro.cache.redis;

import org.apache.shiro.cache.Cache;

import com.webside.redis.RedisManager;
import com.webside.shiro.cache.ShiroCacheManager;

/**
 * 
 * @ClassName RedisShiroCacheManager
 * @Description Redis管理
 *
 * @author wjggwm
 * @data 2016年12月13日 下午1:43:57
 */
public class RedisShiroCacheManager implements ShiroCacheManager {

    private RedisManager cacheManager;
    
    public RedisManager getCacheManager() {
		return cacheManager;
	}

	public void setCacheManager(RedisManager cacheManager) {
		this.cacheManager = cacheManager;
	}

	@Override
    public <K, V> Cache<K, V> getCache(String name) {
        return new RedisShiroCache<K, V>(name, getCacheManager());
    }

    @Override
    public void destroy() {
    	//如果和其他系统，或者应用在一起就不能关闭
    	cacheManager.getJedis().shutdown();
    }

}
