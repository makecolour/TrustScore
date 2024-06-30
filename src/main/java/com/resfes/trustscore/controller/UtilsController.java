package com.resfes.trustscore.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.service.DataService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@AllArgsConstructor
@Controller
@RequestMapping("")
public class UtilsController {
    private final DataService dataService;
    private final Application application;

    @GetMapping("/api")
    public  ModelAndView index() {
        return new ModelAndView("api");
    }

    @GetMapping("/cdn")
    public  ModelAndView cdn() {
        return new ModelAndView("cdn");
    }

    @RequestMapping(value = {"/", "/home", "", "/index"})
    public  ModelAndView home() {
        ModelAndView modelAndView = new ModelAndView("home");
        List<JsonNode> objects = dataService.top10Users();
        modelAndView.addObject("FUHL", application.getFuhl());
        modelAndView.addObject("objects", objects);
        modelAndView.addObject("highest", objects.get(0));
        return modelAndView;
    }

    @GetMapping("/profile")
    public ModelAndView getUser(@RequestParam String owner) throws Exception {
        ModelAndView modelAndView = new ModelAndView("profile");
        JsonNode user = dataService.getUser(owner);
        modelAndView.addObject("FUHL", application.getFuhl());
        modelAndView.addObject("object", user);
        return modelAndView;
    }


    @RequestMapping("/list")
    public ModelAndView list(HttpSession session, @RequestParam(value = "q", required = false) String query, @RequestParam(value = "page", defaultValue = "0") int page, @RequestParam(value = "size", defaultValue = "12") int size) {
        ModelAndView modelAndView = new ModelAndView("list");
        Pageable pageable = PageRequest.of(page, size); // Page is 0-indexed for PageRequest
        Page<JsonNode> objects = null;
        try {
            if (query != null && !query.isEmpty()) {
                objects = dataService.searchObjects(query, page, size); // Page is 0-indexed for searchObjects
            } else {
                objects = dataService.getAllObjects(page, size); // Page is 0-indexed for getAllObjects
            }
            modelAndView.addObject("top1", dataService.getTopUser());
            session.setAttribute("query", query);
            modelAndView.addObject("FUHL", application.getFuhl());
            modelAndView.addObject("query", query);
            modelAndView.addObject("objects", objects.getContent());
            modelAndView.addObject("currentPage", page);
            modelAndView.addObject("totalPages", objects.getTotalPages());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return modelAndView;
    }

    @GetMapping("/about")
    public ModelAndView about() {
        ModelAndView modelAndView = new ModelAndView("about");
        modelAndView.addObject("FUHL", application.getFuhl());
        return modelAndView;
    }

}
