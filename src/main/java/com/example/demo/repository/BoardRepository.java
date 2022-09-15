package com.example.demo.repository;

import com.example.demo.entity.Board;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface BoardRepository extends MongoRepository<Board,String> {

}
