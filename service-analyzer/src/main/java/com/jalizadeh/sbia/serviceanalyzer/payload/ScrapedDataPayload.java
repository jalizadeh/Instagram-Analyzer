package com.jalizadeh.sbia.serviceanalyzer.payload;

import org.brunocvcunha.instagram4j.requests.payload.InstagramFeedResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;

import lombok.Data;

@Data
public class ScrapedDataPayload {

	private InstagramSearchUsernameResult user;
	private InstagramFeedResult feed;

}
