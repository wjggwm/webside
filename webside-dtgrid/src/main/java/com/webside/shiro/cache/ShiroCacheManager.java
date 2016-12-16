package com.webside.shiro.cache;

import org.apache.shiro.cache.Cache;

/**
 * 
 * @ClassName ShiroCacheManager
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月14日 下午5:39:53
 */
public interface ShiroCacheManager {

    <K, V> Cache<K, V> getCache(String name);

    void destroy();

}
