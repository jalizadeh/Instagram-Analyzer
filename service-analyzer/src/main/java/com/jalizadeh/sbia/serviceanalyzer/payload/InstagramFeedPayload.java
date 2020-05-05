package com.jalizadeh.sbia.serviceanalyzer.payload;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class InstagramFeedPayload {

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
