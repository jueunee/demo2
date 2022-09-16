package com.example.demo.controller;

import com.example.demo.entity.Board;
import com.example.demo.repository.BoardRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.example.demo.dto.BoardSaveDto;

import java.util.List;

@RequiredArgsConstructor
@RestController
public class BoardController {
    private final BoardRepository boardRepository;

    @GetMapping("/board")
    public List<Board> findAll(){
        System.out.println("11111111111");
        return boardRepository.findAll();
    }

    @PostMapping("/board")
    public Board save(BoardSaveDto dto){
        System.out.println("222222222222");

        Board boardEntity = boardRepository.save(dto.toEntity());

        return boardEntity;
    }

}
