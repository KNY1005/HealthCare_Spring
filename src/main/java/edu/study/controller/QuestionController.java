package edu.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.study.service.QuestionService;
import edu.study.vo.BoardVo;
import edu.study.vo.PageVO;
import edu.study.vo.SearchCriteria;

@RequestMapping(value="/question")	
@Controller
public class QuestionController {

	@Autowired
	private QuestionService questionService;
	
	@RequestMapping(value = "/questionList.do", method = RequestMethod.GET)	
	public String questionList(SearchCriteria scri, Model model) {	
		List<BoardVo> list = questionService.list(scri);
		model.addAttribute("list", list);
		System.out.println(model);
		PageVO pageVo = new PageVO();
		pageVo.setScri(scri);
		pageVo.setTotalCount(questionService.listCount(scri));
		model.addAttribute("page", pageVo);
		
		return "question/questionList";	
	}
	@RequestMapping(value = "/questionModify.do", method = RequestMethod.GET)	
	public String questionModify() {	
		
		return "question/questionModify";	
	}
	@RequestMapping(value = "/questionView.do", method = RequestMethod.GET)	
	public String questionView() {	
		
		return "question/questionView";	
	}
	@RequestMapping(value = "/questionWrite.do", method = RequestMethod.GET)	
	public String questionWrite() {	
		
		return "question/questionWrite";	
	}		
	
	
}
