package com.resfes.trustscore.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.service.DataService;
import com.resfes.trustscore.service.MergeService;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

@RestController
@RequestMapping("/api")
public class JsonController {

    private final MergeService mergeService;
    private final Application application;
    private final DataService data;

    public JsonController(MergeService mergeService, Application application, DataService data) {
        this.mergeService = mergeService;
        this.application = application;
        this.data = data;
    }
    
    @RequestMapping(value = "/mergeAll", method = RequestMethod.GET)
    public ResponseEntity<String> mergeJsonFiles(@RequestParam String key) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        if(mergeService.checkKey(key)){
            mergeService.mergeJsonFiles();
            mergeService.transformAndWriteLinks();
            return new ResponseEntity<>("Files merged successfully", headers, HttpStatus.OK);
        }
        return new ResponseEntity<>("Invalid key", headers, HttpStatus.OK);
    }



    @RequestMapping(value = "/node", method = RequestMethod.GET)
    public ResponseEntity<String> getNodeJsonFile() throws IOException {
       return getJsonFile(application.getNodeFile());
    }

    @RequestMapping(value = "/link", method = RequestMethod.GET)
    public ResponseEntity<String> getLinkJsonFile() throws IOException {
        return getJsonFile(application.getLinkFile());
    }

    private ResponseEntity<String> getJsonFile(String file) throws IOException {
        Resource resource = new FileSystemResource(application.getOutputFolder()+file);
        Path path = resource.getFile().toPath();
        String content = Files.readString(path);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");

        return new ResponseEntity<>(content, headers, HttpStatus.OK);
    }

    @GetMapping("/top10")
    public ResponseEntity<String> top10Users() throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.top10Users()), headers, HttpStatus.OK);
    }

    @GetMapping("/profile")
    public ResponseEntity<String> getUser(@RequestParam String owner) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.getUser(owner)), headers, HttpStatus.OK);
    }

    @GetMapping("/objects")
    public ResponseEntity<String> getObjectsWithId() throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.getObjectsWithId()), headers, HttpStatus.OK);
    }

}
