package com.jalizadeh.sbia.client.controller;

import java.util.Calendar;
import java.util.Date;

import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.jalizadeh.sbia.client.model.InstagramLogModel;
import com.jalizadeh.sbia.client.payload.InstagramLogPayload;
import com.jalizadeh.sbia.client.repository.InstagramLogRepository;
import com.jalizadeh.sbia.client.request.AnalyzerServiceFeignClient;

@Controller
public class ReportController {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AnalyzerServiceFeignClient analyzerServiceClient;
	
	@Autowired
	private InstagramLogRepository iLogRepository;

	@GetMapping("/report")
	public String showReport(@RequestParam String username) {
		return "redirect:/report/" + username;
	}

	@PostMapping("/report")
	public String submitReport(@RequestParam String username) {

		return "redirect:/report/" + username;
	}

	/*
	@GetMapping("/report/{username}")
	public String showResult(@PathVariable String username, ModelMap model) {
		// check if data is already in DB & not OLD, then ask analyzer for new data
		// if user is private, no COMPLETE data available

		// calculate some basic dates
		Date now = new Date();
		Date oneHourBefore = new Date(System.currentTimeMillis() - 3600 * 1000);

		// today at 00:00:00, used to find if is there any record for today
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		Date today000 = cal.getTime();

		// System.err.println("midnight: " + tody000 +" / now: " + now + " / -1: " +
		// oneHourBefore );

		InstagramLogModel dbResult = iLogRepository.findByInstagramUsernameAndLastCheckDateBetween(username,
				oneHourBefore, now);

		InstagramUser user = null;

		if (dbResult != null) {
			logger.info("yes one data is fetched in 1 hour, here you are");
		} else {
			logger.info("nothing in last 1 hour, lets get new data");

			InstagramLogPayload analyzedUser = 
					analyzerServiceClient.analyzeByUsername(username);
			
			user = analyzedUser.getUser();

			dbResult = new InstagramLogModel(user.getPk(), user.getUsername(),
					new Long(user.getFollower_count()),
					new Long(user.getFollowing_count()),
					new Long(user.getMedia_count()), new Date());

			InstagramLogModel logOfToday = iLogRepository.findByInstagramUsernameAndLastCheckDateBetween(username,
					today000, now);

			if (logOfToday == null) {
				logger.info("this the first today, save it -res-");
				iLogRepository.save(dbResult);
			} else {
				logger.info("there is already done for today, get it, replace with new data");
				dbResult.setId(logOfToday.getId());
				iLogRepository.save(dbResult);
			}
		}

		return InstagramLogPayload.builder().instagramUserId(new Long(dbResult.getInstagramUserId()))
				.instagramUsername(dbResult.getInstagramUsername()).followers(new Long(dbResult.getFollowers()))
				.followings(new Long(dbResult.getFollowings())).uploads(new Long(dbResult.getUploads()))
				.lastCheckDate(dbResult.getLastCheckDate()).build();

		

		if (response == null)
			model.put("user", null);
		else
			model.put("user", response.getUser());

		return "report";
	}
	
	*/
	
	
}
