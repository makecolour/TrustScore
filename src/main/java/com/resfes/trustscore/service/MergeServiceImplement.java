package com.resfes.trustscore.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.resfes.trustscore.model.Application;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.*;

@Service
public class MergeServiceImplement implements MergeService {
    private final ResourceLoader resourceLoader;
    private final ObjectMapper objectMapper;
    private final Application application;

    public MergeServiceImplement(ResourceLoader resourceLoader, ObjectMapper objectMapper, Application application) {
        this.resourceLoader = resourceLoader;
        this.objectMapper = objectMapper;
        this.application = application;
    }

    public void mergeJsonFiles() throws IOException {
        // Load the JSON files
        Resource differentRankingResource = resourceLoader.getResource(application.getRawDir()+"different_ranking.json");
        Resource nResource = resourceLoader.getResource(application.getRawDir()+"n.json");
        Resource updateCommonInfoResource = resourceLoader.getResource(application.getRawDir()+"update_common_info.json");
        Resource userAndServiceProvideResource = resourceLoader.getResource(application.getRawDir()+"user_and_service_provide.json");
        // Read each JSON file into an ObjectNode

        // Create a new ObjectNode that will hold the combined data

        // Map the data from the original ObjectNodes to the new combined ObjectNode
        // ... (same as the previous code)
        // Create a map to hold the combined data
        Map<String, ObjectNode> combinedData = new HashMap<>();
try {
    // List of all JSON resources
    List<Resource> allResources = Arrays.asList(differentRankingResource, nResource, updateCommonInfoResource, userAndServiceProvideResource);

    for (Resource resource : allResources) {
        JsonNode jsonNode = objectMapper.readTree(resource.getInputStream());

        // Check if the root of the JSON is an array or an object
        if (jsonNode.isArray()) {
            // If it's an array, iterate over each element
            for (JsonNode element : jsonNode) {
                ObjectNode objectNode = (ObjectNode) element;
                mergeObjectNode(objectNode, combinedData);
            }
        } else if (jsonNode.isObject()) {
            // If it's an object, just cast it to an ObjectNode
            ObjectNode objectNode = (ObjectNode) jsonNode;
            mergeObjectNode(objectNode, combinedData);
        }else{
            System.out.println("Invalid JSON format");
        }
    }

    System.out.println(combinedData.values());
    // Write the combined ObjectNode back to a new JSON file
    objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
    objectMapper.writeValue(resourceLoader.getResource(application.getResultDir()+application.getNodeFile()).getFile(), combinedData.values());
//    FileWriter crunchifyFile = new FileWriter(application.getOutputFolder() + application.getNodeFile());
//    objectMapper.writeValue(crunchifyFile, combinedData.values());
//    crunchifyFile.write(combinedData.values().toString());
//    crunchifyFile.flush();
//    crunchifyFile.close();

    }
    catch (Exception e) {
        System.err.println("An error occurred while merging the JSON files:");
        e.printStackTrace();
    }}

    @Override
    public boolean checkKey(String key) {
        return key.equals(application.getPassword());
    }


