package com.jalizadeh.sbia.serviceanalyzer.request;

import org.brunocvcunha.instagram4j.requests.payload.InstagramFeedResult;
import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import feign.FeignException;
import feign.hystrix.FallbackFactory;

@FeignClient(name="service-scraper", fallbackFactory=ScraperFallbackFactory.class)
public interface ScraperServiceFeignClient {

	@GetMapping("/scrapeUserByUsername/{username}")
	public InstagramSearchUsernameResult scrapeUserByUsername(@PathVariable String username);
	
	@GetMapping("/scrapeFeedByUsername/{username}")
	public InstagramFeedResult scrapeFeedByUsername(@PathVariable String username);
}

@Component
class ScraperFallbackFactory implements FallbackFactory<ScraperServiceFeignClient>{

	@Override
	public ScraperServiceFeignClient create(Throwable cause) {
		return new ScraperServiceClientFallback(cause);
	}
}


class ScraperServiceClientFallback implements ScraperServiceFeignClient{
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	Environment env;
	
	private final Throwable cause;
	
	public ScraperServiceClientFallback(Throwable cause) {
		this.cause = cause;
	}

	@Override
	public InstagramSearchUsernameResult scrapeUserByUsername(String username) {
		if(cause instanceof FeignException && ((FeignException) cause).status() == 404) {
			logger.error(env.getProperty("spring.application.name") + " > 404 ERROR > scrapeUserByUsername("
					 + username + ") . Error message: " + cause.getLocalizedMessage());
		} else {
			logger.error(env.getProperty("spring.application.name") + " > Unknown ERROR > scrapeUserByUsername(" 
					+ username + ") . Error message: " + cause.getLocalizedMessage());
		}
		
		return null;
	}

	@Override
	public InstagramFeedResult scrapeFeedByUsername(String username) {
		if(cause instanceof FeignException && ((FeignException) cause).status() == 404) {
			logger.error(env.getProperty("spring.application.name") + " > 404 ERROR > scrapeFeedByUsername("
					 + username + ") . Error message: " + cause.getLocalizedMessage());
		} else {
			logger.error(env.getProperty("spring.application.name") + " > Unknown ERROR > scrapeFeedByUsername(" 
					+ username + ") . Error message: " + cause.getLocalizedMessage());
		}
		
		return null;
	}
	
}