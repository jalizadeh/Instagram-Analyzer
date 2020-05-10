package com.jalizadeh.sbia.serviceanalyzer.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.jalizadeh.sbia.serviceanalyzer.model.InstagramFeedModel;

public interface InstagramFeedRepository extends JpaRepository<InstagramFeedModel, Long>{

	List<InstagramFeedModel> findByOwnerUsernameOrderByTakenAtAsc(String username);
	
	void deleteByOwnerUsername(String username);
}
