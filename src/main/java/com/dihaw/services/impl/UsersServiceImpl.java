package com.dihaw.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.dihaw.entity.User;
import com.dihaw.repository.UsersRepository;
import com.dihaw.services.UsersService;

@Service
@Transactional(propagation = Propagation.SUPPORTS)
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersRepository repository;

	@Transactional(propagation = Propagation.REQUIRED)
	public Page<User> users(Pageable pageable){
		return repository.findAllUsers(pageable);
	}
	
	@Transactional(propagation = Propagation.REQUIRED)
	public User getUserById(int id){
		return repository.getUserById(id);
	}

	@Transactional(propagation = Propagation.REQUIRED)
	public void updateData(User user) {
//		repository.updateUser(user);
		repository.updateUser(user.getUserId(), user.getFirstName(), user.getLastName(), user.getGender(), user.getCity());
	}
	
}
