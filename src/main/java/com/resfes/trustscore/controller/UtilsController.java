package com.resfes.trustscore.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.TextNode;
import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.service.DataService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.json.JSONArray;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
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
    public  ModelAndView home() throws IOException {
        ModelAndView modelAndView = new ModelAndView("home");
        List<JsonNode> objects = dataService.getTopUsers(10);
        modelAndView.addObject("FUHL", application.getFuhl());
        modelAndView.addObject("objects", objects);
        modelAndView.addObject("highest", objects.get(0));
        return modelAndView;
    }

    @GetMapping("/profile")
    public ModelAndView getUser(@RequestParam String owner) throws Exception {
        ModelAndView modelAndView = new ModelAndView("profile");
        JsonNode user = dataService.getUser(owner);
        List<String> namesList = new ArrayList<>();
        List<String> ownersList = new ArrayList<>();
        Object nameProperty = user.get("properties").get("name");
        if (nameProperty instanceof ArrayNode) {
            ArrayNode nameArray = (ArrayNode) nameProperty;
            for (int i = 0; i < nameArray.size(); i++) {
                namesList.add(nameArray.get(i).asText());
            }
        } else if (nameProperty instanceof TextNode) {
            String propertyName = nameProperty.toString().replace("\"", "").trim();
           namesList.add(propertyName);
        } else {
            System.out.println(nameProperty.getClass());
        }
        if(user.get("owner").asText().startsWith("0")){
            for(String phone:user.get("owner").asText().split(",")){
                ownersList.add(phone);
            }
        }
        modelAndView.addObject("ownersList", ownersList);
        modelAndView.addObject("namesList", namesList);
        modelAndView.addObject("FUHL", application.getFuhl());
        modelAndView.addObject("object", user);
        return modelAndView;
    }


    @RequestMapping("/list")
    public ModelAndView list(HttpSession session, @RequestParam(value = "q", required = false) String query, @RequestParam(value = "page", defaultValue = "0") int page, @RequestParam(value = "size", defaultValue = "12") int size) {
        ModelAndView modelAndView = new ModelAndView("list");// Page is 0-indexed for PageRequest
        Page<JsonNode> objects = null;
        try {
            if (query != null && !query.trim().isEmpty()) {
                objects = dataService.searchObjects(query, page, size); // Page is 0-indexed for searchObjects
            } else {
                objects = dataService.getAllObjects(page, size); // Page is 0-indexed for getAllObjects
            }
            modelAndView.addObject("top1", dataService.getTopUsers(1).get(0));
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

    @GetMapping("/test")
    public ModelAndView test() {
        ModelAndView modelAndView = new ModelAndView("test");
        return modelAndView;
    }
}
