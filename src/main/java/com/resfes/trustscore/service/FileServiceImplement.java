package com.resfes.trustscore.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.node.ObjectNode;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;

import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.model.PDFInfo;
import lombok.AllArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.time.Instant;
import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import static org.springframework.boot.logging.LoggingSystemProperty.APPLICATION_NAME;

@AllArgsConstructor
@Service
public class FileServiceImplement implements FileService {
    private final ResourceLoader resourceLoader;
    private final ObjectMapper objectMapper;
    private final Application application;

    public void mergeJsonFiles() throws IOException {
        Resource differentRankingResource = resourceLoader.getResource(application.getRawDir()+"ranking_4.json");
        Resource nResource = resourceLoader.getResource(application.getRawDir()+"nodes_phone.json");
        String jsonString2 = new String(Files.readAllBytes(Paths.get(application.getInputFolder()+"interaction_types_group.json")));
        JSONObject interaction = new JSONObject(jsonString2);
        Resource stars = resourceLoader.getResource(application.getRawDir()+"star_rank.json");
        Map<String, ObjectNode> combinedData = new HashMap<>();
try {
    // List of all JSON resources
    List<Resource> allResources = Arrays.asList(differentRankingResource, nResource, stars);

    for (Resource resource : allResources) {
        JsonNode jsonNode = objectMapper.readTree(resource.getInputStream());

        // Check if the root of the JSON is an array or an object
        if (jsonNode.isArray()) {
            // If it's an array, iterate over each element
            for (JsonNode element : jsonNode) {
                ObjectNode objectNode = (ObjectNode) element;
                newMergeObjectNode(objectNode, combinedData, interaction);
            }
        } else if (jsonNode.isObject()) {
            // If it's an object, just cast it to an ObjectNode
            ObjectNode objectNode = (ObjectNode) jsonNode;
            newMergeObjectNode(objectNode, combinedData, interaction);
        }else{
            System.out.println("Invalid JSON format");
        }
    }

    List<Map.Entry<String, ObjectNode>> list = new ArrayList<>(combinedData.entrySet());

    list.sort((entry1, entry2) -> {
        double rank1 = entry1.getValue().has("first_combine") ? entry1.getValue().get("first_combine").asDouble() : 0;
        double rank2 = entry2.getValue().has("first_combine") ? entry2.getValue().get("first_combine").asDouble() : 0;
        return Double.compare(rank2, rank1);
    });

    int count = 1;
    for (int i = 0; i < list.size(); i++) {
        ObjectNode service = list.get(i).getValue();
        if(service.get("group").get(0).asText().contains("service_provider")){
            service.put("order", count);
            count++;
        }
    }

    Map<String, ObjectNode> sortedMap = new LinkedHashMap<>();
    for (Map.Entry<String, ObjectNode> entry : list) {
        sortedMap.put(entry.getKey(), entry.getValue());
    }

    objectMapper.enable(SerializationFeature.INDENT_OUTPUT);
    objectMapper.writeValue(resourceLoader.getResource(application.getResultDir()+application.getNodeFile()).getFile(), sortedMap.values());
    FileWriter crunchifyFile = new FileWriter(application.getOutputFolder() + application.getNodeFile());
    objectMapper.writeValue(crunchifyFile, sortedMap.values());

    }
    catch (Exception e) {
        System.err.println("An error occurred while merging the JSON files:");
        e.printStackTrace();
    }}

    @Override
    public boolean checkKey(String key) {
        return key.equals(application.getPassword());
    }


