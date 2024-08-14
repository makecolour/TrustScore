package com.resfes.trustscore.model;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
@Data
public class Application {

    @Value("${output-folder}")
    private String outputFolder;

    @Value("${input-folder}")
    private String inputFolder;

    @Value("${node-file}")
    private String nodeFile;

    @Value("${link-file}")
    private String linkFile;

    @Value("${key}")
    private String password;

    @Value("${classpath.resultDir}")
    private String resultDir;

    @Value("${classpath.rawDir}")
    private String rawDir;

    @Value("${facebook.token}")
    private String facebookToken;

    @Value("${FUHL}")
    private String fuhl;

    @Value("${comments_file}")
    private String commentsFile;

    @Value("${admin.email}")
    private String email;

    @Value("${spring.mail.username}")
    private String mailUsername;
}