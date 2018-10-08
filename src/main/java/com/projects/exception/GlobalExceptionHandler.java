package com.projects.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.projects.result.Result;
import com.projects.result.ResultUtil;

/**
 * 
* @ClassName: GlobalExceptionHandler  
* @Description: 全局异常处理器， TODO:另外可以将异常记录进日志
* @author mardoner-QQ:2500119268 
* @date Sep 28, 2018  
*
 */
@ControllerAdvice
public class GlobalExceptionHandler {
	
	/**
	 * 
	* @Title: handle  
	* @Description: 对不同的异常做处理 
	* @param @param e
	* @param @return    参数  
	 */
	@ExceptionHandler(Exception.class)
	@ResponseBody  			// 返回json数据
	public Result handle(Exception e) {
		if(e instanceof CustomException) {
			CustomException ce = (CustomException)e;
			return ResultUtil.err(ce.getCode(), ce.getMessage());
		}
		else {
			System.out.println("系统异常");
			return ResultUtil.err(500, "未知错误");
		}
	}
}
