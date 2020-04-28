package com.jalizadeh.sbia.servicescraper.dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="instagram_logs")
@Getter
@Setter
@Builder
public class InstagramLogsDao {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(unique = true)
	private Long instagram_userid;
	
	@Column(unique = true)
	private String instagram_username;
	
	private Long followers;
	
	private Long followings;
	
	private Long uploads;
	
	private Date last_check_date;
	
}
