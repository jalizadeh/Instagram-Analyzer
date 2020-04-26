package com.jalizadeh.sbia.servicescraper;

import java.io.IOException;

import org.apache.http.client.ClientProtocolException;
import org.brunocvcunha.instagram4j.Instagram4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.context.annotation.Bean;
import org.springframework.core.env.Environment;

@SpringBootApplication
@EnableEurekaClient
public class ServiceScraperApplication {
	
	@Autowired
	private Environment env;
	
	public static void main(String[] args) {
		SpringApplication.run(ServiceScraperApplication.class, args);
	}

	
	@Bean
	public Instagram4j initInstagram4j() throws ClientProtocolException, IOException {
		Instagram4j instagram = Instagram4j.builder()
				.username(env.getProperty("instagram.username"))
				.password(env.getProperty("instagram.password"))
				.build();
		instagram.setup();
		instagram.login();
		return instagram;
	}
}
