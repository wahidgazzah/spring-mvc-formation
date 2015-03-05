package com.dihaw.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.dihaw.entity.City;

@Repository
public interface CityRepository extends JpaRepository<City, Long> {

    @Query("select c from City c where c.cityName = :cityName")
	City findByCityName(@Param("cityName") String cityName);
}