    private void mergeObjectNode(ObjectNode objectNode, Map<String, ObjectNode> combinedData, JSONObject contact, JSONObject interaction) throws Exception {
        String owner = null;
        String elementId = null;
        JsonNode group = null;  // Changed from labels to group
        String categories = null;
        int anUong = 0;
        int thuePhong = 0;
        int vanChuyen = 0;
        int giatLa = 0;
        int giaoDuc = 0;
        int myPham = 0;


        if (objectNode.has("owner")) {
            owner = objectNode.get("owner").asText();
        } else if (objectNode.has("a") && objectNode.get("a").has("properties") && objectNode.get("a").get("properties").has("owner")) {
            owner = objectNode.get("a").get("properties").get("owner").asText();
        } else if (objectNode.has("User")) {
            owner = objectNode.get("User").asText();
        } else if (objectNode.has("username")) {

            owner = objectNode.get("username").asText();
//            System.out.println(objectNode.toString());
        }


        if (objectNode.has("a") && objectNode.get("a").has("elementId")) {
            elementId = objectNode.get("a").get("elementId").asText();
        }

        if (objectNode.has("a") && objectNode.get("a").has("labels")) {
            group = objectNode.get("a").get("labels");
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
                existingNode.put("owner", owner);
                combinedData.put(owner, existingNode);
            }

            try{
                Iterator<String> keys = contact.keys();
                while (keys.hasNext()) {
                    String key = keys.next();
                    JSONArray values = contact.getJSONArray(key);
                    for (int i = 0; i < values.length(); i++) {
                        if (values.getString(i).toLowerCase().contains(owner.toLowerCase())) {
                            existingNode.put("contact", key);
                            break;
                        }
                    }
                }

//                JSONObject attributes = avatar.getJSONObject(owner);
//                existingNode.put("facebook_name", attributes.getString("name"));
//                existingNode.put("facebook_profile_pic", attributes.getString("link_avatar"));
            } catch (Exception e) {
                System.err.println("An error occurred while fetching the contact and avatar attributes: " + e.getMessage());
            }

            if (objectNode.has("degree_centrality") && objectNode.get("degree_centrality") != null) {
                existingNode.put("degree_centrality", objectNode.get("degree_centrality").asDouble());
            }

            if (objectNode.has("closeness_centrality") && objectNode.get("closeness_centrality") != null) {
                existingNode.put("closeness_centrality", objectNode.get("closeness_centrality").asDouble());
            }

            if (objectNode.has("betweenness_centrality") && objectNode.get("betweenness_centrality") != null) {
                existingNode.put("betweenness_centrality", objectNode.get("betweenness_centrality").asDouble());
            }
            if (objectNode.has("old_page_rank") && objectNode.get("old_page_rank") != null) {
                existingNode.put("old_page_rank", objectNode.get("old_page_rank").asDouble());
            }

            if (objectNode.has("improved_pagerank") && objectNode.get("improved_pagerank") != null) {
                existingNode.put("improved_pagerank", objectNode.get("improved_pagerank").asDouble());
            }

            if(objectNode.has("owner_weight") && objectNode.get("owner_weight") != null){
                existingNode.put("owner_weight", objectNode.get("owner_weight").asDouble());
            }

            if (objectNode.has("a")) {
                //existingNode.set("properties", properties);
                existingNode.put("id", elementId);
                existingNode.set("group", group);
            }

            else if (categories != null) {
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
            else{
                // If the owner already exists in the map, merge the current ObjectNode with the existing one
                existingNode.setAll(objectNode);
            }
//                try {
//                    String accessToken = application.getFacebookToken(); // Replace with your access token
//                    RestTemplate restTemplate = new RestTemplate();
//                    String facebookApiUrl = "https://graph.facebook.com/" + owner + "?fields=name,profile_pic&access_token=" + accessToken;
//                    JsonNode facebookResponse = restTemplate.getForObject(facebookApiUrl, JsonNode.class);
//                    if (facebookResponse != null && facebookResponse.has("name")) {
//                        existingNode.put("facebook_name", facebookResponse.get("name").asText());
//                        existingNode.put("facebook_profile_pic", facebookResponse.get("profile_pic").asText());
//                    }
//                } catch (Exception e) {
//                    System.err.println("An error occurred while fetching the Facebook name: " + e.getMessage());
//                }
        }
        else {
            // If the owner isn't a key in the map, add the current ObjectNode to the map with its owner as the key
            combinedData.put(owner, objectNode);
        }
    }

