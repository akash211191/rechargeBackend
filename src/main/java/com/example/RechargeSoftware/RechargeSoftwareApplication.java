package com.example.RechargeSoftware;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.orm.jpa.HibernateJpaAutoConfiguration;
import org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication(exclude = {SecurityAutoConfiguration.class,HibernateJpaAutoConfiguration.class})
public class RechargeSoftwareApplication extends SpringBootServletInitializer {
	
	@Override
	   protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(RechargeSoftwareApplication.class);
	   }

	
	public static void main(String[] args) {
		System.setProperty("spring.devtools.restart.enabled", "true");
		SpringApplication.run(RechargeSoftwareApplication.class, args);
	}

}
