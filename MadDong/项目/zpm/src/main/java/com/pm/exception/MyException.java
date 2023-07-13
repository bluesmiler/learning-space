package com.pm.exception;

public class MyException extends Exception {

	/**
	 * 自定义异常用于全局处理
	 */
	private static final long serialVersionUID = 1L;
	
	
	public MyException (String code){
		super(code);
	}

}
