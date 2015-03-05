package com.dihaw.services.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dihaw.controller.exception.UserNotFoundException;
import com.dihaw.dto.ResponseDTO;
import com.dihaw.dto.ResponseStatusType;
import com.dihaw.entity.User;
import com.dihaw.repository.UserRepository;
import com.dihaw.services.UserService;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class UserServiceImpl implements UserService {
	
	private final Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	UserRepository repository;

	@Transactional(propagation = Propagation.REQUIRED)
	public Page<User> users(Pageable pageable){
		return repository.findAllUsers(pageable);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public User getUserById(String id) throws UserNotFoundException{
		
		User user= repository.findOne(Integer.parseInt(id));
		
		if(user == null)
			throw new UserNotFoundException(String.format("No user found for id "+id));
		
		return user;
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void updateUser(User user) throws UserNotFoundException {
		
		User userSearch = repository.findOne(user.getUserId());
		
		if(userSearch == null)
			throw new UserNotFoundException(String.format("No user found for id "+user.getUserId()));
		
		logger.info("-0---------> updateUser");
		
		logger.info("-1---------> updateUser: "+user.getUserId());
		logger.info("-2---------> updateUser: "+user.getFirstName());
		logger.info("-3---------> updateUser: "+user.getLastName());
		logger.info("-4---------> updateUser: "+user.getGender().value());
		logger.info("-5---------> updateUser: "+user.getCity().getCityName());
		
		
		repository.updateUser(user.getUserId(), user.getFirstName(), user.getLastName(), user.getGender().value(), user.getCity().getCityName());
		
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public ResponseDTO registerUser(User user){
		
		User userToAdd = repository.save(user);
		
		ResponseDTO response = new ResponseDTO();
		
		if(userToAdd == null){
			response.setStatus(ResponseStatusType.WRONG_DATA);
		}else{
			response.setStatus(ResponseStatusType.SUCCESS);
		}
		
		return response;
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public void deleteUser(String id){
		
		repository.delete(Integer.parseInt(id));
	}
}
