package edu.study.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/question")	
@Controller
public class QuestionController {
	@RequestMapping(value = "/questionList.do", method = RequestMethod.GET)	
	public String questionList() {	
		
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
