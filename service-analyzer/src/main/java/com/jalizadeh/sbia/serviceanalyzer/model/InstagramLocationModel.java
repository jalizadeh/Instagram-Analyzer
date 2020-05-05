package com.jalizadeh.sbia.serviceanalyzer.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
public class InstagramLocationModel {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Long id;
	
	@Column(unique = true)
	private long pk;
	
    private String name;
    private String address;
    private String city;
    
    @Column(name="short_name")
    private String shortName;
    
    private double lat;
    private double lng;
    
    @Column(name="facebook_places_id")
    private long facebookPlacesId;
    
    @Column(name="external_source")
    private String externalSource;
}
