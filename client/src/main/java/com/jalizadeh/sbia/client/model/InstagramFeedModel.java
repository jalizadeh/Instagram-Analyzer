package com.jalizadeh.sbia.client.model;

import java.util.Date;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class InstagramFeedModel {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	private long pk;

	private Date takenAt;
    
    private String code;
    
    private long likeCount;
    private float likeRatio;
    
    private long commentCount;
    private float commentRatio;
    
    private long viewCount;
    private float viewRatio;
    
    private long captionHashtagCount;
    private float captionHashtagRatio;
    
    private long captionMentionCount;
    private float captionMentionRatio;
    
}
