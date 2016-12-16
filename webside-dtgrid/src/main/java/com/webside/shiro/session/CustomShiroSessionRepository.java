/**
 * 
 */
package com.webside.shiro.session;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Set;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.session.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.webside.shiro.cache.ShiroCacheManager;

/**
 * @ClassName CustomerShiroSessionRepository
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月14日 下午5:44:48
 */
public class CustomShiroSessionRepository implements ShiroSessionRepository{

	private static final Logger logger = LoggerFactory.getLogger(CustomShiroSessionRepository.class);
	
	private ShiroCacheManager shiroCacheManager;
	
    /**
     * The default active sessions cache name, equal to {@code shiro-activeSessionCache}.
     */
    public static final String ACTIVE_SESSION_CACHE_NAME = "shiro-activeSessionCache";

    /**
     * The name of the session cache, defaults to {@link #ACTIVE_SESSION_CACHE_NAME}.
     */
    private String activeSessionsCacheName = ACTIVE_SESSION_CACHE_NAME;
	
	public ShiroCacheManager getCacheManager() {
		return shiroCacheManager;
	}

	public void setShiroCacheManager(ShiroCacheManager shiroCacheManager) {
		this.shiroCacheManager = shiroCacheManager;
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
	
	/**
	 * 存储Session
	 * @param session
	 */
    public void saveSession(Session session)
    {
    	if (session == null || session.getId() == null)
            throw new NullPointerException("session is empty");
        try {
        	shiroCacheManager.getCache(this.activeSessionsCacheName).put(session.getId(), session);
        } catch (Exception e) {
        	logger.error("save session error，id:"+session.getId(), e);
        }
    }
    
    /**
     * 删除session
     * @param sessionId
     */
    public void deleteSession(Serializable sessionId)
    {
    	if (sessionId == null) {
            throw new NullPointerException("session id is empty");
        }
        try {
        	shiroCacheManager.getCache(this.activeSessionsCacheName).remove(sessionId);
        } catch (Exception e) {
        	logger.error("删除session出现异常，id:"+sessionId ,e);
        }
    }
    
    /**
     * 获取session
     * @param sessionId
     * @return
     */
    public Session getSession(Serializable sessionId)
    {
    	 if (sessionId == null)
        	 throw new NullPointerException("session id is empty");
        Session session = null;
        try {
        	session = (Session)shiroCacheManager.getCache(this.activeSessionsCacheName).get(sessionId);
        } catch (Exception e) {
        	logger.error("获取session异常，id:"+sessionId, e);
        }
        return session;
    }
    
    /**
     * 获取所有sessoin
     * @return
     */
    public Collection<Session> getAllSessions()
    {
    	Collection<Session> sessions = new ArrayList<Session>(0);
		try {
			Cache<Serializable, Session> cache = shiroCacheManager.getCache(this.activeSessionsCacheName);
			Set<Serializable> keys = cache.keys();
			for (Serializable key : keys) {
				sessions.add(cache.get(key));
			}
		} catch (Exception e) {
			logger.error("获取全部session异常", e);
		}
        return sessions;
    }
	
}
