package com.projects.exception;

public class CustomException extends RuntimeException {
	private static final long serialVersionUID =  -7034897190745766939L;
	
	private int code;

	public CustomException(int code,String message){
		super(message);
		this.code = code;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}	
}
