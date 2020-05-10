package com.jalizadeh.sbia.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import com.jalizadeh.sbia.client.model.InstagramUserModel;
import com.jalizadeh.sbia.client.payload.ClientPayload;
import com.jalizadeh.sbia.client.payload.InstagramUserPayload;
import com.jalizadeh.sbia.client.repository.InstagramUserRepository;
import com.jalizadeh.sbia.client.request.AnalyzerServiceFeignClient;

@Controller
public class ReportController {

	@Autowired
	private AnalyzerServiceFeignClient analyzerServiceClient;

	@Autowired
	private InstagramUserRepository iUserRepository;
	
	

	@GetMapping("/report")
	public String showReport(@RequestParam String username) {
		return "redirect:/report/" + username;
	}

	@PostMapping("/report")
	public String submitReport(@RequestParam String username) {

		return "redirect:/report/" + username;
	}

	/**
	 * Username is sent to service-analyzer,
	 * If everything is fine, report is shown, and ONLY data of user is saved for
	 *  being shown in home / directory
	 *  
	 * If there is no matching user, redirects to home with error message
	 */
	@GetMapping("/report/{username}")
	public String showResult(@PathVariable String username, ModelMap model,
			RedirectAttributesModelMap redirect) {

		ClientPayload analyzedData = analyzerServiceClient.analyzeByUsername(username);

		// no matching account
		if (analyzedData == null) {
			redirect.addFlashAttribute("error", "User not found");
			return "redirect:localhost:8011/client/";
		}
		
		InstagramUserPayload analyzedUser = analyzedData.getAnalyzedUser();
		
		// store / update user in DB
		if(iUserRepository.findByUsername(username) == null) {
			InstagramUserModel userModel = convertUserPayloadToUserModel(analyzedUser);
			iUserRepository.save(userModel);
		
		} else {
			iUserRepository.deleteByUsername(username);
			InstagramUserModel userModel = convertUserPayloadToUserModel(analyzedUser);
			iUserRepository.save(userModel);
		}

		model.put("user", analyzedUser);
		model.put("logs", analyzedData.getLogs());
		model.put("feedList", analyzedData.getFeed());
		return "report";
		
	}
	
	
	private InstagramUserModel convertUserPayloadToUserModel(InstagramUserPayload user) {
		return new InstagramUserModel(null, user.getPk(), user.getUsername(), user.getFullName(), user.isPrivate(),
				user.isVerified(), user.isBusiness(), user.getFollowers(), user.getFollowings(), user.getUploads(),
				user.getUsertags(), user.getBiography(), user.getCategory(), user.getExternalUrl(),
				user.getPhoneCountryCode(), user.getPhoneNumber(), user.getEmail(), user.getStreet(), user.getCity(),
				user.getZip(), user.getLatitude(), user.getLongitude(), user.getProfilePicUrl(),
				user.getHdProfilePicUrl(), user.getLastCheckDate());
	}


}
