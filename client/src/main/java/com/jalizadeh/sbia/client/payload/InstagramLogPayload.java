package com.jalizadeh.sbia.client.payload;

import java.util.Date;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class InstagramLogPayload {
	private Long instagramUserId;
	
	private String instagramUsername;
	
	private Long followers;
	
	private Long followings;
	
	private Long uploads;
	
	private Date lastCheckDate;
}