    private void newMergeObjectNode(ObjectNode objectNode, Map<String, ObjectNode> combinedData, JSONObject interaction) throws Exception {
        String owner = null;
        int totalAskForService = 0;
        int totalBad = 0;
        int totalGood = 0;
        int totalNonRelated = 0;

        if (objectNode.has("owner")) {
            owner = objectNode.get("owner").asText();
        } else if (objectNode.has("a") && objectNode.get("a").has("properties") && objectNode.get("a").get("properties").has("owner")) {
            owner = objectNode.get("a").get("properties").get("owner").asText();
        } else if (objectNode.has("User")) {
            owner = objectNode.get("User").asText();
        } else if (objectNode.has("username")) {
            owner = objectNode.get("username").asText();
        }

        if (owner != null) {
            ObjectNode existingNode = combinedData.get(owner);
            if (existingNode == null) {
                // If the owner does not exist in the map, create a new ObjectNode
                existingNode = objectMapper.createObjectNode();
                existingNode.put("owner", owner);
                combinedData.put(owner, existingNode);
            }

            if (objectNode.has("a")) {
                existingNode.put("id", objectNode.get("a").get("elementId").asText());
                existingNode.put("group", objectNode.get("a").get("labels"));
                JsonNode properties = objectNode.get("a").get("properties");
                existingNode.put("properties", properties);
                if(properties.has("service_type"))
                {
                    JsonNode serviceType = properties.get("service_type");
                    if(serviceType.toString().contains("van_chuyen"))
                    {
                        existingNode.put("facebook_profile_pic", "/assets/images/services/transport.png");
                    }
                    else if(serviceType.toString().contains("an_uong"))
                    {
                        existingNode.put("facebook_profile_pic", "/assets/images/services/food.png");
                    }
                    else if(serviceType.toString().contains("thue_phong"))
                    {
                        existingNode.put("facebook_profile_pic", "/assets/images/services/rent.png");
                    }
                    else if(serviceType.toString().contains("giat_la"))
                    {
                        existingNode.put("facebook_profile_pic", "/assets/images/services/laundry.png");
                    }
                    else if(serviceType.toString().contains("giao_duc"))
                    {
                        existingNode.put("facebook_profile_pic", "/assets/images/services/edu.png");
                    }
                    else if(serviceType.toString().contains("my_pham"))
                    {
                        existingNode.put("facebook_profile_pic", "/assets/images/services/cosmetic.png");
                    }else{
                        existingNode.put("facebook_profile_pic", "/assets/images/services/other.png");
                    }
                }
                JsonNode nameNode = objectNode.get("a").get("properties").get("name");
                JSONArray employee;
                if (nameNode.isArray()) {
                    employee = new JSONArray();
                    for (JsonNode name : nameNode) {
                        employee.put(name.asText());
                    }
                } else {
                    employee = new JSONArray().put(nameNode.asText());
                }
                for (int i = 0; i < employee.length(); i++) {
                    String userId = employee.getString(i);
                    if (interaction.has(userId)) {
                        JSONObject userInteractions = interaction.getJSONObject(userId);
                        totalAskForService += userInteractions.optInt("ask_for_service", 0);
                        totalBad += userInteractions.optInt("bad", 0);
                        totalGood += userInteractions.optInt("good", 0);
                        totalNonRelated += userInteractions.optInt("non_related", 0);
                    }
                }

                existingNode.put("total_ask_for_service", totalAskForService);
                existingNode.put("total_bad", totalBad);
                existingNode.put("total_good", totalGood);
                existingNode.put("total_non_related", totalNonRelated);
            }


            if (objectNode.has("degree_centrality") && objectNode.get("degree_centrality") != null) {
                existingNode.put("degree_centrality", objectNode.get("degree_centrality").asDouble());
            }

            if (objectNode.has("closeness_centrality") && objectNode.get("closeness_centrality") != null) {
                existingNode.put("closeness_centrality", objectNode.get("closeness_centrality").asDouble());
            }

            if (objectNode.has("betweenness_centrality") && objectNode.get("betweenness_centrality") != null) {
                existingNode.put("betweenness_centrality", objectNode.get("betweenness_centrality").asDouble());
            }
            if (objectNode.has("old_page_rank") && objectNode.get("old_page_rank") != null) {
                existingNode.put("old_page_rank", objectNode.get("old_page_rank").asDouble());
            }

            if (objectNode.has("improved_pagerank") && objectNode.get("improved_pagerank") != null) {
                existingNode.put("improved_pagerank", objectNode.get("improved_pagerank").asDouble());
            }

            if(objectNode.has("owner_weight") && objectNode.get("owner_weight") != null){
                existingNode.put("owner_weight", objectNode.get("owner_weight").asDouble());
            }
            if(objectNode.has("first_combine") && objectNode.get("first_combine") != null){
                existingNode.put("first_combine", objectNode.get("first_combine").asDouble());
            }
            if(objectNode.has("star")&& objectNode.get("star") != null){
                existingNode.put("star", objectNode.get("star").asDouble());
            }
            else{
                //existingNode.setAll(objectNode);
            }


        }
        else {
            combinedData.put(owner, objectNode);
        }

    }

