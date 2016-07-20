package com.webside.dtgrid.model;

/**
 * 
 * @ClassName: Sort
 * @Description: dtgrid表格排序对象，拷贝自大连首闻科技有限公司的DLShouWen Grid
 * @author gaogang
 * @date 2016年7月12日 下午3:08:20
 *
 */
public class Sort {
	
	/**
	 * 字段
	 */
	private String field;
	
	/**
	 * 排序逻辑
	 */
	private String logic;

	public String getField() {
		return field;
	}

	public void setField(String field) {
		this.field = field;
	}

	public String getLogic() {
		return logic;
	}

	public void setLogic(String logic) {
		this.logic = logic;
	}
	
}
