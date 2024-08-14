package com.resfes.trustscore.service;

public interface ReCaptchaService {
    boolean verifyReCaptcha(String recaptchaResponse);
    String getSiteKey();
}
