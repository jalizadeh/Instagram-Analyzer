package com.jalizadeh.sbia.client.request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.jalizadeh.sbia.client.payload.ClientPayload;

import feign.FeignException;
import feign.hystrix.FallbackFactory;

@FeignClient(name="service-analyzer",fallbackFactory=AnalyzerFallbackFactory.class)
public interface AnalyzerServiceFeignClient {

	@GetMapping("/analyzeByUsername/{username}")
	public ClientPayload analyzeByUsername(@PathVariable String username);
}



//if there is any problem with service-scraper response 
@Component
class AnalyzerFallbackFactory implements FallbackFactory<AnalyzerServiceFeignClient>{

	@Override
	public AnalyzerServiceFeignClient create(Throwable cause) {
		return new AnalyzerServiceClientFallback(cause);
	}
}


class AnalyzerServiceClientFallback implements AnalyzerServiceFeignClient{

	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	Environment env;
	
	private final Throwable cause;
	
	public AnalyzerServiceClientFallback(Throwable cause) {
		this.cause = cause;
	}

	@Override
	public ClientPayload analyzeByUsername(String username) {

		if(cause instanceof FeignException && ((FeignException) cause).status() == 404) {
			logger.error(env.getProperty("spring.application.name") + " > 404 ERROR > analyzeByUsername("
					 + username + ") . Error message: " + cause.getLocalizedMessage());
		} else {
			logger.error(env.getProperty("spring.application.name") + " > Unknown ERROR > analyzeByUsername" 
					 + username + ") . Error message: " + cause.getLocalizedMessage());
		}
		
		return null;
	}
	
}