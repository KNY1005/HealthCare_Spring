package edu.study.controller;



import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import edu.study.service.ShotService;
import edu.study.vo.ReserveVo;


@RequestMapping(value="/blood")	
@Controller
public class BloodController {
	@Autowired
	private ShotService shotService;
	
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
	public String bloodPage5(Model model,ReserveVo rvo) {	
		
		shotService.insert(rvo);
		int ridx = rvo.getRidx();
		
		model.addAttribute("rvo",shotService.selectByRidx(ridx));
		
		return "blood/bloodPage5";	
	}
	
}
