package com.jalizadeh.sbia.serviceanalyzer.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Repository;

import com.jalizadeh.sbia.serviceanalyzer.model.InstagramFeedModel;

@Repository
public interface InstagramFeedRepository extends JpaRepository<InstagramFeedModel, Long>{

	List<InstagramFeedModel> findByOwnerUsernameOrderByTakenAtAsc(String username);
	
	@Transactional
	@Modifying
	void deleteByOwnerUsername(String username);
}
