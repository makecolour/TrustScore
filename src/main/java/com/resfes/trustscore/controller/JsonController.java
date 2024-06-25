package com.resfes.trustscore.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.service.DatabaseService;
import com.resfes.trustscore.service.MergeService;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
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
    private final DatabaseService databaseService;
    private final Application application;

    public JsonController(MergeService mergeService, DatabaseService databaseService, Application application) {
        this.mergeService = mergeService;
        this.databaseService = databaseService;
        this.application = application;
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

    @RequestMapping(value = "/database", method = RequestMethod.GET)
    public ResponseEntity<String> convertJsonToDatabase(@RequestParam String key) {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        if(mergeService.checkKey(key)){
            databaseService.convertJsonToDatabase();
            return new ResponseEntity<>("JSON data saved to database successfully", headers, HttpStatus.OK);
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


}
