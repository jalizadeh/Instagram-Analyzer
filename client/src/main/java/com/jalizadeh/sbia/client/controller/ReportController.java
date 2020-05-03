package com.jalizadeh.sbia.client.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

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
import com.jalizadeh.sbia.client.model.InstagramUserModel;
import com.jalizadeh.sbia.client.payload.ClientPayload;
import com.jalizadeh.sbia.client.payload.InstagramLogPayload;
import com.jalizadeh.sbia.client.payload.InstagramUserPayload;
import com.jalizadeh.sbia.client.repository.InstagramLogRepository;
import com.jalizadeh.sbia.client.repository.InstagramUserRepository;
import com.jalizadeh.sbia.client.request.AnalyzerServiceFeignClient;

@Controller
public class ReportController {

	private final long ONE_HOUR = 1000 * 60 * 60;
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AnalyzerServiceFeignClient analyzerServiceClient;

	@Autowired
	private InstagramLogRepository iLogRepository;

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

	// check if data is already in DB & not OLD, if not, I can ask analyzer for new
	// data
	// if user is private, no COMPLETE data available
	@GetMapping("/report/{username}")
	public String showResult(@PathVariable String username, ModelMap model) {

		Date now = new Date();
		Date today000 = getMidnightHour().getTime();

		ClientPayload analyzedData = null;
		InstagramUserPayload analyzedUser = null;
		List<InstagramLogPayload> logList = null;
		InstagramUserModel dbUser = iUserRepository.findByUsername(username);

		if (dbUser == null) {
			logger.info("This is the first time asked for: " + username + ". Getting data rom analyzer");

			analyzedData = analyzerServiceClient.analyzeByUsername(username);

			// no matching account
			if (analyzedData == null) {
				model.put("error", "User not found");
				return "report";
			}

			analyzedUser = analyzedData.getAnalyzedUser();
			InstagramUserModel userModel = convertUserPayloadToUserMode(analyzedUser);
			iUserRepository.save(userModel);

			logList = analyzedData.getLogs();
			List<InstagramLogModel> logsModel = convertLogListPayloadToLogModel(logList);
			iLogRepository.saveAll(logsModel);

			model.put("user", userModel);
			model.put("logs", logsModel);
			return "report";
		}

		logger.info("The user: " + username + " already exist in DB");

		List<InstagramLogModel> dbLogs = iLogRepository.findByPkOrderByLastCheckDateDesc(dbUser.getPk());

		// there is fresh data
		if (now.getTime() - dbUser.getLastCheckDate().getTime() < ONE_HOUR) {
			logger.info("The data is fresh, no need for new check.");
			model.put("user", dbUser);
			model.put("logs", dbLogs);
			return "report";
		}

		logger.info("Data is old, refersh data and update user & log");

		analyzedData = analyzerServiceClient.analyzeByUsername(username);

		// ? what if user doesn't exist anymore ?

		// updated data -> update dbUser
		analyzedUser = analyzedData.getAnalyzedUser();
		InstagramUserModel updatedUser = convertUserPayloadToUserMode(analyzedUser);
		updatedUser.setId(dbUser.getId());

		// update ONLY recent log
		logList = analyzedData.getLogs();
		InstagramLogModel mostRecentLog = convertLogPayloadToLogModel(logList);

		// is there any previous log for Today?
		InstagramLogModel logOfToday = iLogRepository.findByUsernameAndLastCheckDateBetween(username, today000, now);

		if (logOfToday == null) {
			logger.info("this the first today, save it -res-");
			iLogRepository.save(mostRecentLog);
			iUserRepository.save(updatedUser);
		} else {
			logger.info("there is already done for today, get it, replace with new data");
			mostRecentLog.setId(dbLogs.get(0).getId());
			iLogRepository.save(mostRecentLog);
			iUserRepository.save(updatedUser);
		}
		
		dbLogs = iLogRepository.findByPkOrderByLastCheckDateDesc(dbUser.getPk());
		model.put("user", dbUser);
		model.put("logs", dbLogs);
		return "report";
	}

	// ---- Methods ----------------------------

	private InstagramLogModel convertLogPayloadToLogModel(List<InstagramLogPayload> logList) {
		InstagramLogPayload log = logList.get(0);
		return new InstagramLogModel(null, log.getPk(), log.getUsername(), log.getFollowers(), log.getFollowings(),
				log.getUploads(), log.getLastCheckDate());
	}

	private List<InstagramLogModel> convertLogListPayloadToLogModel(List<InstagramLogPayload> logList) {
		List<InstagramLogModel> logs = new ArrayList<InstagramLogModel>();
		for (InstagramLogPayload log : logList) {
			logs.add(new InstagramLogModel(null, log.getPk(), log.getUsername(), log.getFollowers(),
					log.getFollowings(), log.getUploads(), log.getLastCheckDate()));
		}
		return logs;
	}

	private InstagramUserModel convertUserPayloadToUserMode(InstagramUserPayload user) {
		return new InstagramUserModel(null, user.getPk(), user.getUsername(), user.getFullName(), user.isPrivate(),
				user.isVerified(), user.isBusiness(), user.getFollowers(), user.getFollowings(), user.getUploads(),
				user.getUsertags(), user.getBiography(), user.getCategory(), user.getExternalUrl(),
				user.getPhoneCountryCode(), user.getPhoneNumber(), user.getEmail(), user.getStreet(), user.getCity(),
				user.getZip(), user.getLatitude(), user.getLongitude(), user.getProfilePicUrl(),
				user.getHdProfilePicUrl(), user.getLastCheckDate());
	}

	// today at 00:00:00, used to find if is there any record for today
	private Calendar getMidnightHour() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(new Date());
		cal.set(Calendar.HOUR_OF_DAY, 0);
		cal.set(Calendar.MINUTE, 0);
		cal.set(Calendar.SECOND, 0);
		return cal;
	}

}
