package com.resfes.trustscore.service;

import com.fasterxml.jackson.databind.JsonNode;
import org.springframework.data.domain.Page;

import java.io.IOException;
import java.util.List;

public interface DataService {
    List<JsonNode> top10Users();
    JsonNode getUser(String owner);
    List<JsonNode> getObjectsWithId() throws IOException;
    Page<JsonNode> getAllObjects(int page, int size) throws IOException;
    Page<JsonNode> searchObjects(String query, int page, int size) throws IOException ;
    JsonNode getTopUser() throws IOException;
}
