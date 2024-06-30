package com.resfes.trustscore.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.resfes.trustscore.model.Application;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.List;
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
            // Sort the list in descending order based on the old_page_rank field
            nodes.sort(Comparator.comparing((JsonNode node) -> {
                if (node.has("old_page_rank") && !node.get("old_page_rank").isNull()) {
                    return node.get("old_page_rank").asDouble();
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
            user = nodes.stream().filter(node -> node.get("owner").asText().equals(owner)).findFirst().orElse(null);
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
        // Filter the nodes to include only those that have old_page_rank
        nodes = nodes.stream()
                .filter(node -> node.has("old_page_rank") && !node.get("old_page_rank").isNull())
                .collect(Collectors.toList());

        // Sort the nodes in descending order based on the old_page_rank field
        nodes.sort(Comparator.comparing((JsonNode node) -> {
            if (node.has("old_page_rank") && !node.get("old_page_rank").isNull()) {
                return node.get("old_page_rank").asDouble();
            } else {
                return 0.0;
            }
        }).reversed());

        int start = (int) Math.min(page * size, nodes.size());
        int end = (int) Math.min((page + 1) * size, nodes.size());
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
                .filter(node -> node.has("old_page_rank") && !node.get("old_page_rank").isNull() && node.toString().contains(query))
                .collect(Collectors.toList());

        // Create a Page object from the filtered list
        int start = (int) Math.min(page * size, nodes.size());
        int end = (int) Math.min((page + 1) * size, nodes.size());
        List<JsonNode> sublist = nodes.subList(start, end);
        Page<JsonNode> pageOfNodes = new PageImpl<>(sublist, PageRequest.of(page, size), nodes.size());

        return pageOfNodes;
    }

    @Override
    public JsonNode getTopUser() throws IOException {
        List<JsonNode> nodes = Arrays.asList(objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), JsonNode[].class));
        // Filter the nodes to include only those that have old_page_rank
        nodes = nodes.stream()
                .filter(node -> node.has("old_page_rank") && !node.get("old_page_rank").isNull())
                .collect(Collectors.toList());

        // Sort the nodes in descending order based on the old_page_rank field
        nodes.sort(Comparator.comparing((JsonNode node) -> {
            if (node.has("old_page_rank") && !node.get("old_page_rank").isNull()) {
                return node.get("old_page_rank").asDouble();
            } else {
                return 0.0;
            }
        }).reversed());

        return nodes.get(0);
    }

}
