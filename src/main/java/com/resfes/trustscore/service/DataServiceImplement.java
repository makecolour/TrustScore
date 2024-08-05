package com.resfes.trustscore.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.resfes.trustscore.model.Application;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;

@Service
public class DataServiceImplement implements DataService{

    private final Application application;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public DataServiceImplement(Application application) {
        this.application = application;
    }

    @Override
    public List<JsonNode> top10Users() {
        List<JsonNode> top10Nodes = new ArrayList<>();
        try {
            // Read the JSON file into a list of JsonNodes
            List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));
            // Sort the list in descending order based on the first_combine field
            nodes.sort(Comparator.comparing((JsonNode node) -> {
                if (node.has("first_combine") && !node.get("first_combine").isNull()) {
                    return node.get("first_combine").asDouble();
                } else {
                    return 0.0;
                }
            }).reversed());
            // Get the first 10 objects
            top10Nodes = nodes.subList(0, 10);

        } catch (IOException e) {
            e.printStackTrace();
        }
        return top10Nodes;
    }

    @Override
    public JsonNode getUser(String owner) {
        ObjectMapper objectMapper = new ObjectMapper();
        JsonNode user = null;
        try {
            // Read the JSON file into a list of JsonNodes
            List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));
            // Find the object with the given owner
            user = nodes.stream().filter(node -> node.get("owner").asText().equals(owner)&&node.get("group").toString().contains("service_provider")).findFirst().orElse(null);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public List<JsonNode> getObjectsWithId() throws IOException {
        List<JsonNode> objectsWithId = new ArrayList<>();
        JsonNode rootNode = objectMapper.readTree(new File(application.getOutputFolder()+application.getNodeFile()));

        if (rootNode.isArray()) {
            for (JsonNode node : rootNode) {
                if (node.has("id")) {
                    objectsWithId.add(node);
                }
            }
        }
        return objectsWithId;
    }

    @Override
    public Page<JsonNode> getAllObjects(int page, int size) throws IOException {
        List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));
        // Filter the nodes to include only those that have first_combine
        nodes = nodes.stream()
                .filter(node -> node.has("first_combine") && !node.get("first_combine").isNull()&&node.get("group").toString().contains("service_provider"))
                .collect(Collectors.toList());

        // Sort the nodes in descending order based on the first_combine field
        nodes.sort(Comparator.comparing((JsonNode node) -> {
            if (node.has("first_combine") && !node.get("first_combine").isNull()) {
                return node.get("first_combine").asDouble();
            } else {
                return 0.0;
            }
        }).reversed());

        int start = Math.min(page * size, nodes.size());
        int end = Math.min((page + 1) * size, nodes.size());
        List<JsonNode> sublist = nodes.subList(start, end);
        Page<JsonNode> pageOfNodes = new PageImpl<>(sublist, PageRequest.of(page, size), nodes.size());
        return pageOfNodes;
    }

    @Override
    public Page<JsonNode> searchObjects(String query, int page, int size) throws IOException {
        // Get all objects
        List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));

        // Filter the nodes based on the query
        nodes = nodes.stream()
                .filter(node -> node.has("first_combine") && !node.get("first_combine").isNull() && node.toString().contains(query)&&node.get("group").toString().contains("service_provider"))
                .collect(Collectors.toList());

        // Create a Page object from the filtered list
        int start = Math.min(page * size, nodes.size());
        int end = Math.min((page + 1) * size, nodes.size());
        List<JsonNode> sublist = nodes.subList(start, end);
        Page<JsonNode> pageOfNodes = new PageImpl<>(sublist, PageRequest.of(page, size), nodes.size());

        return pageOfNodes;
    }

    @Override
    public JsonNode getTopUser() throws IOException {
        List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));
        // Filter the nodes to include only those that have first_combine
        nodes = nodes.stream()
                .filter(node -> node.has("first_combine") && !node.get("first_combine").isNull()&&node.get("group").toString().contains("service_provider"))
                .collect(Collectors.toList());

        // Sort the nodes in descending order based on the first_combine field
        nodes.sort(Comparator.comparing((JsonNode node) -> {
            if (node.has("first_combine") && !node.get("first_combine").isNull()) {
                return node.get("first_combine").asDouble();
            } else {
                return 0.0;
            }
        }).reversed());

        return nodes.get(0);
    }

    @Override
    public List<JsonNode> getTopUsers(int n) throws IOException {
        List<JsonNode> top10Nodes = new ArrayList<>();
        try {
            // Read the JSON file into a list of JsonNodes
            List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));
            // Sort the list in descending order based on the first_combine field
            nodes = nodes.stream()
                    .filter(node -> node.has("first_combine") && !node.get("first_combine").isNull() && node.get("group").toString().contains("service_provider"))
                    .sorted(Comparator.comparingDouble(node -> - node.get("first_combine").asDouble()))
                    .collect(Collectors.toList());

            if (n > nodes.size()) {
                top10Nodes = nodes;
            } else {
                top10Nodes = nodes.subList(0, n);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return top10Nodes;
    }

    @Override
    public List<Map<String, Object>> getInteract(JsonNode node) {
        List<Map<String, Object>> attributes = new ArrayList<>();

        Map<String, String> nameValueMap = new HashMap<>();
        nameValueMap.put("Ask for services", "total_ask_for_service");
        nameValueMap.put("Bad", "total_bad");
        nameValueMap.put("Good", "total_good");
        nameValueMap.put("Non related", "total_non_related");


        for (String attributeName : nameValueMap.keySet()) {
            Map<String, Object> attributeMap = new HashMap<>();
            attributeMap.put("name", attributeName);
            attributeMap.put("value", node.get(nameValueMap.get(attributeName)).asInt());
            attributes.add(attributeMap);
        }

        return attributes;
    }

    @Override
    public List<Map<String, Object>> getReact(JsonNode node) {
        List<Map<String, Object>> attributes = new ArrayList<>();

        Map<String, String> nameValueMap = new HashMap<>();
        nameValueMap.put("Love", "num_loves");
        nameValueMap.put("Haha", "num_hahas");
        nameValueMap.put("Like", "num_likes");
        nameValueMap.put("Care", "num_cares");
        nameValueMap.put("Angry", "num_angries");
        nameValueMap.put("Sad", "num_sads");
        nameValueMap.put("Wow", "num_wows");

        for (String attributeName : nameValueMap.keySet()) {
            Map<String, Object> attributeMap = new HashMap<>();
            attributeMap.put("name", attributeName);
            attributeMap.put("value", node.get("properties").get(nameValueMap.get(attributeName)).asInt());
            attributes.add(attributeMap);
        }

        return attributes;
    }

    @Override
    public List<Map<String, Object>> getScores(JsonNode node) {
        List<Map<String, Object>> attributes = new ArrayList<>();

        Map<String, String> nameValueMap = new HashMap<>();
        nameValueMap.put("Degree Centrality", "degree_centrality");
        nameValueMap.put("Closeness Centrality", "closeness_centrality");
        nameValueMap.put("Betweeness Centrality", "betweenness_centrality");


        for (String attributeName : nameValueMap.keySet()) {
            Map<String, Object> attributeMap = new HashMap<>();
            attributeMap.put("name", attributeName);
            attributeMap.put("value", node.get(nameValueMap.get(attributeName)).asDouble());
            attributes.add(attributeMap);
        }

        return attributes;
    }

    @Override
    public List<JsonNode> getComments(String owner) throws IOException {
        List<JsonNode> comments = new ArrayList<>();
        JsonNode rootNode = objectMapper.readTree(new File(application.getInputFolder()+application.getCommentsFile()));

        if (rootNode.isArray()) {
            for (JsonNode node : rootNode) {
                if (node.has("owner") && node.get("owner").asText().equalsIgnoreCase(owner)) {
                    comments.add(node);
                }
            }
        }
        return comments;
    }


}
