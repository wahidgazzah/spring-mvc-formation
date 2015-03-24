package com.dihaw.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionController {
	
	private static String ERROR_VIEW= "error/generic_error";
	
	@ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(CustomGenericException ex) {
		
		ModelAndView model = new ModelAndView(ERROR_VIEW);
 
		return model;
	}
 
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception ex) {
		
		ModelAndView model = new ModelAndView(ERROR_VIEW);
 
		return model;
	}
	
}
