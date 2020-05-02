package com.jalizadeh.sbia.servicescraper.controller;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.brunocvcunha.instagram4j.Instagram4j;
import org.brunocvcunha.instagram4j.requests.InstagramSearchUsernameRequest;
import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScrapeController {
	
	@Autowired
	private Instagram4j instagram;

	@GetMapping("/scrapeByUsername/{username}")
	public InstagramSearchUsernameResult scrapeByUsername(@PathVariable String username) 
			throws ClientProtocolException, IOException {
		/*
		InstagramSearchUsernameResult userResult = 
				instagram.sendRequest(new InstagramSearchUsernameRequest(username));
		InstagramUser user = userResult.getUser();
		*/
		
		/*
		InstagramLogsDao ildao = InstagramLogsDao.builder()
			.instagram_userid(user.getPk())
			.instagram_username(user.getUsername())
			.followers(new Long(user.getFollower_count()))
			.followings(new Long(user.getFollowing_count()))
			.uploads(new Long(user.getMedia_count()))
			.last_check_date(new Date())
			.build();
		
		instagramLogsRepository.save(ildao);
		*/
		
		return instagram.sendRequest(new InstagramSearchUsernameRequest(username));
	}
	
	
	public static String getMediaIdFromCode(String mediaCode) {
		String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
		long id = 0;
		for (int i = 0; i < mediaCode.length(); i++) {
			char c = mediaCode.charAt(i);
			id = id * 64 + alphabet.indexOf(c);
		}
		return id + "";
	}
}
