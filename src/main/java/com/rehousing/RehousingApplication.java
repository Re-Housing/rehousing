package com.rehousing;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableAsync;

@EnableAsync
@SpringBootApplication
public class RehousingApplication {

    public static void main(String[] args) {
        SpringApplication.run(RehousingApplication.class, args);
    }

}
