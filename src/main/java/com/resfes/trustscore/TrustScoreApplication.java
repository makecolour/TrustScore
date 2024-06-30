package com.resfes.trustscore;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class TrustScoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(TrustScoreApplication.class, args);
    }

//    @Bean
//    public CommandLineRunner run(MergeService mergeService) throws Exception {
//        return args -> {
//            mergeService.mergeJsonFiles();
//        };
//    }
}
