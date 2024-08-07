package com.resfes.trustscore.controller;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.service.DataService;
import com.resfes.trustscore.service.FileService;
import lombok.AllArgsConstructor;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.Map;

@CrossOrigin(origins = "*", allowedHeaders = "*")
@AllArgsConstructor
@org.springframework.web.bind.annotation.RestController
@RequestMapping("/api")
public class RestController {
    private final FileService fileService;
    private final Application application;
    private final DataService data;


    @RequestMapping("/mergeAll")
    public ResponseEntity<String> mergeJsonFiles(@RequestHeader("Authorization") String authHeader) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");

        // Extract Bearer token
        if (authHeader == null || !authHeader.startsWith("Bearer ")) {
            return new ResponseEntity<>("Unauthorized", headers, HttpStatus.UNAUTHORIZED);
        }
        String authToken = authHeader.substring(7);

        // Check authentication token
        if (!isValidToken(authToken)) {
            return new ResponseEntity<>("Unauthorized", headers, HttpStatus.UNAUTHORIZED);
        }

        // Merge files
        fileService.mergeJsonFiles();
        fileService.transformAndWriteLinks();
        return new ResponseEntity<>("Files merged successfully", headers, HttpStatus.OK);
    }

    // Method to validate the authentication token
    private boolean isValidToken(String authToken) {
        return fileService.checkKey(authToken);
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
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.getTopUsers(10)), headers, HttpStatus.OK);
    }

    @GetMapping("/topUser")
    public ResponseEntity<String> topUser(@RequestParam int n) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.getTopUsers(n)), headers, HttpStatus.OK);
    }

    @GetMapping("/profile")
    public ResponseEntity<String> getUser(@RequestParam String owner) throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.getUser(owner)), headers, HttpStatus.OK);
    }

    @GetMapping("/interacts")
    public ResponseEntity<List<Map<String, Object>>> getAttributes(@RequestParam String owner) throws IOException {
        JsonNode user = data.getUser(owner);
        List<Map<String, Object>> attributes = data.getInteract(user);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");

        return new ResponseEntity<>(attributes, headers, HttpStatus.OK);
    }

    @GetMapping("/reacts")
    public ResponseEntity<List<Map<String, Object>>> getReacts(@RequestParam String owner) throws IOException {
        JsonNode user = data.getUser(owner);
        List<Map<String, Object>> reacts = data.getReact(user);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");

        return new ResponseEntity<>(reacts, headers, HttpStatus.OK);
    }
    @GetMapping("/centrality")
    public ResponseEntity<List<Map<String, Object>>> getScores(@RequestParam String owner) throws IOException {
        JsonNode user = data.getUser(owner);
        List<Map<String, Object>> scores = data.getScores(user);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");

        return new ResponseEntity<>(scores, headers, HttpStatus.OK);
    }

    @GetMapping("/objects")
    public ResponseEntity<String> getObjectsWithId() throws IOException {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, "application/json; charset=UTF-8");
        ObjectMapper objectMapper = new ObjectMapper();
        return new ResponseEntity<>(objectMapper.writeValueAsString(data.getObjectsWithId()), headers, HttpStatus.OK);
    }


}
