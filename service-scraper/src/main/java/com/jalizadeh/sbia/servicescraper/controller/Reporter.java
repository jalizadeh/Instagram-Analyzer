package com.jalizadeh.sbia.servicescraper.controller;

import java.io.IOException;
import java.util.Date;

import org.apache.http.client.ClientProtocolException;
import org.brunocvcunha.instagram4j.Instagram4j;
import org.brunocvcunha.instagram4j.requests.InstagramSearchUsernameRequest;
import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.jalizadeh.sbia.servicescraper.dao.InstagramLogsDao;
import com.jalizadeh.sbia.servicescraper.repository.InstagramLogsRepository;

@RestController
public class Reporter {
	
	@Autowired
	private Instagram4j instagram;
	
	@Autowired
	private InstagramLogsRepository instagramLogsRepository;

	@GetMapping("/reporter/{username}")
	public InstagramSearchUsernameResult getUserByUsername(@PathVariable String username) 
			throws ClientProtocolException, IOException {
		InstagramSearchUsernameResult userResult = 
				instagram.sendRequest(new InstagramSearchUsernameRequest(username));
		InstagramUser user = userResult.getUser();
		
		InstagramLogsDao ildao = InstagramLogsDao.builder()
			.instagram_userid(user.getPk())
			.instagram_username(user.getUsername())
			.followers(new Long(user.getFollower_count()))
			.followings(new Long(user.getFollowing_count()))
			.uploads(new Long(user.getMedia_count()))
			.last_check_date(new Date())
			.build();
		
		instagramLogsRepository.save(ildao);
		
		return userResult;
	}
}
