package com.jalizadeh.sbia.serviceanalyzer.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jalizadeh.sbia.serviceanalyzer.model.InstagramUserModel;

public interface InstagramUserRepository extends  JpaRepository<InstagramUserModel, Long> {

	InstagramUserModel findByUsername(String username);
	
	InstagramUserModel findByUsernameAndLastCheckDateBetween(String username, Date start, Date end);
}
