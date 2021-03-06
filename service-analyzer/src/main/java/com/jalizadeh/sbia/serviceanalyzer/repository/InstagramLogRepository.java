package com.jalizadeh.sbia.serviceanalyzer.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jalizadeh.sbia.serviceanalyzer.model.InstagramLogModel;


public interface InstagramLogRepository extends JpaRepository<InstagramLogModel, Long>{
	
	List<InstagramLogModel> findByPkOrderByLastCheckDateDesc(long pk);
	
	InstagramLogModel findByUsernameAndLastCheckDateBetween(String username, Date start, Date end);
	
}