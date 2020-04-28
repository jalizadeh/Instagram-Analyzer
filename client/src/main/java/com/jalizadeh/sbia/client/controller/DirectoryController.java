package com.jalizadeh.sbia.client.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DirectoryController {

	@GetMapping("/directory")
	public String showDirectoryPage() {
		return "directory";
	}
}
