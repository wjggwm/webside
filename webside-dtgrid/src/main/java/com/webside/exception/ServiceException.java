package com.webside.exception;

/**
 * 
 * <p>Description: Service层公用的Exception, 从由Spring管理事务的函数中抛出时会触发事务回滚.</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年2月26日 上午11:07:07
 */
public class ServiceException extends RuntimeException{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ServiceException() {
		super();
	}

	public ServiceException(String message) {
		super(message);
	}

	public ServiceException(Throwable cause) {
		super(cause);
	}

	public ServiceException(String message, Throwable cause) {
		super(message, cause);
	}

	public ServiceException(String message, Throwable cause,
            boolean enableSuppression,
            boolean writableStackTrace) {
    	super(message, cause, enableSuppression, writableStackTrace);
    }
    
}
