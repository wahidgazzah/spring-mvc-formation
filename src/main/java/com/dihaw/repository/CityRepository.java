package com.dihaw.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.dihaw.entity.City;

@Repository
public interface CityRepository extends JpaRepository<City, Long> {

    @Query("select c from City c")
    List<City> findAllCity();
}
