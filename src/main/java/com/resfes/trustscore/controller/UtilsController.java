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
        modelAndView.addObject("email", application.getEmail());
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
        List<JsonNode> comments = new ArrayList<>();
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

        for(String name:namesList){
            comments.addAll(dataService.getComments(name));
        }

        modelAndView.addObject("comments", comments);
        modelAndView.addObject("ownersList", ownersList);
        modelAndView.addObject("namesList", namesList);
        modelAndView.addObject("FUHL", application.getFuhl());
        modelAndView.addObject("email", application.getEmail());
        modelAndView.addObject("object", user);
        return modelAndView;
    }


    @RequestMapping("/list")
    public ModelAndView list(HttpSession session, @RequestParam(value = "q", required = false) String query, @RequestParam(value = "page", defaultValue = "0") int page, @RequestParam(value = "size", defaultValue = "9") int size, @RequestParam(value = "service", defaultValue = "", required = false) String service) {
        ModelAndView modelAndView = new ModelAndView("list");
        if(page < 0){
            page = 0;
        }
        if(size < 1){
            size = 1;
        }
        if(size > 100){
            size = 100;
        }

        try {
            Page<JsonNode> objects;
            if (query != null && !query.trim().isEmpty()|| service != null && !service.trim().isEmpty()) {
                if(query == null){
                    query = "";
                }
                objects = dataService.searchObjects(query, page, size, service);
            } else {
                objects = dataService.getAllObjects(page, size);
            }
            session.setAttribute("query", query);

            modelAndView.addObject("service", service);
            modelAndView.addObject("FUHL", application.getFuhl());
            modelAndView.addObject("email", application.getEmail());
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
        modelAndView.addObject("email", application.getEmail());
        return modelAndView;
    }
    @GetMapping("/presentation")
    public ModelAndView presentation() {
        ModelAndView modelAndView = new ModelAndView("slides");
        modelAndView.addObject("FUHL", application.getFuhl());
        modelAndView.addObject("email", application.getEmail());
        return modelAndView;
    }

    @GetMapping("/test")
    public ModelAndView test() {
        ModelAndView modelAndView = new ModelAndView("test");
        return modelAndView;
    }
}
