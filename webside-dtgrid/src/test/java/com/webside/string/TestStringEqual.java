/**
 * 
 */
package com.webside.string;

import org.junit.Test;

/**
 * @ClassName TestStringEqual
 * @Description TODO
 *
 * @author wjggwm
 * @data 2017年1月3日 下午5:47:16
 */
public class TestStringEqual {

	@Test
	public void testEquals()
	{
		String str1 = "/scheduleJob/pauseTrigger.html";
		String str2 = "/scheduleJob/pasueTrigger.html";
		System.out.print(str1.equals(str2));
	}
}
