package com.jalizadeh.sbia.serviceanalyzer;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.openfeign.EnableFeignClients;
import org.springframework.context.annotation.Bean;

import com.jalizadeh.sbia.serviceanalyzer.utility.FeignErrorDecoder;

import feign.Logger;

@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
public class ServiceAnalyzerApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServiceAnalyzerApplication.class, args);
	}

	
	@Bean
	Logger.Level feignLoggerLevel(){
		return Logger.Level.FULL;
	}
	
	@Bean
	public FeignErrorDecoder getFeignErrorDecoder() {
		return new FeignErrorDecoder();
	}
}
