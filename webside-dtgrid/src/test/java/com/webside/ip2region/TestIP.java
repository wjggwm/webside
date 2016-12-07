/**
 * 
 */
package com.webside.ip2region;

import java.io.IOException;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @ClassName TestIP
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月6日 下午5:00:16
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-applicationContext.xml")
public class TestIP {
	
	
	@Autowired
	DbSearcher ipSearcher;
	
	@Test
	public void testIPSearch()
	{
		String ip = "127.0.0.1";
		try {
			DataBlock dataBlock = ipSearcher.memorySearch(ip);
			String region = dataBlock.getRegion();
			System.out.println(region);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

}
