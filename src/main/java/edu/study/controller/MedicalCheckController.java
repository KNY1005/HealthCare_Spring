package edu.study.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.ShotService;
import edu.study.vo.ReserveVo;


	

@RequestMapping(value="/medical_check")	
@Controller
public class MedicalCheckController {
	@Autowired
	private ShotService shotService;
	

	
	@RequestMapping(value = "medicalmain.do", method = RequestMethod.GET)
	public String medicalmain() {
		
		return "medical_check/medical_check_main";
	}	
	@RequestMapping(value = "medical1.do", method = RequestMethod.GET)
	public String medical1() {
		
		return "medical_check/medical_check1";
	}
	
	
	@RequestMapping(value = "medical2.do", method = RequestMethod.POST)
	
	public String medical2(HttpServletRequest request, Model model){
		String[] hName = request.getParameterValues("hName");
		String[] addr = request.getParameterValues("addr");
		String[] tel = request.getParameterValues("tel");
		
		model.addAttribute("hName",hName[0]);
		model.addAttribute("addr",addr[0]);
		model.addAttribute("tel",tel[0]);
		
		return "medical_check/medical_check2";
	}
	
	@RequestMapping(value = "medicalresult.do", method = RequestMethod.POST)
	public String medicalresult(Model model,ReserveVo rvo) {	


		shotService.insert(rvo);
		int ridx = rvo.getRidx();
		model.addAttribute("rvo",shotService.selectByRidx(ridx));
		
		return "medical_check/medical_check_result";
	}
	
	

}
