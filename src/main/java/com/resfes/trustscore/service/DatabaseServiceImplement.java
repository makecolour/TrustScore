package com.resfes.trustscore.service;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.resfes.trustscore.model.Application;
import com.resfes.trustscore.model.User;
import com.resfes.trustscore.repository.UserRepository;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Service
public class DatabaseServiceImplement implements DatabaseService{
    private final UserRepository userRepository;
    private final Application application;

    DatabaseServiceImplement(UserRepository userRepository, Application application) {
        this.userRepository = userRepository;
        this.application = application;
    }
    @Override
    public void convertJsonToDatabase() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // Parse the JSON file and convert it into a list of User objects
            List<User> users = objectMapper.readValue(new File(application.getOutputFolder()+application.getNodeFile()), new TypeReference<List<User>>(){});

            // Save the User objects to the database
            userRepository.saveAll(users);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
