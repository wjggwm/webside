/**
 * 
 */
package com.webside.user.service;

import java.util.List;
import java.util.Map;

import org.apache.shiro.session.Session;
import org.apache.shiro.subject.SimplePrincipalCollection;

import com.webside.user.model.UserSessionEntity;

/**
 * @ClassName UserSessionService
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月14日 下午6:10:19
 */
public interface UserSessionService {

	public  List<UserSessionEntity> getAllUser();
	
	public List<SimplePrincipalCollection> getSimplePrincipalCollectionByUserId(Long...userIds);
	
	public UserSessionEntity getSession(String sessionId);
	
	public UserSessionEntity getSessionUser(Session session);
	
	public Map<String, Object> changeSessionStatus(Boolean status, String sessionIds);
	
	public void forbidUserById(Long id, Long status);
	
	
}
