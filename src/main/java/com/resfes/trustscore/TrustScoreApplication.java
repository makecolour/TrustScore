package com.resfes.trustscore;

import com.resfes.trustscore.service.FileService;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class TrustScoreApplication {

    public static void main(String[] args) {
        SpringApplication.run(TrustScoreApplication.class, args);
    }

     @Bean
     public CommandLineRunner run(FileService mergeService) throws Exception {
         return args -> {
             mergeService.mergeJsonFiles();
             mergeService.transformAndWriteLinks();
         };
     }
}
