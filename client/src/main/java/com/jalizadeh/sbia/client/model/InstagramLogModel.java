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
@Table(name="instagram_logs")
@Data
@NoArgsConstructor
@AllArgsConstructor
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
}