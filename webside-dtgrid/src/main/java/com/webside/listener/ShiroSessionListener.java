package com.webside.listener;


import org.apache.shiro.session.Session;
import org.apache.shiro.session.SessionListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.webside.shiro.session.ShiroSessionRepository;

/**
 * 
 * @ClassName ShiroSessionListener
 * @Description shiro session 会话监听器
 *
 * @author wjggwm
 * @data 2016年12月13日 下午2:49:29
 */
@Component
public class ShiroSessionListener implements SessionListener {

	@Autowired
    private ShiroSessionRepository shiroSessionRepository;

    /**
     * 一个回话的生命周期开始
     */
    @Override
    public void onStart(Session session) {
        System.out.println("session start");
    }
    /**
     * 一个回话的生命周期结束
     */
    @Override
    public void onStop(Session session) {
        System.out.println("session stop");
    }

    @Override
    public void onExpiration(Session session) {
    	//session过期进行清理
        shiroSessionRepository.deleteSession(session.getId());
    	System.out.println("session onExpiration");
    }

    public ShiroSessionRepository getShiroSessionRepository() {
        return shiroSessionRepository;
    }

    public void setShiroSessionRepository(ShiroSessionRepository shiroSessionRepository) {
        this.shiroSessionRepository = shiroSessionRepository;
    }

}

