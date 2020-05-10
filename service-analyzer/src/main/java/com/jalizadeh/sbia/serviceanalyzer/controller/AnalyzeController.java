package com.jalizadeh.sbia.serviceanalyzer.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.brunocvcunha.instagram4j.requests.payload.InstagramFeedItem;
import org.brunocvcunha.instagram4j.requests.payload.InstagramFeedResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.jalizadeh.sbia.serviceanalyzer.model.InstagramFeedModel;
import com.jalizadeh.sbia.serviceanalyzer.model.InstagramLogModel;
import com.jalizadeh.sbia.serviceanalyzer.model.InstagramUserModel;
import com.jalizadeh.sbia.serviceanalyzer.payload.ClientPayload;
import com.jalizadeh.sbia.serviceanalyzer.payload.InstagramFeedPayload;
import com.jalizadeh.sbia.serviceanalyzer.payload.InstagramLogPayload;
import com.jalizadeh.sbia.serviceanalyzer.payload.InstagramUserPayload;
import com.jalizadeh.sbia.serviceanalyzer.repository.InstagramFeedRepository;
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
	
	@Autowired
	private InstagramFeedRepository iFeedRepository;
	
	
	long totalLikeCount = 0L;
	long totalCommentCount = 0L;
	long totalViewCount = 0L;
	long totalHashtagCount = 0L;
	long totalMentionCount = 0L;
	

	/**
	 * when a request comes from client, I should check for:
	 * 1. if is there any data of this user
	 * 		y: go to 2
	 * 		n: fetch first time data
	 * 2. is there any fresh (within 1 hour) data of user
	 * 		y: fetch from DB & return
	 * 		n: fetch new data
	 */
	@GetMapping("/analyzeByUsername/{username}")
	public ClientPayload analyzeByUsername(@PathVariable String username) {

		Date now = new Date();
		Date today000 = getMidnightHour().getTime();
		
		InstagramSearchUsernameResult scrapedUserRaw = null;
		InstagramUser scrapedUser = null;
		InstagramFeedResult scrapedFeedRaw = null;
		List<InstagramFeedPayload> feedPayloadList = null;
		List<InstagramLogModel> dbLogs = null;
		List<InstagramFeedModel> dbFeeds = null;

		InstagramUserModel dbUser = iUserRepository.findByUsername(username);

		//if the user is not in DB, so this is the first time
		if (dbUser == null) {
			logger.info("This is the first time " + username + " is fetched");
			logger.info("Fetching data for " + username);

			scrapedUserRaw = serviceScraperClient.scrapeUserByUsername(username);

			// no matching account
			if (scrapedUserRaw.getStatus().equals("fail")) {
				logger.info("No matching account is found for " + username + ". Returning NULL");
				return null;
			}

			scrapedUser = scrapedUserRaw.getUser();

			//get user's feed = posts 
			scrapedFeedRaw = serviceScraperClient.scrapeFeedByUsername(username);
			if(scrapedFeedRaw.getNum_results() > 0) {
				feedPayloadList = new ArrayList<>();
				
				//I need these data for calculating ratio and ER
				for (InstagramFeedItem feed : scrapedFeedRaw.getItems()) {
					totalLikeCount += feed.getLike_count();
					totalCommentCount += feed.getComment_count();
					totalViewCount += feed.getView_count();
					totalHashtagCount += countHashtags(feed);
					totalMentionCount += countMentions(feed);
				}
				
				for (InstagramFeedItem feed : scrapedFeedRaw.getItems()) {
					InstagramFeedModel f = convertInstagramFeedItemPayloadToModel(feed);
					feedPayloadList.add(convertInstagramFeedModelToPayload(f));
					iFeedRepository.save(f);
				}
			}
			
			InstagramUserModel convertedUser = convertScrapedUserPayloadToUserModel(scrapedUser, now);
			iUserRepository.save(convertedUser);

			InstagramLogModel newLog = createLogModelOfScrapedUser(scrapedUser, now);
			iLogRepository.save(newLog);
			
			return createFirstTimeClientPayload(convertedUser, newLog , feedPayloadList);
		}

		logger.info("The user: " + username + " already exist in DB");
		
		dbLogs = iLogRepository.findByPkOrderByLastCheckDateDesc(dbUser.getPk());
		dbFeeds = iFeedRepository.findByOwnerUsernameOrderByTakenAtAsc(username);

		// there is fresh data
		if (now.getTime() - dbUser.getLastCheckDate().getTime() < ONE_HOUR) {
			logger.info("The data is fresh, no need for new check.");
			return createClientPayload(dbUser, dbLogs, dbFeeds);
		}

		
		logger.info("Data is old, refersh data and update user & log");

		scrapedUserRaw = serviceScraperClient.scrapeUserByUsername(username);
		scrapedUser = scrapedUserRaw.getUser();
		
		//TODO: what if user doesn't exist anymore?		

		InstagramLogModel newLog = createLogModelOfScrapedUser(scrapedUser, now);
		InstagramUserModel updatedUser = convertScrapedUserPayloadToUserModel(scrapedUser, now);
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
		
		List<InstagramLogModel> allLogs = iLogRepository.findByPkOrderByLastCheckDateDesc(dbUser.getPk());
		
		scrapedFeedRaw = serviceScraperClient.scrapeFeedByUsername(username);
		if(scrapedFeedRaw.getNum_results() > 0) {
			feedPayloadList = new ArrayList<>();
			
			//I need these data for calculating ratio and ER
			for (InstagramFeedItem feed : scrapedFeedRaw.getItems()) {
				totalLikeCount += feed.getLike_count();
				totalCommentCount += feed.getComment_count();
				totalViewCount += feed.getView_count();
				totalHashtagCount += countHashtags(feed);
				totalMentionCount += countMentions(feed);
			}
			
			//delete all previous feed
			iFeedRepository.deleteByOwnerUsername(username);
			
			for (InstagramFeedItem feed : scrapedFeedRaw.getItems()) {
				InstagramFeedModel f = convertInstagramFeedItemPayloadToModel(feed);
				feedPayloadList.add(convertInstagramFeedModelToPayload(f));
				iFeedRepository.save(f);
			}
		}
		
		dbFeeds = iFeedRepository.findByOwnerUsernameOrderByTakenAtAsc(username);
		
		return createClientPayload(updatedUser, allLogs, dbFeeds);

	}

	// -----Methods-------------------

	private InstagramFeedPayload convertInstagramFeedModelToPayload(InstagramFeedModel feed) {
		return new InstagramFeedPayload(feed.getPk(), feed.getTakenAt(), feed.getCode(), 
				feed.getLikeCount(), feed.getLikeRatio(), 
				feed.getCommentCount(), feed.getCommentRatio(), 
				feed.getViewCount(), feed.getViewRatio(), 
				feed.getCaptionHashtagCount(), feed.getCaptionHashtagRatio(), 
				feed.getCaptionMentionCount(), feed.getCaptionMentionRatio());
	}
	
	
	private InstagramLogPayload convertInstagramLogModelToPayload(InstagramLogModel log) {
		return new InstagramLogPayload(log.getPk(), log.getUsername(), log.getFollowers(),
				log.getFollowings(), log.getUploads(), log.getLastCheckDate());
	}
		
	private InstagramFeedModel convertInstagramFeedItemPayloadToModel(InstagramFeedItem feed) {
		
		long hashtagCount = countHashtags(feed);
		long mentionCount = countMentions(feed);
		
		return new InstagramFeedModel(null, 
				feed.getPk(), feed.getUser().getPk(), feed.getUser().getUsername(), 
				new Date(feed.getTaken_at() * 1000),
				new Long(feed.getMedia_type()), feed.getCode(), 
				new Long(feed.getLike_count()), calculateRatio(feed, 1),
				new Long(feed.getComment_count()), calculateRatio(feed, 2), 
				new Long(feed.getView_count()), calculateRatio(feed, 3), 
				feed.isHas_audio(), feed.getVideo_duration(), 
				feed.getLng(), feed.getLat(), 
				new Long(feed.getOriginal_width()), new Long(feed.getOriginal_height()),
				feed.getCaption().getText(),
				hashtagCount, calculateTMRatio(hashtagCount, 1),
				mentionCount, calculateTMRatio(mentionCount, 2),
				new Long(feed.getCaption().getType()), feed.getCaption().getContent_type(),
				feed.getCaption().getStatus(),feed.isCaption_is_edited(),
				feed.isComment_likes_enabled(), feed.isComments_disabled(),
				feed.isCan_viewer_reshare(), feed.isCan_viewer_save(),
				new Date());  
	}
	
	public float calculateRatio(InstagramFeedItem feed, int type) {
		switch (type) {
		case 1:
			if(totalLikeCount == 0) return 0.0f;
			return ((float) feed.getLike_count() / totalLikeCount) * 100;
		case 2:
			if(totalCommentCount == 0) return 0.0f;
			return ((float) feed.getComment_count() / totalCommentCount) * 100;
		case 3:
			if(totalViewCount == 0) return 0.0f;
			return ((float) feed.getView_count() / totalViewCount) * 100;
		default:
			return 0.0f;
		}
	}
	
	public float calculateTMRatio(long x, int type) {
		switch (type) {
		case 1:
			if(totalHashtagCount == 0) return 0.0f;
			return ((float) x / totalHashtagCount) * 100;
		case 2:
			if(totalMentionCount == 0) return 0.0f;
			return ((float) x / totalMentionCount) * 100;
		default:
			return 0.0f;
		}
	}
	
	public long countHashtags(InstagramFeedItem feed) {
		Pattern p = Pattern.compile("#\\S+");
	    List<String> hashTags = new ArrayList<>();
	    Matcher matcher = p.matcher(feed.getCaption().getText());
	    while (matcher.find()) hashTags.add(matcher.group(0));
		return hashTags.size();
	}
	
	public long countMentions(InstagramFeedItem feed) {
		Pattern p = Pattern.compile("@\\S+");
	    List<String> mentions = new ArrayList<>();
	    Matcher matcher = p.matcher(feed.getCaption().getText());
	    while (matcher.find()) mentions.add(matcher.group(0));
		return mentions.size();
	}
	

	//Models should be converted to payloads
	private ClientPayload createClientPayload(InstagramUserModel user, 
			List<InstagramLogModel> dbLogs, List<InstagramFeedModel> dbFeeds) {
		List<InstagramLogPayload> logList = new ArrayList<>();
		List<InstagramFeedPayload> feedList = new ArrayList<>();
		
		for (InstagramLogModel log : dbLogs) {
			logList.add(convertInstagramLogModelToPayload(log));
		}
		
		for (InstagramFeedModel feed : dbFeeds) {
			feedList.add(convertInstagramFeedModelToPayload(feed));			
		}

		return new ClientPayload(convertUserModelToPayload(user), logList, feedList);
	}

	
	// If this is the first time that this profile is checked, there is only 1 log
	// available
	private ClientPayload createFirstTimeClientPayload(InstagramUserModel user, 
			InstagramLogModel log, List<InstagramFeedPayload> feedPayloadList) {
		List<InstagramLogPayload> logList = new ArrayList<>();
		logList.add(convertInstagramLogModelToPayload(log));

		//reverse the list to be ordered by date
		Collections.reverse(feedPayloadList);
		
		return new ClientPayload(convertUserModelToPayload(user), logList, feedPayloadList);
	}

	

	private InstagramUserPayload convertUserModelToPayload(InstagramUserModel user) {
		return new InstagramUserPayload(user.getPk(), user.getUsername(), user.getFullName(), user.isPrivate(),
				user.isVerified(), user.isBusiness(), new Long(user.getFollowers()), new Long(user.getFollowings()),
				new Long(user.getUploads()), new Long(user.getUsertags()), user.getBiography(), user.getCategory(),
				user.getExternalUrl(), user.getPhoneCountryCode(), user.getPhoneNumber(), user.getEmail(),
				user.getStreet(), user.getCity(), user.getZip(), user.getLatitude(), user.getLongitude(),
				user.getProfilePicUrl(), user.getHdProfilePicUrl(), user.getLastCheckDate());
	}

	private InstagramLogModel createLogModelOfScrapedUser(InstagramUser user, Date newCheckDate) {
		return new InstagramLogModel(user.getPk(), user.getUsername(), new Long(user.getFollower_count()),
				new Long(user.getFollowing_count()), new Long(user.getMedia_count()), newCheckDate);
	}

	private InstagramUserModel convertScrapedUserPayloadToUserModel(InstagramUser user, Date newCheckDate) {
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
