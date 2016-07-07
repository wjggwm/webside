package com.webside.enums;

import static org.junit.Assert.assertTrue;

import org.junit.Test;

public class TestEnum {

	@Test
	public void test() {
		assertTrue(EmailDescription.ADD_EMAIL.getSubject() == "账户创建");
	}

}
