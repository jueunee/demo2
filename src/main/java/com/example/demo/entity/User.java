package com.example.demo.entity;

import lombok.Data;

@Data
public class User {
    private String name;

    @Override
    public String toString(){
        return "name is"+name;
    }
}
