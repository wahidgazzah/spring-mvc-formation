package com.dihaw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(LoginController.CONTROLLER_BASE_PATH)
public class LoginController {
	
    protected final Logger logger = LoggerFactory.getLogger(getClass());
    
	public final static String CONTROLLER_BASE_PATH = "/login";
    private static String LOGIN_VIEW = "view/login/login";
    
    @RequestMapping()
    public String login(Model model){
    	
    	return LOGIN_VIEW;
    	
    }
    
    @RequestMapping(value="/logout", method = RequestMethod.GET)
    public String logout(Model model) {
     
    return login(model);
     
    }

}