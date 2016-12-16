package com.webside.redis;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.apache.shiro.session.Session;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.exceptions.JedisConnectionException;

import com.webside.util.SerializeUtil;

/**
 * 
 * @ClassName JedisManager
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月13日 下午1:10:16
 */
public class RedisManager {
	
    private JedisPool jedisPool;
    
    public JedisPool getJedisPool() {
		return jedisPool;
	}

	public void setJedisPool(JedisPool jedisPool) {
		this.jedisPool = jedisPool;
	}


	public Jedis getJedis() throws JedisConnectionException {
        Jedis jedis = null;
        try {
            jedis = getJedisPool().getResource();
        } catch (Exception e) {
            throw new JedisConnectionException(e);
        }
        return jedis;
    }


    public byte[] getValueByKey(int dbIndex, byte[] key) throws Exception {
        Jedis jedis = null;
        byte[] result = null;
        try {
            jedis = getJedis();
            jedis.select(dbIndex);
            result = jedis.get(key);
        } catch (Exception e) {
            throw e;
        } finally {
        	if(null != jedis)
        	{
        		jedis.close();
        	}
        }
        return result;
    }

    public long deleteByKey(int dbIndex, byte[] key) throws Exception {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.select(dbIndex);
            Long result = jedis.del(key);
            return result;
        } catch (Exception e) {
            throw e;
        } finally {
        	if(null != jedis)
        	{
        		jedis.close();
        	}
        }
    }

    public void saveValueByKey(int dbIndex, byte[] key, byte[] value, int expireTime)
            throws Exception {
        Jedis jedis = null;
        try {
            jedis = getJedis();
            jedis.select(dbIndex);
            jedis.set(key, value);
            if (expireTime > 0)
                jedis.expire(key, expireTime);
        } catch (Exception e) {
            throw e;
        } finally {
        	if(null != jedis)
        	{
        		jedis.close();
        	}
        }
    }


	/**
	 * 获取所有Session
	 * @param dbIndex
	 * @param redisShiroSession
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public Collection<Session> AllSession(int dbIndex, String redisShiroSession) throws Exception {
		Jedis jedis = null;
        Set<Session> sessions = new HashSet<Session>();
		try {
            jedis = getJedis();
            jedis.select(dbIndex);
            Set<byte[]> byteKeys = jedis.keys(redisShiroSession.getBytes());  
            if (byteKeys != null && byteKeys.size() > 0) {  
                for (byte[] bs : byteKeys) {  
                	Session obj = SerializeUtil.deserialize(jedis.get(bs),  
                    		 Session.class);  
                     if(obj instanceof Session){
                    	 sessions.add(obj);  
                     }
                }  
            }  
        } catch (Exception e) {
            throw e;
        } finally {
        	if(null != jedis)
        	{
        		jedis.close();
        	}
        }
        return sessions;
	}
	
	
	/**
	 * 简单的Get
	 * @param <T>
	 * @param key
	 * @param requiredType
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> T get(String key , Class<T>...requiredType) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			return SerializeUtil.deserialize(jds.get(key.getBytes()),requiredType);
        } catch (Exception e) {
            throw e;
        } finally {
        	if(jds != null)
			{
				jds.close();
			}
        }
	}
	/**
	 * 简单的set
	 * @param key
	 * @param value
	 */
	public void set(String key ,Object value) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			byte[] svalue = SerializeUtil.serialize(value);
			jds.set(key.getBytes(), svalue);
        } catch (Exception e) {
            throw e;
        } finally {
        	if(jds != null)
			{
				jds.close();
			}
        }
	}
	
	/**
	 * 过期时间的
	 * @param key
	 * @param value
	 * @param timer （秒）
	 */
	public void setex(String key, Object value, int timer) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			byte[] svalue = SerializeUtil.serialize(value);
			jds.setex(key.getBytes(), timer, svalue);
        } catch (Exception e) {
            throw e;
        } finally {
        	if(jds != null)
			{
				jds.close();
			}
        }
		
	}
	
	/**
	 * 
	 * @param <T>
	 * @param mapkey map
	 * @param key	 map里的key
	 * @param requiredType value的泛型类型
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public  <T> T getVByMap(String mapkey,String key , Class<T> requiredType) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			List<byte[]> result = jds.hmget(mapkey.getBytes(), key.getBytes());
			if(null != result && result.size() > 0 ){
				byte[] x = result.get(0);
				T resultObj = SerializeUtil.deserialize(x, requiredType);
				return resultObj;
			}
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
		return null;
	}
	/**
	 * 
	 * @param mapkey map
	 * @param key	 map里的key
	 * @param value   map里的value
	 */
	public  void setVByMap(String mapkey,String key ,Object value) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			byte[] svalue = SerializeUtil.serialize(value);
			jds.hset(mapkey.getBytes(), key.getBytes(),svalue);
        } catch (Exception e) {
        	throw e;
        } finally {
        	if(jds != null)
			{
				jds.close();
			}
        }
		
	}
	/**
	 * 删除Map里的值
	 * @param mapKey
	 * @param dkey
	 * @return
	 */
	public Object delByMapKey(String mapKey ,String...dkey) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			byte[][] dx = new byte[dkey.length][];
			for (int i = 0; i < dkey.length; i++) {
				dx[i] = dkey[i].getBytes();
			}
			Long result = jds.hdel(mapKey.getBytes(), dx);
			return result;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	
	/**
	 * 往redis里取set整个集合
	 * 
	 * @param <T>
	 * @param setKey
	 * @param start
	 * @param end
	 * @param requiredType
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> Set<T> getVByList(String setKey,Class<T> requiredType) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			Set<T> set = new TreeSet<T>();
			Set<byte[]> xx = jds.smembers(setKey.getBytes());
			for (byte[] bs : xx) {
				T t = SerializeUtil.deserialize(bs, requiredType);
				set.add(t);
			}
			return set;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 获取Set长度
	 * @param setKey
	 * @return
	 */
	public Long getLenBySet(String setKey) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			Long result = jds.scard(setKey);
			return result;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 删除Set
	 * @param dkey
	 * @return
	 */
	public Long delSetByKey(String key,String...dkey) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			Long result = 0L;
			if(null == dkey){
				result = jds.srem(key);
			}else{
				result = jds.del(key);
			}
			return result;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 随机 Set 中的一个值
	 * @param key
	 * @return
	 */
	public String srandmember(String key) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			String result = jds.srandmember(key);
			return result;
		} catch (Exception e){ 
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 往redis里存Set
	 * @param setKey
	 * @param value
	 */
	public void setVBySet(String setKey,String value) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			jds.sadd(setKey, value);
		} catch (Exception e) {
			throw e;
        } finally {
        	if(jds != null)
			{
				jds.close();
			}
        }
	}
	/**
	 * 取set 
	 * @param key
	 * @return
	 */
	public Set<String> getSetByKey(String key) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			Set<String> result = jds.smembers(key);
			return result;
		} catch (Exception e) {
			throw e;
        } finally {
        	if(jds != null)
			{
				jds.close();
			}
        }
		 
	}
	
	
	/**
	 * 往redis里存List
	 * @param listKey
	 * @param value
	 */
	public void setVByList(String listKey,Object value) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			byte[] svalue = SerializeUtil.serialize(value);
			jds.rpush(listKey.getBytes(), svalue);
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 往redis里取list
	 * 
	 * @param <T>
	 * @param listKey
	 * @param start
	 * @param end
	 * @param requiredType
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public <T> List<T> getVByList(String listKey,int start,int end,Class<T> requiredType) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			List<T> list = new ArrayList<T>();
			List<byte[]> xx = jds.lrange(listKey.getBytes(),start,end);
			for (byte[] bs : xx) {
				T t = SerializeUtil.deserialize(bs, requiredType);
				list.add(t);
			}
			return list;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 获取list长度
	 * @param listKey
	 * @return
	 */
	public Long getLenByList(String listKey) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			Long result = jds.llen(listKey.getBytes());
			return result;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 删除
	 * @param dkey
	 * @return
	 */
	public Long delByKey(String...dkey) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			byte[][] dx = new byte[dkey.length][];
			for (int i = 0; i < dkey.length; i++) {
				dx[i] = dkey[i].getBytes();
			}
			Long result = jds.del(dx);
			return result;
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	/**
	 * 判断是否存在
	 * @param existskey
	 * @return
	 */
	public boolean exists(String existskey) throws Exception {
		Jedis jds = null;
		try {
			jds = getJedis();
			jds.select(0);
			return jds.exists(existskey.getBytes());
		} catch (Exception e) {
			throw e;
		} finally {
			if(jds != null)
			{
				jds.close();
			}
		}
	}
	
}
