package com.resfes.trustscore.model;


import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "users")
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    @Column
    private String owner;
    @Column
    private int num_likes;
    @Column
    private int num_hahas;
    @Column
    private int num_loves;
    @Column
    private int num_cares;
    @Column
    private int num_wows;
    @Column
    private int num_sads;
    @Column
    private int num_angries;
    @Column
    private int total_posts;
    @Column
    private int total_comments;
    @Column
    private int total_comment_reacts;
    @Column
    private double comment_receive;
    @Column
    private double self_comment;

    // Getters and setters
    // ...
}