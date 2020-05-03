package com.jalizadeh.sbia.client.payload;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class InstagramLogPayload {
	private Long pk;
	
	private String username;
	
	private Long followers;
	
	private Long followings;
	
	private Long uploads;
	
	private Date lastCheckDate;
}
