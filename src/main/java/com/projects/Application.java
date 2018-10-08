package com.projects;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

/**
 * 
* @ClassName: Application  
* @Description: springboot程序入口类
* @author mardoner-QQ:2500119268 
* @date Sep 27, 2018  
*
 */
@SpringBootApplication
@MapperScan("com.projects.mapper")
public class Application extends SpringBootServletInitializer{
	public static void main(String[] args) {
		SpringApplication.run(Application.class, args);
	}
	
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(Application.class);
	}
	
}
