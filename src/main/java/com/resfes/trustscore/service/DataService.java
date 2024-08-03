package com.resfes.trustscore.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.node.ArrayNode;
import org.springframework.data.domain.Page;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public interface DataService {
    List<JsonNode> top10Users();
    JsonNode getUser(String owner);
    List<JsonNode> getObjectsWithId() throws IOException;
    Page<JsonNode> getAllObjects(int page, int size) throws IOException;
    Page<JsonNode> searchObjects(String query, int page, int size) throws IOException ;
    JsonNode getTopUser() throws IOException;
    List<JsonNode> getTopUsers(int n) throws IOException;
    List<Map<String, Object>> getAttributes(JsonNode node);

}
