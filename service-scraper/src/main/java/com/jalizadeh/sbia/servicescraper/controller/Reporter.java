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
public class Reporter {
	
	@Autowired
	private Instagram4j instagram;

	@GetMapping("/reporter/{username}")
	public InstagramSearchUsernameResult getUserByUsername(@PathVariable String username) 
			throws ClientProtocolException, IOException {
		InstagramSearchUsernameResult userResult = 
				instagram.sendRequest(new InstagramSearchUsernameRequest(username));
		
		return userResult;
	}
}
