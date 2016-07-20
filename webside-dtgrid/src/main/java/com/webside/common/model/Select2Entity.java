package com.webside.common.model;

import java.io.Serializable;

/**
 * 
 * @ClassName: Select2Entity
 * @Description: select2 模型
 * @author gaogang
 * @date 2016年7月12日 下午4:16:05
 *
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
