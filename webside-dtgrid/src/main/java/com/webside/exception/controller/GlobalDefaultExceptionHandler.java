package com.webside.exception.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.webside.exception.AjaxException;
import com.webside.exception.SystemException;
import com.webside.util.Common;

/**
 * 
 * <p>
 * Description: Web层异常处理器,这里可以根据不同的异常,写多个方法去处理,可以处理跳转页面请求
 * 跳到异常指定的错误页,也可以处理Ajax请求,根据不同异常,在页面输出不同的提示信息
 * </p>
 * <p>
 * Company: 静之殇工作室
 * </p>
 * operateExp 处理普通请求 operateExpAjax 处理Ajax请求
 * 
 * @author wjggwm
 * @date 2016年2月26日 下午4:15:26
 */
@EnableWebMvc
@ControllerAdvice
public class GlobalDefaultExceptionHandler {

	Logger logger = Logger.getLogger(GlobalDefaultExceptionHandler.class);

	/*
	 * 如果抛出UnauthorizedException，将被该异常处理器截获来显示没有权限信息
	 */
	/*
	@ExceptionHandler({ UnauthorizedException.class })
	@ResponseStatus(HttpStatus.UNAUTHORIZED)
	public ModelAndView unauthenticatedException(NativeWebRequest request,
			UnauthorizedException e) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("exception", e);
		mv.setViewName("base/exception/unauthorized");
		return mv;
	}
	*/

	/**
	 * @Title: operateExp
	 * @Description: 全局异常控制，记录日志
	 *               任何一个方法发生异常，一定会被这个方法拦截到。然后，输出日志。封装Map并返回给页面显示错误信息：
	 *               特别注意：返回给页面错误信息只在开发时才使用，上线后，要把错误页面去掉，只打印log日志即可，防止信息外漏
	 * @param: @param ex
	 * @param: @param request
	 * @return: String
	 * @throws:
	 */
	@ExceptionHandler(SystemException.class)
	public String operateSystemException(SystemException ex, HttpServletRequest request) {
		logger.error(ex.getMessage(), ex);
		return Common.BACKGROUND_PATH + "/error/error";
	}

	/*
	 * 记录Ajax异常日志，并将错误Ajax错误信息传递(回写)给前台展示, 
	 * 前台的jQuery的Ajax请求error中，可以打印错误提示信息 --
	 * data.responseText : 这里即是后台传递的错误提示
	 * eg: $.ajax({ 
	 * 	type : 'get',
	 * 	dataType :"json", 
	 * 	url : ctx + '/test/test', 
	 * 	accept:"application/json", 
	 * 	success :function(data) { 
	 * 		console.log(data); 
	 * 	}, 
	 * 	error : function(data,errorThrown) {
	 * 		console.log(data); 
	 * 		alert("error" + data.responseText); 
	 * 	}
	 * });
	 */
	@ExceptionHandler(AjaxException.class)
	public void operateExpAjax(AjaxException ex, HttpServletResponse response)
			throws IOException {
		logger.error(ex.getMessage(), ex);
		// 将Ajax异常信息回写到前台，用于页面的提示
		response.getWriter().write("抱歉,系统异常,请稍后再试!");
	}

}
