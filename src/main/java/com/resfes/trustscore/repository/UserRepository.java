package com.resfes.trustscore.repository;

import com.resfes.trustscore.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}