package com.resfes.trustscore.controller;

import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.service.EmailService;
import com.resfes.trustscore.service.ReCaptchaService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.MissingServletRequestParameterException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@AllArgsConstructor
@Controller
public class ContactController {
    private final Application application;

    private final EmailService emailService;

    private final ReCaptchaService reCaptchaService;


    @GetMapping("/contact")
    public ModelAndView showContactForm(@RequestParam(required = false, defaultValue = "") String email) {
        ModelAndView mav = new ModelAndView("contact");
        mav.addObject("guestEmail", email);
        mav.addObject("email", application.getEmail());
        mav.addObject("siteKey", reCaptchaService.getSiteKey());
        return mav;
    }

    @PostMapping("/contact")
    public ModelAndView contact(@RequestParam(required = true) String name, @RequestParam(required = true) String email, @RequestParam(required = true) String phone, @RequestParam(required = true) String subject, @RequestParam(required = true) String message, @RequestParam(name="g-recaptcha-response") String recaptchaResponse) {
        // Verify the reCAPTCHA response
        ModelAndView mav = new ModelAndView("contact");
        mav.addObject("email", application.getEmail());
        mav.addObject("siteKey", reCaptchaService.getSiteKey());
        if(!reCaptchaService.verifyReCaptcha(recaptchaResponse)) {
            mav.addObject("type", "error");
            mav.addObject("msg", "Invalid reCAPTCHA. Please try again.");
            return mav;
        }

        try {
            emailService.sendSMTP(subject, "Contact from " + name + "\nName: " + name + "\nEmail: " + email + "\nPhone: " + phone + "\nSubject: " + subject + "\nMessage: " + message );
            mav.addObject("type", "success");
            mav.addObject("msg", "Email sent successfully");
        } catch (Exception e) {
            mav.addObject("type", "error");
            mav.addObject("msg", "Error when sending email: " + e.getMessage());
        }

        return mav;
    }

    @ExceptionHandler(MissingServletRequestParameterException.class)
    public ModelAndView handleMissingParams(MissingServletRequestParameterException ex) {
        ModelAndView mav = new ModelAndView("contact");
        mav.addObject("email", application.getEmail());
        mav.addObject("type", "error");
        mav.addObject("msg", "You must fill all the fields");
        mav.addObject("siteKey", reCaptchaService.getSiteKey());
        return mav;
    }
}
