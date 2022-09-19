package com.example.demo.controller;

import com.example.demo.entity.Board;
import com.example.demo.repository.BoardRepository;
import com.mongodb.RequestContext;
import com.mongodb.lang.Nullable;
import lombok.RequiredArgsConstructor;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.example.demo.dto.BoardSaveDto;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class BoardController {
    private final BoardRepository boardRepository;

   //게시판- 데이터 입력 값 저장
    @RequestMapping(value = "/123", method = RequestMethod.GET)
    public String findAll(Model model){
        model.addAttribute("list", boardRepository.findAll());
        return "main";

    }
//    게시판- 등록된데이터 쏘아줌
    @RequestMapping(value = "/123", method = RequestMethod.POST)
    public String save(BoardSaveDto dto){
        boardRepository.save(dto.toEntity());
        return "redirect:/123";
    }

    @RequestMapping(value="/delete")
    public @ResponseBody String ajaxTest(@RequestParam(value = "valueArr") List<String> list) {
        System.out.println(list);

//        String[] ajaxMsg = request.getParameterValues("valueArr");
//        int size = ajaxMsg.length;
        for (int i =0; i<list.size(); i++){
            boardRepository.deleteBy_id(list.get(i));
        }
        return "redirect:/123";
    }

}
