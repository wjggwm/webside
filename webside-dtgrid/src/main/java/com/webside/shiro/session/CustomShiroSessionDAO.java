package com.webside.shiro.session;

import java.io.Serializable;
import java.util.Collection;

import org.apache.log4j.Logger;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;

/**
 * 
 * @ClassName: CustomShiroSessionDAO
 * @Description: shiro Session 操作,拷贝自www.sojson.com
 * @author gaogang
 * @date 2016年7月12日 下午4:45:43
 *
 */
public class CustomShiroSessionDAO extends AbstractSessionDAO{ 
	
	private static Logger logger = Logger.getLogger(CustomShiroSessionDAO.class);
	
    private ShiroSessionRepository shiroSessionRepository;  
  
    public ShiroSessionRepository getShiroSessionRepository() {  
        return shiroSessionRepository;  
    }  
  
    public void setShiroSessionRepository(  
            ShiroSessionRepository shiroSessionRepository) {  
        this.shiroSessionRepository = shiroSessionRepository;  
    }  
  
    @Override  
    public void update(Session session) throws UnknownSessionException {  
        getShiroSessionRepository().saveSession(session);  
    }  
  
    @Override  
    public void delete(Session session) {  
        if (session == null) {  
        	logger.error("Session 不能为null");
            return;  
        }  
        Serializable id = session.getId();  
        if (id != null)  
            getShiroSessionRepository().deleteSession(id);  
    }  
  
    @Override  
    public Collection<Session> getActiveSessions() {  
        return getShiroSessionRepository().getAllSessions();  
    }  
  
    @Override  
    protected Serializable doCreate(Session session) {  
        Serializable sessionId = this.generateSessionId(session);  
        this.assignSessionId(session, sessionId);  
        getShiroSessionRepository().saveSession(session);  
        return sessionId;  
    }  
  
    @Override  
    protected Session doReadSession(Serializable sessionId) {  
        return getShiroSessionRepository().getSession(sessionId);  
    } }
