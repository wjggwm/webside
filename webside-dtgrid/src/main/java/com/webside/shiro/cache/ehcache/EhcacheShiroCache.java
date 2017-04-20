/**
 * 
 */
package com.webside.shiro.cache.ehcache;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import net.sf.ehcache.Ehcache;
import net.sf.ehcache.Element;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheException;
import org.apache.shiro.util.CollectionUtils;
import org.springframework.cache.Cache.ValueWrapper;
import org.springframework.cache.support.SimpleValueWrapper;

/**
 * @ClassName EhcacheShiroCache
 * @Description 使用ehcache来实现shiro cache接口
 *
 * @author wjggwm
 * @data 2016年12月13日 下午3:07:22
 */
public class EhcacheShiroCache<K, V> implements Cache<K, V>{
	
	private org.springframework.cache.Cache cache;

	public EhcacheShiroCache(org.springframework.cache.Cache cache) {
        this.cache = cache;
    }

    
    @SuppressWarnings("unchecked")
	public V get(K key) throws CacheException {
    	ValueWrapper value = cache.get(key);
        if (value instanceof SimpleValueWrapper) {
            return (V)((SimpleValueWrapper) value).get();
        }
        return (V)value;
    }

    
    public V put(K key, V value) throws CacheException {
    	cache.put(key, value);
        return value;
    }

    
    public V remove(K key) throws CacheException {
    	V previos = get(key);
    	cache.evict(key);
        return previos;
    }

    
    public void clear() throws CacheException {
    	cache.clear();
    }

    
    public int size() {
        if(cache.getNativeCache() instanceof Ehcache) {
            Ehcache ehcache = (Ehcache) cache.getNativeCache();
            return ehcache.getSize();
        }
        throw new UnsupportedOperationException("invoke spring cache abstract size method not supported");
    }

    
    @SuppressWarnings("unchecked")
	public Set<K> keys() {
        if(cache.getNativeCache() instanceof Ehcache) {
            Ehcache ehcache = (Ehcache) cache.getNativeCache();
            return new HashSet<K>(ehcache.getKeys());
        }
        throw new UnsupportedOperationException("invoke spring cache abstract keys method not supported");
    }

    
    @SuppressWarnings("unchecked")
	public Collection<V> values() {
        if(cache.getNativeCache() instanceof Ehcache) {
            Ehcache ehcache = (Ehcache) cache.getNativeCache();
            List<K> keys = ehcache.getKeys();
            if (!CollectionUtils.isEmpty(keys)) {
                List<V> values = new ArrayList<V>(keys.size());
                for (K key : keys) {
                    V value = get(key);
                    if (value != null) {
                        values.add(value);
                    }
                }
                return Collections.unmodifiableList(values);
            } else {
                return Collections.emptyList();
            }
        }
        throw new UnsupportedOperationException("invoke spring cache abstract values method not supported");
    }
    
    
    public void setex(String key, V value) throws Exception {
    	if(cache.getNativeCache() instanceof Ehcache) {
            Ehcache ehcache = (Ehcache) cache.getNativeCache();
            ehcache.put(new Element(key, value));
    	}
	}
    
    
    @SuppressWarnings("unchecked")
	public V get(String key) throws Exception {
    	ValueWrapper value = cache.get(key);
        if (value instanceof SimpleValueWrapper) {
            return (V)((SimpleValueWrapper) value).get();
        }
        return (V)value;
	}
    
}
