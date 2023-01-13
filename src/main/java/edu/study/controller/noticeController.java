package edu.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.BoardService;
import edu.study.vo.BoardVo;


@RequestMapping(value="/notice",produces="text/plain;charset=UTF-8")
@Controller
public class noticeController {

	@Autowired
	private BoardService boardService;	//전체 데이터 요청
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)	
	public String board1(Model model) {
		//DB list 조회
		List<BoardVo> list = boardService.list();
		model.addAttribute("datalist",list);	//키값
				
		return "notice/noticeList";	//화면으로 포워드
	}
}
