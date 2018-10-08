package com.projects.result;

/**
 * 
* @ClassName: ExceptionData  
* @Description: 方便记录数据
* @author mardoner-QQ:2500119268 
* @date Sep 28, 2018  
*
 */
public class Result {
	private int code;			// 记录异常错误码，如404,500
	private String msg;			// 异常信息
	private Object data;		// 传递的对象数据
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
}
