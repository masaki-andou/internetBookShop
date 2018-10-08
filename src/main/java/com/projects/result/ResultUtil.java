package com.projects.result;

/**
 * 
* @ClassName: ResultUtil  
* @Description: 方便生成ExceptionData
* @author mardoner-QQ:2500119268 
* @date Sep 28, 2018  
*
 */
public class ResultUtil {
	public static Result err(int code,String message) {
		Result result = new Result();
		result.setCode(code);
		result.setMsg(message);
		return result;
	}
	
	public static Result success(Object obj) {
		Result result = new Result();
		result.setCode(200);
		result.setMsg("成功");
		result.setData(obj);
		return result;
	}
	
	public static Result success(String msg) {
		Result result = new Result();
		result.setCode(200);
		result.setMsg(msg);
		result.setData(null);
		return result;
	}
}
