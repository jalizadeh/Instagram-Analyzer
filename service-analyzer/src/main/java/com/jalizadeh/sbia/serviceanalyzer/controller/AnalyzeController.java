package com.jalizadeh.sbia.serviceanalyzer.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.jalizadeh.sbia.serviceanalyzer.model.InstagramLogModel;
import com.jalizadeh.sbia.serviceanalyzer.model.InstagramUserModel;
import com.jalizadeh.sbia.serviceanalyzer.payload.ClientPayload;
import com.jalizadeh.sbia.serviceanalyzer.payload.InstagramAnalyzedUserPayload;
import com.jalizadeh.sbia.serviceanalyzer.payload.InstagramLogPayload;
import com.jalizadeh.sbia.serviceanalyzer.repository.InstagramLogRepository;
import com.jalizadeh.sbia.serviceanalyzer.repository.InstagramUserRepository;
import com.jalizadeh.sbia.serviceanalyzer.request.ScraperServiceFeignClient;

@RestController
public class AnalyzeController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	private final long ONE_HOUR = 1000 * 60 * 60;

	@Autowired
	private ScraperServiceFeignClient serviceScraperClient;

	@Autowired
	private InstagramLogRepository iLogRepository;

	@Autowired
	private InstagramUserRepository iUserRepository;

	// when a request comes from client, I should check for:
	// 1. if is there any data of this user
	// 2. is there any fresh (within 1 hour) data of user
	@GetMapping("/analyzeByUsername/{username}")
	public ClientPayload analyzeByUsername(@PathVariable String username) {

		Date now = new Date();
		//Date oneHourBefore = new Date(System.currentTimeMillis() - 3600 * 1000);
		Date today000 = getMidnightHour().getTime();

		InstagramSearchUsernameResult scrapedData = null;
		InstagramUser scrapedUser = null;
		InstagramUserModel dbUser = iUserRepository.findByUsername(username);

		if (dbUser == null) {
			logger.info("This is the first time " + username + " is fetched");
			logger.info("Fetching data for " + username);

			scrapedData = serviceScraperClient.scrapeByUsername(username);

			// no matching account
			if (scrapedData.getStatus().equals("fail")) {
				logger.info("No matching account is found for " + username + ". Returning NULL");
				return null;
			}

			scrapedUser = scrapedData.getUser();

			logger.info("Creating new record for " + username);
			InstagramUserModel convertedUser = convertInstagramUserPayloadToMyUserModel(scrapedUser, now);
			iUserRepository.save(convertedUser);

			logger.info("Creating new log for " + username);
			InstagramLogModel newLog = createLogModelOfUser(scrapedUser, now);
			iLogRepository.save(newLog);

			logger.info("Returning data to client of " + username);
			return createFirstTimeClientPayload(convertedUser, newLog);
		}

		logger.info("The user: " + username + " already exist in DB");
		
		List<InstagramLogModel> dbLogs = iLogRepository.findByPk(dbUser.getPk());

		// there is fresh data
		if (now.getTime() - dbUser.getLastCheckDate().getTime() < ONE_HOUR) {
			logger.info("The data is fresh, no need for new check.");
			return createClientPayload(dbUser, dbLogs);
		}

		
		logger.info("Data is old, refersh data and update user & log");

		scrapedData = serviceScraperClient.scrapeByUsername(username);
		scrapedUser = scrapedData.getUser();
		
		//? what if user doesn't exist anymore ?

		InstagramLogModel newLog = createLogModelOfUser(scrapedUser, now);
		InstagramUserModel updatedUser = convertInstagramUserPayloadToMyUserModel(scrapedUser, now);
		updatedUser.setId(dbUser.getId());

		//is there any previous log for Today?
		InstagramLogModel logOfToday = 
				iLogRepository.findByUsernameAndLastCheckDateBetween(username, today000, now);

		if (logOfToday == null) { 
			logger.info("this the first today, save it -res-");
			iLogRepository.save(newLog);
			iUserRepository.save(updatedUser);
		} else {
			logger.info("there is already done for today, get it, replace with new data");
			newLog.setId(logOfToday.getId());
			iLogRepository.save(newLog);
			iUserRepository.save(updatedUser);
		}
		
		List<InstagramLogModel> allLogs = iLogRepository.findByPk(dbUser.getPk());
		return createClientPayload(updatedUser, allLogs);

	}

	// -----Methods-------------------

	private ClientPayload createClientPayload(InstagramUserModel user, List<InstagramLogModel> dbLogs) {
		List<InstagramLogPayload> logList = new ArrayList<>();

		for (InstagramLogModel log : dbLogs) {
			logList.add(new InstagramLogPayload(log.getPk(), log.getUsername(),
					log.getFollowers(), log.getFollowings(), log.getUploads(), log.getLastCheckDate()));
		}

		return new ClientPayload(convertUserModelToPayload(user), logList);
	}

	// If this is the first time that this profile is checked, there is only 1 log
	// available
	private ClientPayload createFirstTimeClientPayload(InstagramUserModel user, InstagramLogModel log) {
		List<InstagramLogPayload> logList = new ArrayList<>();
		logList.add(new InstagramLogPayload(log.getPk(), log.getUsername(), log.getFollowers(),
				log.getFollowings(), log.getUploads(), log.getLastCheckDate()));

		return new ClientPayload(convertUserModelToPayload(user), logList);
	}

	private InstagramAnalyzedUserPayload convertUserModelToPayload(InstagramUserModel user) {
		return new InstagramAnalyzedUserPayload(user.getPk(), user.getUsername(), user.getFullName(), user.isPrivate(),
				user.isVerified(), user.isBusiness(), new Long(user.getFollowers()), new Long(user.getFollowings()),
				new Long(user.getUploads()), new Long(user.getUsertags()), user.getBiography(), user.getCategory(),
				user.getExternalUrl(), user.getPhoneCountryCode(), user.getPhoneNumber(), user.getEmail(),
				user.getStreet(), user.getCity(), user.getZip(), user.getLatitude(), user.getLongitude(),
				user.getProfilePicUrl(), user.getHdProfilePicUrl(), user.getLastCheckDate());
	}

	private InstagramLogModel createLogModelOfUser(InstagramUser user, Date newCheckDate) {
		return new InstagramLogModel(user.getPk(), user.getUsername(), new Long(user.getFollower_count()),
				new Long(user.getFollowing_count()), new Long(user.getMedia_count()), newCheckDate);
	}

	private InstagramUserModel convertInstagramUserPayloadToMyUserModel(InstagramUser user, Date newCheckDate) {
		return new InstagramUserModel(null, user.getPk(), user.getUsername(), user.getFull_name(), user.is_private(),
				user.is_verified(), user.is_business(), user.getFollower_count(), user.getFollowing_count(),
				user.getMedia_count(), user.getUsertags_count(), user.getBiography(), user.getCategory(),
				user.getExternal_url(), user.getPublic_phone_country_code(), user.getPublic_phone_number(),
				user.getPublic_email(), user.getAddress_street(), user.getCity_name(), user.getZip(),
				user.getLatitude(), user.getLongitude(), user.getProfile_pic_url(),
				user.getHd_profile_pic_url_info().getUrl(), newCheckDate);
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
