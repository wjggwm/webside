package com.webside.exception;

/**
 * 
 * <p>Description: 系统异常,处理非ajax请求的Exception</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年2月26日 上午11:07:07
 */
public class SystemException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 2119718747432466934L;

	public SystemException() {
		super();
	}

	public SystemException(String message) {
		super(message);
	}

	public SystemException(Throwable cause) {
		super(cause);
	}

	public SystemException(String message, Throwable cause) {
		super(message, cause);
	}

	public SystemException(String message, Throwable cause,
            boolean enableSuppression,
            boolean writableStackTrace) {
    	super(message, cause, enableSuppression, writableStackTrace);
    }
}
