package com.jalizadeh.sbia.client.controller;

import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jalizadeh.sbia.client.data.ScraperServiceClient;

@Controller
public class ReportController {
	@Autowired
	private ScraperServiceClient scraperServiceClient;
	
	@GetMapping("/report")
	public String showReport(@RequestParam String username) {
		return "redirect:/report/" + username;
	}
	
	
	@PostMapping("/report")
	public String submitReport(@RequestParam String username) {
		
		return "redirect:/report/" + username;
	}
	
	@GetMapping("/report/{username}")
	public String showResult(@PathVariable String username, ModelMap model) {
		//check if data is already in DB & not OLD, then fetch new data
		//if user is private, no COMPLETE data available
		
		InstagramSearchUsernameResult response =  scraperServiceClient.getSearchedUser(username);
		
		if (response == null) 	model.put("user",null);
		else 					model.put("user",response.getUser());
		
		return "report";
	}
}
