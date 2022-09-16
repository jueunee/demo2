package com.example.demo.dto;

import com.example.demo.entity.Board;
import lombok.Data;

@Data
public class BoardSaveDto {
    private String title;
    private String content;
    private String user;

    public Board toEntity(){
        Board board = new Board();
        board.setTitle(title);
        board.setContent(content);
        board.setUser(user);
        return board;
    }
}
