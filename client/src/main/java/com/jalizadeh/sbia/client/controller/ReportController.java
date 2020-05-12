package com.jalizadeh.sbia.client.controller;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.jalizadeh.sbia.client.payload.InstagramFeedPayload;
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

		List<InstagramFeedPayload> feed = analyzedData.getFeed();
		
		model.put("user", analyzedUser);
		model.put("logs", analyzedData.getLogs());
		model.put("feedList", feed);
		model.put("postCountByWeekday", calcPostCountByWeekday(feed));
		model.put("postCountByHour", calcPostCountByHour(feed)); 
		return "report";
		
	}
	
	
	//------ Method ------------------
	
	

	private InstagramUserModel convertUserPayloadToUserModel(InstagramUserPayload user) {
		return new InstagramUserModel(null, user.getPk(), user.getUsername(), user.getFullName(), user.isPrivate(),
				user.isVerified(), user.isBusiness(), user.getFollowers(), user.getFollowings(), user.getUploads(),
				user.getUsertags(), user.getBiography(), user.getCategory(), user.getExternalUrl(),
				user.getPhoneCountryCode(), user.getPhoneNumber(), user.getEmail(), user.getStreet(), user.getCity(),
				user.getZip(), user.getLatitude(), user.getLongitude(), user.getProfilePicUrl(),
				user.getHdProfilePicUrl(), user.getLastCheckDate());
	}


	private List<Long> calcPostCountByWeekday(List<InstagramFeedPayload> feed) {
		Map<String, Long> mapDOW = new HashMap<>();

		//init whole map with 0
		mapDOW.put("MONDAY", 0L);
		mapDOW.put("TUESDAY", 0L);
		mapDOW.put("WEDNESDAY", 0L);
		mapDOW.put("THURSDAY", 0L);
		mapDOW.put("FRIDAY", 0L);
		mapDOW.put("SATURDAY", 0L);
		mapDOW.put("SUNDAY", 0L);
		
		
		for (InstagramFeedPayload f : feed) {			
			LocalDateTime now = LocalDateTime.ofEpochSecond(f.getTakenAt().getTime() / 1000, 0, ZoneOffset.UTC);
			String dow = now.getDayOfWeek().toString();

			mapDOW.put(dow, mapDOW.get(dow) + 1);
		}
		
		//order by day of week
		List<Long> countDOW = new ArrayList<Long>();
		countDOW.add(mapDOW.get("MONDAY"));
		countDOW.add(mapDOW.get("TUESDAY"));
		countDOW.add(mapDOW.get("WEDNESDAY"));
		countDOW.add(mapDOW.get("THURSDAY"));
		countDOW.add(mapDOW.get("FRIDAY"));
		countDOW.add(mapDOW.get("SATURDAY"));
		countDOW.add(mapDOW.get("SUNDAY"));
		
		return countDOW;
	}
	
	/**
	 * Mon:
	 * 	<0,0>
	 * 	<1,0>
	 * 	...
	 * 
	 * Tue:
	 * 	... 
	 */
	private List<Map<Long, Long>> calcPostCountByHour(List<InstagramFeedPayload> feed) {
		Map<String, Map<Long, Long>> mapDOW = new HashMap<>();

		//init whole map with 0
		mapDOW.put("MONDAY", null);
		mapDOW.put("TUESDAY", null);
		mapDOW.put("WEDNESDAY", null);
		mapDOW.put("THURSDAY", null);
		mapDOW.put("FRIDAY", null);
		mapDOW.put("SATURDAY", null);
		mapDOW.put("SUNDAY", null);
		
		for (String day : mapDOW.keySet()) {
			Map<Long, Long> hm = new HashMap<>();
			for (int i = 0; i < 24; i++) {
				hm.put(new Long(i), 0L);
			}
			mapDOW.put(day, hm);
		}
		
		
		for (InstagramFeedPayload f : feed) {			
			LocalDateTime now = LocalDateTime.ofEpochSecond(f.getTakenAt().getTime() / 1000, 0, ZoneOffset.UTC);
			Long hour = new Long(now.getHour()); 
			String dow = now.getDayOfWeek().toString();

			Map<Long, Long> mm = mapDOW.get(dow);
			mm.put(hour, mm.get(hour) + 1);
			mapDOW.put(dow, mm);
		}
		
		//order by day of week
		List<Map<Long, Long>> countDOW = new ArrayList<Map<Long, Long>>();
		countDOW.add(mapDOW.get("MONDAY"));
		countDOW.add(mapDOW.get("TUESDAY"));
		countDOW.add(mapDOW.get("WEDNESDAY"));
		countDOW.add(mapDOW.get("THURSDAY"));
		countDOW.add(mapDOW.get("FRIDAY"));
		countDOW.add(mapDOW.get("SATURDAY"));
		countDOW.add(mapDOW.get("SUNDAY"));
		
		return countDOW;
	}

}
