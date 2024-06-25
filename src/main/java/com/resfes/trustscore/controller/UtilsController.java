package com.resfes.trustscore.controller;

import com.resfes.trustscore.service.MergeService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;

@AllArgsConstructor
@Controller
@RequestMapping("/test")
public class UtilsController {

    @GetMapping("/api")
    public  ModelAndView index() {
        return new ModelAndView("api");
    }

    @GetMapping("/cdn")
    public  ModelAndView cdn() {
        return new ModelAndView("cdn");
    }

    @GetMapping("/home")
    public  ModelAndView home() {
        return new ModelAndView("home");
    }

}
