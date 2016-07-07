package com.webside.exception;

import org.springframework.http.HttpStatus;

/**
 * 
 * <p>Description: 专用于Restful Service的异常</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年7月6日 下午1:34:45
 */
public class RestException extends RuntimeException {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

	public RestException() {
	}

	public RestException(HttpStatus status) {
		this.status = status;
	}

	public RestException(String message) {
		super(message);
	}

	public RestException(HttpStatus status, String message) {
		super(message);
		this.status = status;
	}
}
