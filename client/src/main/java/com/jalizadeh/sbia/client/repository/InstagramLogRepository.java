package com.jalizadeh.sbia.client.repository;

import java.util.Date;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jalizadeh.sbia.client.model.InstagramLogModel;

public interface InstagramLogRepository extends JpaRepository<InstagramLogModel, Long>{
	
	InstagramLogModel findByInstagramUsernameAndLastCheckDateBetween(String username, Date start, Date end);
	
}