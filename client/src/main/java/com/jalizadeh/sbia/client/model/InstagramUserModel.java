package com.jalizadeh.sbia.client.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="instagram_users")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class InstagramUserModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(unique=true)
	private long pk;
	
	@Column(unique=true)
	private String username;
	
	@Column(name="full_name")
	private String fullName;

	@Column(name="is_private")
	private boolean isPrivate;
	
	@Column(name="is_verified")
    private boolean isVerified;
	
	@Column(name="is_business")
    private boolean isBusiness;

    private long followers;
    private long followings;
    private long uploads;
    private long usertags;

    private String biography;
    private String category;
    
    @Column(name="external_url")
    private String externalUrl;
    
    @Column(name="phone_country_code")
    private String phoneCountryCode;
    
    @Column(name="phone_number")
    private String phoneNumber;
    
    private String email;
    private String street;
    private String city;
    private String zip;
    private float latitude;
    private float longitude;
    
    @Column(name="profile_pic_url")
    private String profilePicUrl;
    
    @Column(name="hd_profile_pic_url")
    private String hdProfilePicUrl;
    
    @Column(name="last_check_date")
    private Date lastCheckDate;
}
