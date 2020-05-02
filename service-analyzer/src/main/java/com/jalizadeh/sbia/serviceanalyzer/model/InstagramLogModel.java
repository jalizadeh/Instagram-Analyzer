package com.jalizadeh.sbia.serviceanalyzer.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name="instagram_logs")
@Data
@NoArgsConstructor
public class InstagramLogModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private Long pk;
	
	private String username;
	
	private Long followers;
	
	private Long followings;
	
	private Long uploads;
	
	@Column(name="last_check_date")
	private Date lastCheckDate;

	public InstagramLogModel(Long pk, String instagramUsername, Long followers, 
			Long followings, Long uploads, Date lastCheckDate) {
		super();
		this.pk = pk;
		this.username = instagramUsername;
		this.followers = followers;
		this.followings = followings;
		this.uploads = uploads;
		this.lastCheckDate = lastCheckDate;
	}
}