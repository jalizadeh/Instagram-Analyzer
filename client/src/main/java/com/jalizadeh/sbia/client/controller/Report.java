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
public class Report {
	@Autowired
	private ScraperServiceClient scraperServiceClient;
	
	@GetMapping("/")
	public String index() {
		return "index";
	}
	
	@GetMapping("/report")
	public String showReport() {
		return "report";
	}
	
	@PostMapping("/report")
	public String submitReport(@RequestParam String username) {
		
		return "redirect:/result/" + username;
	}
	
	@GetMapping("/result/{username}")
	public String showResult(@PathVariable String username, ModelMap model) {
		InstagramSearchUsernameResult response =  scraperServiceClient.getSearchedUser(username);
		
		if (response == null) 	model.put("user",null);
		else 					model.put("user",response.getUser());
		
		return "result";
	}
}
