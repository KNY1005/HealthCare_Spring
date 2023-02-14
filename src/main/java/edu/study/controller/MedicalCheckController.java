package edu.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


	

@RequestMapping(value="/medical_check")	
@Controller
public class MedicalCheckController {
	

	
	@RequestMapping(value = "medicalmain.do", method = RequestMethod.GET)
	public String medicalmain() {
		
		return "medical_check/medical_check_main";
	}	
	@RequestMapping(value = "medical1.do", method = RequestMethod.GET)
	public String medical1() {
		
		return "medical_check/medical_check1";
	}
	
	
	@RequestMapping(value = "medical2", method = RequestMethod.GET)
	
	public String medical2(HttpServletRequest request, Model model){
		String[] zip = request.getParameterValues("zip");
		String[] addr = request.getParameterValues("addr");
		String[] phone = request.getParameterValues("phone");
		
		System.out.println("집명은?"+zip[0]+" 주소는?"+addr[0]+" 연락처는?"+phone[0]);
		model.addAttribute("zip",zip[0]);
		model.addAttribute("addr",addr[0]);
		model.addAttribute("phone",phone[0]);
		
		return "medical_check/medical_check2";
	}
	
	@RequestMapping(value = "medicalresult.do", method = RequestMethod.GET)
	public String medicalresult(HttpServletRequest request, Model model) {	
		String[] zip = request.getParameterValues("zip");
		System.out.println("집명은?"+zip[0]);
		model.addAttribute("zip",zip[0]);
		
		return "medical_check/medical_check_result";
	}
	
	

}
