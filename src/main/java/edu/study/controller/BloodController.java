package edu.study.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@RequestMapping(value="/blood")	
@Controller
public class BloodController {
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String bloodMain() {
		
		return "blood/bloodMain";
	}	
	@RequestMapping(value = "page2.do", method = RequestMethod.GET)	
	public String bloodPage2() {	
		
		return "blood/bloodPage2";	
	}
	@RequestMapping(value = "page3.do", method = RequestMethod.GET)	
	public String bloodPage3() {	
		
		return "blood/bloodPage3";	
	}
	@RequestMapping(value = "page4.do", method = RequestMethod.GET)	
	public String bloodPage4() {	
		
		return "blood/bloodPage4";	
	}
	@RequestMapping(value = "page5.do", method = RequestMethod.GET)	
	public String bloodPage5() {	
		
		return "blood/bloodPage5";	
	}
	
}
