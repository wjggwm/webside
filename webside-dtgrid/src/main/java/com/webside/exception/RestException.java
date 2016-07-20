package com.webside.exception;

import org.springframework.http.HttpStatus;

/**
 * 
 * @ClassName: AjaxException
 * @Description: 专用于Restful Service的异常
 * @author gaogang
 * @date 2016年7月12日 下午3:19:14
 *
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
