package com.jalizadeh.sbia.client.controller;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jalizadeh.sbia.client.model.InstagramUserModel;
import com.jalizadeh.sbia.client.payload.DirectoryAjaxDetails;
import com.jalizadeh.sbia.client.payload.DirectoryAjaxPayload;
import com.jalizadeh.sbia.client.repository.InstagramUserRepository;

@Controller
public class DirectoryController {

	@Autowired
	private InstagramUserRepository iUserRepository;
	
	
	@GetMapping("/directory")
	public String showDirectoryPage(ModelMap model) {
		model.put("token", UUID.randomUUID().toString());
		return "directory";
	}
	
	
	@ResponseBody
	@PostMapping("/directory_ajax")
	public DirectoryAjaxPayload handleAjax(@RequestParam long start, 
			@RequestParam long limit, @RequestParam String global_form_token) {
		
		System.err.println(start + "/" + limit + "/" + global_form_token);
		DirectoryAjaxPayload dap =
				new DirectoryAjaxPayload(
					"",
					"success",
					new DirectoryAjaxDetails(
							convertUserModelToHTML(),
							filters(), 
							"", 
							true )
				);
		
		return dap;
	}
	
	
	public String convertUserModelToHTML() {
		String result = "<div class=\"result\">"; 
		
		for (InstagramUserModel user : iUserRepository.findAll()) {
			result += "<div class=\"card card-shadow mt-4 mb-1 index-card\">\r\n" + 
					"			<div class=\"card-body card-body pt-4 pb-2\">\r\n" + 
					"				<div class=\"d-flex flex-column flex-sm-row flex-wrap\">\r\n" + 
					"					<div\r\n" + 
					"						class=\"col-sm-4 col-md-3 col-lg-2 d-flex justify-content-center justify-content-sm-start\">\r\n" + 
					"						<img\r\n" + 
					"							src=\""+ user.getProfilePicUrl() +"\"\r\n" + 
					"							onerror=\"$(this).attr('src', ($(this).data('failover')))\"\r\n" + 
					"							data-failover=\"resources/img/default_avatar.png\"\r\n" + 
					"							class=\"img-responsive rounded-circle directory-instagram-avatar\"\r\n" + 
					"							alt=\"" + user.getUsername() + "\">\r\n" + 
					"					</div>\r\n" + 
					"					<div\r\n" + 
					"						class=\"col-sm-8 col-md-9 col-lg-5 d-flex justify-content-center justify-content-sm-start\">\r\n" + 
					"						<div class=\"row d-flex flex-column\">\r\n" + 
					"							<p class=\"m-0\">\r\n" + 
					"								<a href=\"https://instagram.com/" + user.getUsername() + "\" target=\"_blank\"\r\n" + 
					"									class=\"text-dark\" rel=\"nofollow\">@"+ user.getUsername() +"</a>\r\n" + 
					"							</p>\r\n" + 
					"							<h5>\r\n" + 
					"								<a class=\"text-dark\" href=\"report/"+ user.getUsername() +"\">"+ user.getFullName() +"</a>\r\n" + 
					"							</h5>\r\n" + 
					"						</div>\r\n" + 
					"					</div>\r\n" + 
					"					<div\r\n" + 
					"						class=\"col-md-12 col-lg-5 d-flex justify-content-around align-items-center mt-4 mt-lg-0\">\r\n" + 
					"						<div class=\"col d-flex flex-column justify-content-center\">\r\n" + 
					"							<strong>Followers</strong>\r\n" + 
					"							<p class=\"directory-header-number\">"+ user.getFollowers() +"</p>\r\n" + 
					"						</div>\r\n" + 
					"						<div class=\"col d-flex flex-column justify-content-center\">\r\n" + 
					"							<strong>Uploads</strong>\r\n" + 
					"							<p class=\"directory-header-number\">"+ user.getFollowings() +"</p>\r\n" + 
					"						</div>\r\n" + 
					"						<div class=\"col d-flex flex-column justify-content-center\">\r\n" + 
					"							<strong>Engagement</strong>\r\n" + 
					"							<p class=\"directory-header-number\">0.00%</p>\r\n" + 
					"						</div>\r\n" + 
					"					</div>\r\n" + 
					"				</div>\r\n" + 
					"			</div>\r\n" + 
					"		</div>"
					;
		}
		
		result += "</div>";
		
		return result;
	}
	
	
	public String filters() {
		return "<div class=\"d-flex justify-content-between\">\r\n" + 
				"	<div id=\"active_filters\"></div>\r\n" + 
				"	<div class=\"btn-group\">\r\n" + 
				"		<div class=\"btn-group\">\r\n" + 
				"			<button type=\"button\" class=\"btn btn-default dropdown-toggle\"\r\n" + 
				"				data-toggle=\"dropdown\">\r\n" + 
				"				<i class=\"fa fa-table\"></i> Order by\r\n" + 
				"			</button>\r\n" + 
				"			<div class=\"dropdown-menu px-3 py-2\" data-no-toggle>\r\n" + 
				"				<h6 class=\"dropdown-header\">Order your results</h6>\r\n" + 
				"				<div class=\"form-inline d-flex justify-content-between\">\r\n" + 
				"					<div class=\"form-group\">\r\n" + 
				"						<select class=\"form-control\" name=\"order_by_filter\">\r\n" + 
				"							<option value=\"\">Sort By</option>\r\n" + 
				"							<option value=\"id\" selected=\"true\">ID</option>\r\n" + 
				"							<option value=\"username\">Username</option>\r\n" + 
				"							<option value=\"followers\">Followers</option>\r\n" + 
				"							<option value=\"following\">Following</option>\r\n" + 
				"							<option value=\"uploads\">Uploads</option>\r\n" + 
				"							<option value=\"average_engagement_rate\">Average\r\n" + 
				"								Engagement Rate</option>\r\n" + 
				"						</select>\r\n" + 
				"					</div>\r\n" + 
				"					<div class=\"form-group mt-2\">\r\n" + 
				"						<select class=\"form-control\" name=\"order_by_type\">\r\n" + 
				"							<option value=\"\">Sort Type</option>\r\n" + 
				"							<option value=\"ASC\" selected=\"true\">Ascending</option>\r\n" + 
				"							<option value=\"DESC\">Descending</option>\r\n" + 
				"						</select>\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"			</div>\r\n" + 
				"		</div>\r\n" + 
				"		<div class=\"btn-group\">\r\n" + 
				"			<button type=\"button\" class=\"btn btn-default dropdown-toggle\"\r\n" + 
				"				data-toggle=\"dropdown\">\r\n" + 
				"				<i class=\"fas fa-pencil-alt\"></i> Bio\r\n" + 
				"			</button>\r\n" + 
				"			<div class=\"dropdown-menu\" data-no-toggle>\r\n" + 
				"				<div class=\"px-3 py-2\">\r\n" + 
				"					<h6 class=\"dropdown-header\">Search words in Bio descriptions</h6>\r\n" + 
				"					<div class=\"form-group\">\r\n" + 
				"						<input type=\"text\" name=\"bio_filter\"\r\n" + 
				"							class=\"form-control form-control-border\" placeholder=\"Keyword..\"\r\n" + 
				"							value=\"\" />\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"			</div>\r\n" + 
				"		</div>\r\n" + 
				"		<div class=\"btn-group\">\r\n" + 
				"			<button type=\"button\" class=\"btn btn-default dropdown-toggle\"\r\n" + 
				"				data-toggle=\"dropdown\">\r\n" + 
				"				<i class=\"fa fa-users\"></i> Followers\r\n" + 
				"			</button>\r\n" + 
				"			<div class=\"dropdown-menu px-3 py-2\" data-no-toggle>\r\n" + 
				"				<h6 class=\"dropdown-header\">Filter by range</h6>\r\n" + 
				"				<div class=\"form-inline d-flex justify-content-between\">\r\n" + 
				"					<div class=\"form-group\">\r\n" + 
				"						<select class=\"form-control\" name=\"followers_from_filter\">\r\n" + 
				"							<option value=\"\">From</option>\r\n" + 
				"							<option value=\"500\">500</option>\r\n" + 
				"							<option value=\"5000\">5K</option>\r\n" + 
				"							<option value=\"10000\">10K</option>\r\n" + 
				"							<option value=\"25000\">25K</option>\r\n" + 
				"							<option value=\"50000\">50K</option>\r\n" + 
				"							<option value=\"100000\">100K</option>\r\n" + 
				"							<option value=\"250000\">250K</option>\r\n" + 
				"							<option value=\"500000\">500K</option>\r\n" + 
				"							<option value=\"1000000\">1M</option>\r\n" + 
				"						</select>\r\n" + 
				"					</div>\r\n" + 
				"					<div class=\"form-group\">\r\n" + 
				"						<select class=\"form-control\" name=\"followers_to_filter\">\r\n" + 
				"							<option value=\"\">To</option>\r\n" + 
				"							<option value=\"1000\">1K</option>\r\n" + 
				"							<option value=\"5000\">5K</option>\r\n" + 
				"							<option value=\"10000\">10K</option>\r\n" + 
				"							<option value=\"25000\">25K</option>\r\n" + 
				"							<option value=\"50000\">50K</option>\r\n" + 
				"							<option value=\"100000\">100K</option>\r\n" + 
				"							<option value=\"250000\">250K</option>\r\n" + 
				"							<option value=\"500000\">500K</option>\r\n" + 
				"							<option value=\"1000000\">>1M</option>\r\n" + 
				"						</select>\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"			</div>\r\n" + 
				"		</div>\r\n" + 
				"		<div class=\"btn-group\">\r\n" + 
				"			<button type=\"button\" class=\"btn btn-default dropdown-toggle\"\r\n" + 
				"				data-toggle=\"dropdown\">\r\n" + 
				"				<i class=\"fa fa-comments\"></i> Engagement\r\n" + 
				"			</button>\r\n" + 
				"			<div class=\"dropdown-menu px-3 py-2\" data-no-toggle>\r\n" + 
				"				<h6 class=\"dropdown-header\">Filter by range</h6>\r\n" + 
				"				<div class=\"form-inline d-flex justify-content-between\">\r\n" + 
				"					<div class=\"form-group\">\r\n" + 
				"						<select class=\"form-control\" name=\"engagement_from_filter\">\r\n" + 
				"							<option value=\"\">From</option>\r\n" + 
				"							<option value=\"0.5\">0.5%</option>\r\n" + 
				"							<option value=\"1\">1%</option>\r\n" + 
				"							<option value=\"2\">2%</option>\r\n" + 
				"							<option value=\"3\">3%</option>\r\n" + 
				"							<option value=\"5\">5%</option>\r\n" + 
				"							<option value=\"7\">7%</option>\r\n" + 
				"							<option value=\"10\">10%</option>\r\n" + 
				"						</select>\r\n" + 
				"					</div>\r\n" + 
				"					<div class=\"form-group\">\r\n" + 
				"						<select class=\"form-control\" name=\"engagement_to_filter\">\r\n" + 
				"							<option value=\"\">To</option>\r\n" + 
				"							<option value=\"1\">1%</option>\r\n" + 
				"							<option value=\"2\">2%</option>\r\n" + 
				"							<option value=\"3\">3%</option>\r\n" + 
				"							<option value=\"5\">5%</option>\r\n" + 
				"							<option value=\"7\">7%</option>\r\n" + 
				"							<option value=\"10\">>10%</option>\r\n" + 
				"						</select>\r\n" + 
				"					</div>\r\n" + 
				"				</div>\r\n" + 
				"			</div>\r\n" + 
				"		</div>\r\n" + 
				"	</div>\r\n" + 
				"</div>";
	}
}
