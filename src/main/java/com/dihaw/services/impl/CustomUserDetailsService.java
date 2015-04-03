package com.dihaw.services.impl;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dihaw.entity.UserAttempts;
import com.dihaw.repository.UserAttemptsRepository;
import com.dihaw.repository.UserRepository;

@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService 

//extends DaoAuthenticationProvider 

implements UserDetailsService{
	
	private final Logger logger = LoggerFactory.getLogger(getClass());
	
	private static final int MAX_ATTEMPTS = 3;
	
	@Autowired
	UserRepository userRepository;
	
	@Autowired
	UserAttemptsRepository userAttemptsRepository;
	/*
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		
		logger.info("------------ Authentication authenticate");
		logger.info("------------ Authentication authenticate: {}", authentication.getName());

		try {

			Authentication auth = super.authenticate(authentication);

			// if reach here, means login success, else exception will be thrown
			// reset the user_attempts
			userAttemptsRepository.resetFailAttempts(authentication.getName());

			return auth;

		} catch (BadCredentialsException e) {

			updateFailAttempts(authentication.getName());
			throw e;

		} catch (LockedException e) {

			String error = "";
			UserAttempts userAttempts = userAttemptsRepository.findUserAttemptsByUsername(authentication.getName());
			if (userAttempts != null) {
				Date lastAttempts = userAttempts.getLastModified();
				error = "User account is locked! <br><br>Username : " + authentication.getName()
						+ "<br>Last Attempts : " + lastAttempts;
			} else {
				error = e.getMessage();
			}

			throw new LockedException(error);
		}

	}

	
	private void updateFailAttempts(String username) {
		UserAttempts user = getUserAttempts(username);
		if (user == null) {
			if (isUserExists(username)) {
				// if no record, insert a new
				userAttemptsRepository.save(user);
			}
		} else {

			if (isUserExists(username)) {
				// update attempts count, +1
				userAttemptsRepository.updateFailAttempts(new Date(), username);
			}

			if (user.getAttempts() + 1 >= MAX_ATTEMPTS) {
				// locked user
				userRepository.updateLocked(false, username);
				// throw exception
				throw new LockedException("User Account is locked!");
			}

		}
		
	}


	private boolean isUserExists(String username) {
		boolean result = false;

		int count = userRepository.count(username);
		if (count > 0) {
			result = true;
		}
		return result;
	}


	private UserAttempts getUserAttempts(String username) {
		try {

			UserAttempts userAttempts = userAttemptsRepository.findUserAttemptsByUsername(username);
			return userAttempts;

		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

*/
	/**
	 * Returns a populated {@link UserDetails} object. 
	 * The username is first retrieved from the database and then mapped to 
	 * a {@link UserDetails} object.
	 */
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		try {
			com.dihaw.entity.User domainUser = userRepository.findByUsername(username);
			
			return new User(
					domainUser.getUsername(), 
					domainUser.getPassword().toLowerCase(),
					(domainUser.getStatus().value()=="Enabled") 	? true : false,
					(domainUser.getAccountNonExpired() == 1) 		? true : false,		
					(domainUser.getCredentialsNonExpired() == 1) 	? true : false,		
				    (domainUser.getAccountNonLocked() == 1) 		? true : false,
					getAuthorities(domainUser.getRole().getRole()));
			
		} catch (Exception e) {
			
			logger.info("------------ loadUserByUsername exception: {}", e.getMessage());
			
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * Retrieves a collection of {@link GrantedAuthority} based on a numerical role
	 * @param role the numerical role
	 * @return a collection of {@link GrantedAuthority
	 */
	public Collection<? extends GrantedAuthority> getAuthorities(Integer role) {
		List<GrantedAuthority> authList = getGrantedAuthorities(getRoles(role));
		return authList;
	}
	
	/**
	 * Converts a numerical role to an equivalent list of roles
	 * @param role the numerical role
	 * @return list of roles as as a list of {@link String}
	 */
	public List<String> getRoles(Integer role) {
		List<String> roles = new ArrayList<String>();
		
		if (role.intValue() == 1) {
			roles.add("ROLE_USER");
			roles.add("ROLE_ADMIN");
			
		} else if (role.intValue() == 2) {
			roles.add("ROLE_USER");
		}
		
		return roles;
	}
	
	/**
	 * Wraps {@link String} roles to {@link SimpleGrantedAuthority} objects
	 * @param roles {@link String} of roles
	 * @return list of granted authorities
	 */
	public static List<GrantedAuthority> getGrantedAuthorities(List<String> roles) {
		List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
		for (String role : roles) {
			authorities.add(new SimpleGrantedAuthority(role));
		}
		return authorities;
	}
}
