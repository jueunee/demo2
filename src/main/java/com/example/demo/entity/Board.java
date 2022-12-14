package com.example.demo.entity;

import org.bson.types.ObjectId;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.Data;
@Data
@Document(collection =  "board")
public class Board {
    @Id
    private ObjectId _id;
    private String title;
    private String content;
    private String user;
}

