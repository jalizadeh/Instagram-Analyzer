package com.jalizadeh.sbia.client.data;

import org.brunocvcunha.instagram4j.requests.payload.InstagramSearchUsernameResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import feign.FeignException;
import feign.hystrix.FallbackFactory;

@FeignClient(name="service-scraper",fallbackFactory=ScraperFallbackFactory.class)
public interface ScraperServiceClient {

	@GetMapping("/reporter/{username}")
	public InstagramSearchUsernameResult getSearchedUser(@PathVariable String username);
}



//if there is any problem with service-scraper response 
@Component
class ScraperFallbackFactory implements FallbackFactory<ScraperServiceClient>{

	@Override
	public ScraperServiceClient create(Throwable cause) {
		return new ScraperServiceClientFallback(cause);
	}
}


class ScraperServiceClientFallback implements ScraperServiceClient{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final Throwable cause;
	
	public ScraperServiceClientFallback(Throwable cause) {
		this.cause = cause;
	}

	@Override
	public InstagramSearchUsernameResult getSearchedUser(String username) {

		if(cause instanceof FeignException && ((FeignException) cause).status() == 404) {
			logger.error("404 error took place when getSearchedUser was called with username: "
					 + username + ". Error message: "
					 + cause.getLocalizedMessage());
		} else {
			logger.error("Other error took place " + cause.getLocalizedMessage());
		}
		
		return null;
	}
	
}