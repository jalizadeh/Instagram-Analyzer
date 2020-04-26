### Spring Boot Instagram Analyzer

A Spring Boot web application for analyzing and getting report of any public page on [Instagram](https://instagram.com/), based on **microservice** structure.


### Services

[Eureka Discovery]()
-- All services are connected to this to be discovered by one integrated service for solving load balancing issues

[Zuul API Gateway]()
-- Routes the users requests to the appropriate service

[Client]()
-- The client-side shown to the end-user

[Scraper]()
-- Scrapes information of the requested user and returns to `client`
-- At startup, it logins to Instagram server, so the `username` and `password` must be provided for the scraper user in `application.properties`.


### How To Run:

Services must be run in the following order:
1. Eureka Discovery
2. Zuul API Gateway
3. Scraper
4. Client


### Endpoints:

|  Service | URL  |
| :------------ | :------------ |
| Eureka Discovery | http://localhost:8010  |
| Zuul API Gateway  | http://localhost:8011  |
| Scraper |  http://localhost:8011/reporter/{username}  |
| Client  | http://localhost:8011/client  |


### Application Structure:

Open the file in [draw.io](https://app.diagrams.net/)


#### Project Metadata

| Meta  |  Value |
| :------------ | :------------: |
| Project | Maven Project |
| Language | Java 8 |
| Spring Boot | 2.2.6 |
| Group | com.jalizadeh.sbia |
| Artifact | service-&lt;artifact&gt; |
| Name | service-&lt;artifact&gt; |
| Description | Spring Boot Instagram Analyzer - &lt;more&gt; |
| Package name | com.jalizadeh.sbia.&lt;artifact&gt; |