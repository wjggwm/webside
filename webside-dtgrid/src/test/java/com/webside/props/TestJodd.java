package com.webside.props;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;

import jodd.props.Props;

import org.junit.Test;

public class TestJodd {

	@Test
	public void testJodd()
	{
		String shiroConfig;
		try {
			shiroConfig = TestJodd.class.getResource("/shiroAuth.props").toURI().getPath();
			Props props = new Props();
			props.load(new File(shiroConfig), "UTF-8");
			String test = props.getValue("/user/**", "authc");
			System.out.println(test);
		} catch (URISyntaxException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
             
	}
}
