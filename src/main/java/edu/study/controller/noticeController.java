package edu.study.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.study.service.BoardService;

@RequestMapping(value="/notice",produces="text/plain;charset=UTF-8")
@Controller
public class noticeController {

	@Autowired
	private BoardService boardService;	//전체 데이터 요청
	
	
}
