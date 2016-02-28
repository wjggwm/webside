package com.webside.exception;

/**
 * 
 * <p>Description: ajax异常,针对ajax请求处理的Exception</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年2月26日 上午11:07:07
 */
public class AjaxException extends RuntimeException{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public AjaxException() {
		super();
	}

	public AjaxException(String message) {
		super(message);
	}

	public AjaxException(Throwable cause) {
		super(cause);
	}

	public AjaxException(String message, Throwable cause) {
		super(message, cause);
	}

	public AjaxException(String message, Throwable cause,
            boolean enableSuppression,
            boolean writableStackTrace) {
    	super(message, cause, enableSuppression, writableStackTrace);
    }
}
