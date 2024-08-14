package com.resfes.trustscore.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class ReCaptchaServiceImplement implements ReCaptchaService{
    @Value("${recaptcha.secretkey}")
    private String privateKey;
    @Value("${recaptcha.sitekey}")
    private String siteKey;
    RestTemplate restTemplate = new RestTemplate();

    @Override
    public boolean verifyReCaptcha(String recaptchaResponse) {
        String url = "https://www.google.com/recaptcha/api/siteverify";
        String params = "?secret=" + privateKey +"&response="+ recaptchaResponse;
        ResponseEntity<String> response = restTemplate.getForEntity(url + params, String.class);

        return !response.getBody().contains("false");
    }

    @Override
    public String getSiteKey() {
        return siteKey;
    }
}
