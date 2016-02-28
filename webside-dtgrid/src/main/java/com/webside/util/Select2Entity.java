package com.webside.util;

import java.io.Serializable;

/**
 * 
 * <p>Description: select2 模型</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年1月25日 下午4:39:19
 */
public class Select2Entity implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String id;
	
	private String text;
	
	private String name;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
