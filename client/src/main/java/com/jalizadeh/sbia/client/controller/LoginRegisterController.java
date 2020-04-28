package com.jalizadeh.sbia.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginRegisterController {

	@GetMapping("/login")
	public String showLoginPage() {
		return "login";
	}
	
	
	@GetMapping("/register")
	public String showRegisterPage() {
		return "register";
	}
}
