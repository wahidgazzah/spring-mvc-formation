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

	
    /**
     * Retrieve the list of {@link User}s currently accessible from provided user.
     * 
     * @param pageable the paging specification
     * @return the {@link Page} of {@link User}s
     */
    @Query("select u from User u")
    Page<User> findAllUsers(Pageable pageable);

    /**
     * Update the {@link User} by his unique userId.
     * 
     * @param userId the userId to update
     * @param firstName the user first name
     * @param lastName the user last name
     * @param gender the user gender (enum value)
     * @param city the user city
     */
    @Modifying
    @Query("update User u set u.firstName= :firstName, u.lastName= :lastName, u.gender= :gender, u.city= :city where u.userId= :userId")	
	void updateUser(@Param("userId") int userId, 
					@Param("firstName") String firstName, 
					@Param("lastName") String lastName, 
					@Param("gender") Gender gender, 
					@Param("city") City city 
				);
    
    /**
     * Find a single {@link User} by his unique userId.
     * 
     * @param userId the user name to look the User for
     * @return the {@link User} or <code>null</code>
     */
    @Query("select u from User u where u.userId= :id")
    User findByUserId(@Param("id") int id);
    
}
