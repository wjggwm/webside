package com.webside.shiro.session.ehcache;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import net.sf.ehcache.Ehcache;

import org.apache.shiro.session.Session;
import org.apache.shiro.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cache.CacheManager;

import com.webside.shiro.session.ShiroSessionRepository;
import com.webside.util.SerializeUtil;

/**
 * 
 * @ClassName RedisShiroSessionRepository
 * @Description redis 实现 Session 管理
 *
 * @author wjggwm
 * @data 2016年12月13日 下午4:34:57
 */
public class EhCacheShiroSessionRepository implements ShiroSessionRepository {
   
	private static final Logger logger = LoggerFactory.getLogger(EhCacheShiroSessionRepository.class);

	private CacheManager cacheManager;
	
	/**
     * The default active sessions cache name, equal to {@code shiro-activeSessionCache}.
     */
    public static final String ACTIVE_SESSION_CACHE_NAME = "shiro-activeSessionCache";
	
	private String activeSessionsCacheName = ACTIVE_SESSION_CACHE_NAME;
    
	public CacheManager getCacheManager() {
		return cacheManager;
	}

	public void setCacheManager(CacheManager cacheManager) {
		this.cacheManager = cacheManager;
	}
	
    /**
     * Returns the name of the actives sessions cache to be returned by the {@code CacheManager}.  Unless
     * overridden by {@link #setActiveSessionsCacheName(String)}, defaults to {@link #ACTIVE_SESSION_CACHE_NAME}.
     *
     * @return the name of the active sessions cache.
     */
    public String getActiveSessionsCacheName() {
        return activeSessionsCacheName;
    }

    /**
     * Sets the name of the active sessions cache to be returned by the {@code CacheManager}.  Defaults to
     * {@link #ACTIVE_SESSION_CACHE_NAME}.
     *
     * @param activeSessionsCacheName the name of the active sessions cache to be returned by the {@code CacheManager}.
     */
    public void setActiveSessionsCacheName(String activeSessionsCacheName) {
        this.activeSessionsCacheName = activeSessionsCacheName;
    }

	@Override
    public void saveSession(Session session) {
        if (session == null || session.getId() == null)
            throw new NullPointerException("session is empty");
        try {
        	cacheManager.getCache(this.activeSessionsCacheName).put(session.getId(), SerializeUtil.serialize(session));
        } catch (Exception e) {
        	logger.error("save session error，id:"+session.getId(), e);
        }
    }

    @Override
    public void deleteSession(Serializable id) {
        if (id == null) {
            throw new NullPointerException("session id is empty");
        }
        try {
        	cacheManager.getCache(this.activeSessionsCacheName).evict(id);
        } catch (Exception e) {
        	logger.error("删除session出现异常，id:"+id ,e);
        }
    }

   
	@Override
    public Session getSession(Serializable id) {
        if (id == null)
        	 throw new NullPointerException("session id is empty");
        Session session = null;
        try {
        	if(cacheManager.getCache(this.activeSessionsCacheName) instanceof Ehcache)
        	{
        		Ehcache ehcache = (Ehcache)cacheManager.getCache("");
        		byte[] value = (byte[])ehcache.get(id).getObjectValue();
        		session = (Session)SerializeUtil.deserialize(value);
        	}
        } catch (Exception e) {
        	logger.error("获取session异常，id:"+id, e);
        }
        return session;
    }

    @SuppressWarnings("unchecked")
	@Override
    public Collection<Session> getAllSessions() {
    	Collection<Session> sessions = new ArrayList<Session>(0);
		try {
			Object object = cacheManager.getCache(this.activeSessionsCacheName).getNativeCache();
			if(object instanceof Ehcache)
			{
				Ehcache ehcache = (Ehcache)object;
				List<Serializable> keys = ehcache.getKeysWithExpiryCheck();
				if (!CollectionUtils.isEmpty(keys)) {
					for (Serializable key : keys) {
						sessions.add(getSession(key));
					}
				}
			}
		} catch (Exception e) {
			logger.error("获取全部session异常", e);
		}
       
        return sessions;
    }

}
