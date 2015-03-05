package com.dihaw.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dihaw.entity.City;
import com.dihaw.entity.Gender;
import com.dihaw.entity.User;

@Repository
public interface UserRepository extends JpaRepository<User, Integer> {

    @Query("select u from User u")
    Page<User> findAllUsers(Pageable pageable);
    
    @Modifying
    @Query("update User u set u.firstName= :firstName, u.lastName= :lastName, u.gender= :gender, u.city= :city where u.userId= :userId")	
	void updateUser(@Param("userId") int userId, 
					@Param("firstName") String firstName, 
					@Param("lastName") String lastName, 
					@Param("gender") Gender gender, 
					@Param("city") City city 
				);
    
    @Query("select u from User u where u.userId= :id")
    User getUserById(@Param("id") int id);
    
}
