package com.webside.util;

import java.io.Serializable;

/**
 * 
 * <p>Description: 分页工具类</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年1月14日 上午10:00:34
 */
public class PageUtil implements Serializable{
	/*
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/*
     * 页码，从1开始
     */
    private int pageNum;
    /*
     * 页面大小
     */
    private int pageSize;
    /*
     * 排序字段
     */
    private String orderByColumn;
	/*
	 * 排序方式
	 */
    private String orderByType;
    
	public int getPageNum() {
		return pageNum;
	}
	
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
	
	public int getPageSize() {
		return pageSize;
	}
	
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	public String getOrderByColumn() {
		return orderByColumn;
	}
	
	public void setOrderByColumn(String orderByColumn) {
		this.orderByColumn = orderByColumn;
	}
	
	public String getOrderByType() {
		return orderByType;
	}
	
	public void setOrderByType(String orderByType) {
		this.orderByType = orderByType;
	}
	
}
