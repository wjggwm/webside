package com.webside.exception.controller;

import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import com.webside.enums.MediaTypes;
import com.webside.exception.RestException;


/**
 * <p>Description: 自定义ExceptionHandler，专门处理Restful异常</p>
 * <p>Company: 静之殇工作室</p>
 * @author wjggwm
 * @date 2016年7月6日 下午1:37:56
 * 
 * </p>会被Spring-MVC自动扫描，但又不属于Controller的annotation
 */
@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler {

	/**
	 * 处理RestException.
	 */
	@ExceptionHandler(value = { RestException.class })
	public final ResponseEntity<?> handleException(RestException ex, WebRequest request) {
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.parseMediaType(MediaTypes.TEXT_PLAIN_UTF_8.getType()));
		return handleExceptionInternal(ex, ex.getMessage(), headers, ex.status, request);
	}

}
