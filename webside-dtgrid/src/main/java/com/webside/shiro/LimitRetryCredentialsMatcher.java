package com.webside.shiro;

import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.ExcessiveAttemptsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;

import com.webside.redis.RedisManager;
import com.webside.shiro.cache.redis.RedisShiroCache;
import com.webside.util.SerializeUtil;

/**
 * 
 * @ClassName: LimitRetryHashedMatcher
 * @Description: 限制登录次数，如果连续5次输错用户名或密码，锁定10分钟，依靠Ehcache自带的timeToIdleSeconds来保证锁定时间
 * @author gaogang
 * @date 2016年7月12日 下午4:44:23
 *
 */
public class LimitRetryCredentialsMatcher extends HashedCredentialsMatcher {
    
	private Cache<String, Integer> passwordRetryCache;

	private RedisManager redisManager;
	
    public LimitRetryCredentialsMatcher(CacheManager cacheManager, RedisManager redisManager) {
        this.passwordRetryCache = cacheManager.getCache("passwordRetryCache");
        this.redisManager = redisManager;
    }

    @Override
    public boolean doCredentialsMatch(AuthenticationToken token,
        AuthenticationInfo info) {
        String username = token.getPrincipal().toString();

        // 尝试登录次数+1
        Integer retryCount = passwordRetryCache.get(username);
        if (retryCount == null) {
            retryCount = new Integer(0);
            if(passwordRetryCache instanceof RedisShiroCache)
            {
            	try {
					redisManager.saveValueByKey(RedisShiroCache.DB_INDEX, ((RedisShiroCache<String, Integer>)passwordRetryCache).generateCacheKey(username).getBytes(), SerializeUtil.serialize(retryCount), 600);
				} catch (Exception e) {
					throw new RuntimeException(e);
				}
            }else
            {
            	passwordRetryCache.put(username, retryCount);
            }
        }
        
        if(retryCount.intValue() >= 5)
        {
        	throw new LockedAccountException();
        }else if (++retryCount >= 5) {
            // 如果尝试登录次数大于5
            throw new ExcessiveAttemptsException();
        }
        
        if(passwordRetryCache instanceof RedisShiroCache)
        {
        	try {
				redisManager.saveValueByKey(RedisShiroCache.DB_INDEX, ((RedisShiroCache<String, Integer>)passwordRetryCache).generateCacheKey(username).getBytes(), SerializeUtil.serialize(retryCount), 600);
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
        }else
        {
        	passwordRetryCache.put(username, retryCount);
        }

        boolean matches = super.doCredentialsMatch(token, info);

        if (matches) {
            //从缓存中移除该用户的登录记录
            passwordRetryCache.remove(username);
        }

        return matches;
    }
	
}
