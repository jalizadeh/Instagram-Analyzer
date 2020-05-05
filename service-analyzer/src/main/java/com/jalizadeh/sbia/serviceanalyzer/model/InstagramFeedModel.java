package com.jalizadeh.sbia.serviceanalyzer.model;

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
@Table(name="instagram_feeds")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InstagramFeedModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(unique = true)
	private long pk;
	
	@Column(name="owner_pk")
	private long ownerPk;
	
	@Column(name="owner_username")
	private String ownerUsername;
	
	@Column(name="taken_at")
	private Date takenAt;
    
    @Column(name="media_type")
    private long mediaType;
    
    @Column(unique = true)
    private String code;
    
    @Column(name="like_count")
    private long likeCount;
    
    // (this post's likes /  total likes of user page ) * 100
    @Column(name="like_ratio")
    private float likeRatio;
    
    @Column(name="comment_count")
    private long commentCount;
    
    @Column(name="comment_Ratio")
    private float commentRatio;
    
    @Column(name="view_count")
    private long viewCount;
    
    @Column(name="view_ratio")
    private float viewRatio;
    
    @Column(name="has_audio")
    private boolean hasAudio;
    
    @Column(name="video_duration")
    private double videoDuration;
    
    //@OneToOne
    //private InstagramLocationModel location;
    
    private float lng;
    private float lat;
    
    @Column(name="original_width")
    private long originalWidth;
    
    @Column(name="original_height")
    private long originalHeight;

    //private List<InstagramCarouselMediaItem> carousel_media;
    
    //private List<Object> comments;
    
    @Column(name="caption_text")
	private String captionText;
    
    @Column(name="caption_hashtag_count")
    private long captionHashtagCount;
    
    @Column(name="caption_hashtag_ratio")
    private float captionHashtagRatio;
    
    @Column(name="caption_mention_count")
    private long captionMentionCount;
    
    @Column(name="caption_mention_ratio")
    private float captionMentionRatio;
    
    @Column(name="caption_type")
	private long captionType;
    
    @Column(name="caption_content_type")
	private String captionContentType;
	
    @Column(name="caption_status")
	private String captionStatus;
    
    @Column(name="caption_is_edited")
    private boolean captionIsEdited;
    
    @Column(name="comment_likes_enabled")
    private boolean commentLikesEnabled;
    
    @Column(name="comments_disabled")
    private boolean commentsDisabled;
    
    @Column(name="can_viewer_reshare")
    private boolean canViewerReshare;
    
    @Column(name="can_viewer_save")
    private boolean canViewerSave;
    
    @Column(name="last_check_date")
    private Date lastCheckDate;
}
