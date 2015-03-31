package com.dihaw.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionController {
	
	private static String GENERIC_ERROR_VIEW= "error/generic_error";
	private static String ERROR_VIEW = "error";
	private static String ERROR_CODE = "errorCode";
	private static String ERROR_MESSAGE = "errorMessage";
	
	@ExceptionHandler(CustomGenericException.class)
	public ModelAndView handleCustomException(CustomGenericException e) {
		
		ModelAndView model = new ModelAndView(ERROR_VIEW);
		
		model.addObject(ERROR_CODE, e.getErrorCode());
		model.addObject(ERROR_MESSAGE, e.getErrorMessage());
 
		return model;
	}
 
	@ExceptionHandler(Exception.class)
	public ModelAndView handleAllException(Exception e) {
		
		ModelAndView model = new ModelAndView(GENERIC_ERROR_VIEW);
 
		return model;
	}
	
}
