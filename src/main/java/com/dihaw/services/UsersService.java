package com.dihaw.services;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.dihaw.entity.User;

public interface UsersService {
	
	public Page<User> users(Pageable pageable);
	
	public User getUserById(int id);
	
	public void updateData(User user);

}
