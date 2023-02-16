package edu.study.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


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
	@RequestMapping(value = "page4.do", method = RequestMethod.POST)	
	public String testMethod(HttpServletRequest request, Model model){
		String[] zip = request.getParameterValues("zip");
		String[] addr = request.getParameterValues("addr");
		String[] phone = request.getParameterValues("phone");
		
		model.addAttribute("zip",zip[0]);
		model.addAttribute("addr",addr[0]);
		model.addAttribute("phone",phone[0]);
		return "blood/bloodPage4";	
	}
	@RequestMapping(value = "page5.do", method = RequestMethod.POST)	
	public String bloodPage5(HttpServletRequest request, Model model) {	
		String[] zip = request.getParameterValues("zip");
		String[] type = request.getParameterValues("type");
		
		model.addAttribute("zip",zip[0]);
		
		return "blood/bloodPage5";	
	}
	
}
