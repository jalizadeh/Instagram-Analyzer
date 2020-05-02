package com.jalizadeh.sbia.client.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name="instagram_logs")
@Getter
@Setter
@NoArgsConstructor
public class InstagramLogModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(unique = true, name="instagram_userid")
	private Long instagramUserId;
	
	@Column(unique = true, name="instagram_username")
	private String instagramUsername;
	
	private Long followers;
	
	private Long followings;
	
	private Long uploads;
	
	@Column(name="last_check_date")
	private Date lastCheckDate;

	public InstagramLogModel(Long instagramUserId, String instagramUsername, Long followers, 
			Long followings, Long uploads, Date lastCheckDate) {
		super();
		this.instagramUserId = instagramUserId;
		this.instagramUsername = instagramUsername;
		this.followers = followers;
		this.followings = followings;
		this.uploads = uploads;
		this.lastCheckDate = lastCheckDate;
	}
}