    @Override
    public void transformAndWriteLinks() {
        ObjectMapper objectMapper = new ObjectMapper();

        try {
            // Read the original file
            JsonNode rootNode = objectMapper.readTree(new File(application.getInputFolder()+"relationship_phone.json"));

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

    @Override
    public Page<PDFInfo> findPdfFiles(String query, String directoryPath, int page, int size) throws IOException {
        Resource directoryResource = resourceLoader.getResource("classpath:/static/pdf/" + directoryPath);
        Path path = Paths.get(directoryResource.getURI());

        try (Stream<Path> walk = Files.walk(path)) {
            List<PDFInfo> pdfFilesInfo = walk.filter(Files::isRegularFile)
                    .filter(p -> p.toString().endsWith(".pdf") && (p.getFileName().toString().toLowerCase().contains(query.toLowerCase())))
                    .map(p -> {// You need to implement this method
                        return new PDFInfo(
                                p.getFileName().toString(),
                                (double) Math.round(p.toFile().length() / 1024.0 * 100) / 100,
                                p.toString(),
                                Date.from(Instant.ofEpochMilli(p.toFile().lastModified())),
                                getThumbnailPath(p)); // Set the owner here
                    })
                    .collect(Collectors.toList());

            int start = Math.min(page * size, pdfFilesInfo.size());
            int end = Math.min((start + size), pdfFilesInfo.size());
            List<PDFInfo> paginatedFilesInfo = pdfFilesInfo.subList(start, end);

            return new PageImpl<>(paginatedFilesInfo, PageRequest.of(page, size), pdfFilesInfo.size());
        }
    }

    @Override
    public List<PDFInfo> find3NewestFiles(String directoryPath) throws IOException {
        Resource directoryResource = resourceLoader.getResource("classpath:/static/pdf/" + directoryPath);
        Path path = Paths.get(directoryResource.getURI());

        try (Stream<Path> walk = Files.walk(path)) {
            List<PDFInfo> pdfFilesInfo = walk.filter(Files::isRegularFile)
                    .filter(p -> p.toString().endsWith(".pdf"))
                    .map(p -> {
                        try {
                            return new PDFInfo(
                                    p.getFileName().toString(),
                                    (double) Math.round(p.toFile().length() / 1024.0 * 100) / 100,
                                    p.toString(),
                                    Date.from(Instant.ofEpochMilli(p.toFile().lastModified())),
                                    getThumbnailPath(p)); // Set the owner here
                        } catch (Exception e) {
                            e.printStackTrace();
                            return null;
                        }
                    })
                    .collect(Collectors.toList());

            pdfFilesInfo.sort(Comparator.comparing(PDFInfo::getLastModified).reversed());

            return pdfFilesInfo.subList(0, Math.min(3, pdfFilesInfo.size()));
        }
    }

    @Override
    public String getPdfFilePath(String fileName) {
        String filePath = "classpath:/static/pdf/" + fileName;
        Resource resource = resourceLoader.getResource(filePath);
        try {
            if (resource.exists() && resource.getFile().exists()) {
                return "/pdf/" + fileName;
            } else {
                // File does not exist
                return "File does not exist";
            }
        } catch (IOException e) {
            e.printStackTrace();
            return "Error checking file existence";
        }
    }

    @Override
    public Optional<PDFInfo> findPdfFile(String fileName) {
        String filePath = "classpath:/static/pdf/" + fileName;
        Resource resource = resourceLoader.getResource(filePath);
        try {
            if (resource.exists() && resource.getFile().exists()) {
                return Optional.of(new PDFInfo(
                        fileName,
                        (double) Math.round(resource.getFile().length() / 1024.0 * 100) / 100,
                        resource.getFile().getAbsolutePath(),
                        Date.from(Instant.ofEpochMilli(resource.getFile().lastModified())),
                        getThumbnailPath(Paths.get(resource.getFile().getAbsolutePath()))));
            } else {
                // File does not exist
                return Optional.empty();
            }
        } catch (IOException e) {
            e.printStackTrace();
            return Optional.empty();
        }
    }

    private String getThumbnailPath(Path pdfPath) {
        String pdfFileName = pdfPath.getFileName().toString();
        // Change the file extension from .pdf to .png for the thumbnail file name
        String thumbnailFileName = pdfFileName.replaceAll("\\.pdf$", ".png");
        String path = "/assets/images/thumbnails/" + thumbnailFileName;
        if(doesThumbnailExist(path)){
            return path;
        }
        return "/assets/images/thumbnails/default-thumbnail.png";
    }
    public boolean doesThumbnailExist(String thumbnailPath) {
        String basePath = "src/main/webapp";
        if (thumbnailPath.startsWith("/assets/images/thumbnails/")) {
            thumbnailPath = basePath + thumbnailPath;
        }
        Path path = Paths.get(thumbnailPath).toAbsolutePath();
        return Files.exists(path);
    }

}
