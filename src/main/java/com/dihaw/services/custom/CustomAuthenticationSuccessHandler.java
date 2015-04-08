package com.dihaw.services.custom;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.transaction.annotation.Transactional;

import com.dihaw.repository.UserAttemptsRepository;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler{
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	public static final String SPRING_SECURITY_FORM_USERNAME_KEY = "username";
	
    @Autowired
    private UserAttemptsRepository userAttemptsRepository;
	
    protected String obtainUsername(HttpServletRequest request) {
        return request.getParameter(SPRING_SECURITY_FORM_USERNAME_KEY);
    }
    
    
	@Override
	@Transactional
	public void onAuthenticationSuccess(HttpServletRequest request,
			HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
		logger.info("-----onAuthenticationSuccess");
		
		String username = obtainUsername(request);

		 if (username != null) {
			 userAttemptsRepository.deleteLoginFailureCount(username);
		 }
		 
		 response.sendRedirect(request.getContextPath());
		
	}

}
