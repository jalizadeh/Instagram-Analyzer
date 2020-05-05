package com.jalizadeh.sbia.servicescraper.controller;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.brunocvcunha.instagram4j.Instagram4j;
import org.brunocvcunha.instagram4j.requests.InstagramSearchUsernameRequest;
import org.brunocvcunha.instagram4j.requests.InstagramUserFeedRequest;
import org.brunocvcunha.instagram4j.requests.payload.InstagramFeedResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ScrapeController {
	
	private InstagramSearchUsernameResult user;
	
	@Autowired
	private Instagram4j instagram;

	@GetMapping("/scrapeUserByUsername/{username}")
	public InstagramSearchUsernameResult scrapeUserByUsername(@PathVariable String username) 
			throws ClientProtocolException, IOException {
		this.user = instagram.sendRequest(new InstagramSearchUsernameRequest(username));
		
		return this.user;
	}
	
	
	@GetMapping("/scrapeFeedByUsername/{username}")
	public InstagramFeedResult scrapeFeedByUsername(@PathVariable String username) 
			throws ClientProtocolException, IOException {

		return instagram.sendRequest(new InstagramUserFeedRequest(this.user.getUser().getPk()));
	}
	

	
	// ----- Method ---------------
	
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