    private void mergeObjectNode(ObjectNode objectNode, Map<String, ObjectNode> combinedData) {
        String owner = null;
        String elementId = null;
        JsonNode group = null;  // Changed from labels to group
        JsonNode properties = null;
        String categories = null;
        int anUong = 0;
        int thuePhong = 0;
        int vanChuyen = 0;
        int giatLa = 0;
        int giaoDuc = 0;
        int myPham = 0;

        if (objectNode.has("owner")) {
            owner = objectNode.get("owner").asText();
        } else if (objectNode.has("n") && objectNode.get("n").has("properties") && objectNode.get("n").get("properties").has("owner")) {
            owner = objectNode.get("n").get("properties").get("owner").asText();
        } else if (objectNode.has("User")) {
            owner = objectNode.get("User").asText();
        } else if (objectNode.has("username")) {
            owner = objectNode.get("username").asText();
        }

        if (objectNode.has("elementId")) {
            elementId = objectNode.get("elementId").asText();
        } else if (objectNode.has("n") && objectNode.get("n").has("elementId")) {
            elementId = objectNode.get("n").get("elementId").asText();
        }

        if (objectNode.has("labels")) {
            group = objectNode.get("labels");
        } else if (objectNode.has("n") && objectNode.get("n").has("labels")) {
            group = objectNode.get("n").get("labels");
        }

        if (objectNode.has("properties")) {
            properties = objectNode.get("properties").get("");
        } else if (objectNode.has("n") && objectNode.get("n").has("properties")) {
            properties = objectNode.get("n").get("properties");
        }

        if (objectNode.has("Categories")) {
            categories = objectNode.get("Categories").asText();
            anUong = objectNode.get("an_uong").asInt();
            thuePhong = objectNode.get("thue_phong").asInt();
            vanChuyen = objectNode.get("van_chuyen").asInt();
            giatLa = objectNode.get("giat_la").asInt();
            giaoDuc = objectNode.get("giao_duc").asInt();
            myPham = objectNode.get("my_pham").asInt();
        }

        if (owner != null) {
            ObjectNode existingNode = combinedData.get(owner);
            if (existingNode == null) {
                // If the owner does not exist in the map, create a new ObjectNode
                existingNode = objectMapper.createObjectNode();
                combinedData.put(owner, existingNode);
            }

            if (categories != null) {
                ObjectNode labelsNode = objectMapper.createObjectNode();
                labelsNode.put("Categories", categories);
                labelsNode.put("an_uong", anUong);
                labelsNode.put("thue_phong", thuePhong);
                labelsNode.put("van_chuyen", vanChuyen);
                labelsNode.put("giat_la", giatLa);
                labelsNode.put("giao_duc", giaoDuc);
                labelsNode.put("my_pham", myPham);
                existingNode.set("services", labelsNode);
            }

            else if(elementId != null && group != null) {
                ObjectNode newNode = objectMapper.createObjectNode();
                newNode.put("id", elementId);
                newNode.set("group", group);
                combinedData.put(owner, newNode);
            } else{
                combinedData.get(owner).putAll(objectNode);
            }
        }
        else {
            // If the owner isn't a key in the map, add the current ObjectNode to the map with its owner as the key
            combinedData.put(owner, objectNode);
        }
    }

    @Override
    public void transformAndWriteLinks() {
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            // Read the original file
            JsonNode rootNode = objectMapper.readTree(new File(application.getInputFolder()+"r.json"));

            // Create a list to hold the transformed objects
            List<ObjectNode> transformedNodes = new ArrayList<>();

            // Iterate over each object in the original file
            for (JsonNode node : rootNode) {
                if (node.has("r")) {
                    ObjectNode rNode = (ObjectNode) node.get("r");

                    // Create a new ObjectNode in the desired format
                    ObjectNode transformedNode = objectMapper.createObjectNode();
                    transformedNode.put("identity", rNode.get("identity").asInt());
                    transformedNode.put("start", rNode.get("start").asInt());
                    transformedNode.put("end", rNode.get("end").asInt());
                    transformedNode.put("type", rNode.get("type").asText());

                    if (rNode.has("properties") && rNode.get("properties").has("weight")) {
                        transformedNode.put("value", rNode.get("properties").get("weight").asInt());
                    }

                    transformedNode.put("elementId", rNode.get("elementId").asText());

                    if (rNode.has("startNodeElementId")) {
                        transformedNode.put("source", rNode.get("startNodeElementId").asText());
                    }

                    if (rNode.has("endNodeElementId")) {
                        transformedNode.put("target", rNode.get("endNodeElementId").asText());
                    }

                    // Add the transformed node to the list
                    transformedNodes.add(transformedNode);
                }
            }

            objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
            // Write the list of transformed nodes to the path.json file
            objectMapper.writeValue(new File(application.getOutputFolder() + application.getLinkFile()), transformedNodes);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
