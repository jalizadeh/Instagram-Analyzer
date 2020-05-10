package com.jalizadeh.sbia.servicescraper;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;

import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.CookieStore;
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

	/*
	 * At each server restart, it tries to login & create a new session
	 * 
	@Bean
	public Instagram4j initInstagram4j() throws ClientProtocolException, IOException {
		Instagram4j instagram = Instagram4j.builder()
				.username(USERNAME)
				.password(env.getProperty("instagram.password"))
				.build();
		instagram.setup();
		instagram.login();
		return instagram;
	}
	*/
	
	/**
	 * For avoiding multiple logins, we need to store one login session as a cookie file 
	 * and for the later logins, we use it to setup the session
	 * 
	 * If it is your first login, uncomment this method `setupCookie`, and use it to store session.
	 * Then comment this method, and use the method `loginWithCookie`
	 * 
	 * ~ DON'T SHARE YOUR COOKIE ~
	 */
	/*
	@Bean
	public Instagram4j setupCookie() throws ClientProtocolException, IOException {
		Instagram4j instagram = Instagram4j.builder()
				.username(env.getProperty("instagram.username"))
				.password(env.getProperty("instagram.password"))
				.build();
		instagram.setup();
		instagram.login();
		
	    ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("login.cookie"));
	    oos.writeObject(instagram.getCookieStore());
	    oos.close();
		
		return instagram;
	}
	*/
	
	/**
	 * After the first login, the session is stored on local storage, so no need for
	 * new login session & prevents account ban
	 * 
	 * ~ DON'T SHARE YOUR COOKIE ~
	 */
	@Bean
	public Instagram4j loginWithCookie() throws ClientProtocolException, IOException, ClassNotFoundException {
		ObjectInputStream ois = new ObjectInputStream(new FileInputStream("login.cookie"));
	    CookieStore cookieStore = (CookieStore) ois.readObject();
	    ois.close();
	    
	    Instagram4j instagram = Instagram4j.builder()
	    		.username(env.getProperty("instagram.username"))
	            .password(env.getProperty("instagram.password"))
	            //.uuid(instagram.getUuid())
	            .cookieStore(cookieStore)
	            .build();
	    instagram.setup();
	    
	    return instagram;
	}
	
}
