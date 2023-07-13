package com.pm.exception.controller;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author chenxiang
 *统一异常处理器
 */
@ControllerAdvice
public class MyExceptionController{
	@ExceptionHandler
	public ModelAndView doException(Exception e){
		ModelAndView model = new ModelAndView("/error");
		model.addObject("ERRORMSG", e.getMessage());
		return model;
	}
}
