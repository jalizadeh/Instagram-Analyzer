package com.jalizadeh.sbia.serviceanalyzer.payload;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class InstagramUserPayload {

	private long pk;
	private String username;
	private String fullName;

	private boolean isPrivate;
    private boolean isVerified;
    private boolean isBusiness;

    private long followers;
    private long followings;
    private long uploads;
    private long usertags;

    private String biography;
    private String category;
    private String externalUrl;
    private String phoneCountryCode;
    private String phoneNumber;
    private String email;
    private String street;
    private String city;
    private String zip;
    private float latitude;
    private float longitude;
    
    private String profilePicUrl;
    private String hdProfilePicUrl;
    
    private Date lastCheckDate;
}
