package edu.study.controller;

import java.util.Locale;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	/*예방접종*/
	@RequestMapping(value = "abc1.do", method = RequestMethod.GET)
	public String home1() {
		
		return "shot/shotCheckMain";
	}
	@RequestMapping(value = "abc2.do", method = RequestMethod.GET)
	public String home2() {
		
		return "shot/shotPage2";
	}
	@RequestMapping(value = "abc3.do", method = RequestMethod.GET)
	public String home3() {
		
		return "shot/shotPage3";
	}
	@RequestMapping(value = "abc4.do", method = RequestMethod.GET)
	public String home4() {
		
		return "shot/shotPage4";
	}
	@RequestMapping(value = "abc5.do", method = RequestMethod.GET)
	public String homea() {
		
		return "shot/reserveFree";
	}
	@RequestMapping(value = "abc6.do", method = RequestMethod.GET)
	public String homeb() {
		
		return "shot/reserveCharged";
	}
	@RequestMapping(value = "abc7.do", method = RequestMethod.GET)
	public String home7() {
		
		return "shot/shotMoney1";
	}
	@RequestMapping(value = "abc8.do", method = RequestMethod.GET)
	public String home8() {
		
		return "shot/shotMoney2";
	}
	@RequestMapping(value = "abc9.do", method = RequestMethod.GET)
	public String home9() {
		
		return "shot/shotMoney3";
	}
	/*건강상담소*/
	@RequestMapping(value = "medicallist.do", method = RequestMethod.GET)
	public String medicall() {
		
		return "medical_talk/medical_talk_list";
	}
	
	@RequestMapping(value = "medicalview.do", method = RequestMethod.GET)
	public String medicalv() {
		
		return "medical_talk/medical_talk_view";
	}
	@RequestMapping(value = "medicalmodify.do", method = RequestMethod.GET)
	public String medicalm() {
		
		return "medical_talk/medical_talk_modify";
	}
	@RequestMapping(value = "medicalwrite.do", method = RequestMethod.GET)
	public String medicalw() {
		
		return "medical_talk/medical_talk_write";
	}
	/*건강검진예약*/
	@RequestMapping(value = "medicalmain.do", method = RequestMethod.GET)
	public String medicalmain() {
		
		return "medical_check/medical_check_main";
	}
	@RequestMapping(value = "medical1.do", method = RequestMethod.GET)
	public String medical1() {
		
		return "medical_check/medical_check1";
	}
	@RequestMapping(value = "medical2", method = RequestMethod.GET)
	public String medical2() {
		
		return "medical_check/medical_check2";
	}
	@RequestMapping(value = "medicalresult.do", method = RequestMethod.GET)
	public String medicalresult() {
		
		return "medical_check/medical_check_result";
	}
	
	/*공지사항*/
	@RequestMapping(value = "notice1.do", method = RequestMethod.GET)
	public String howdmeb() {
		
		return "notice/noticeList";
	}
	@RequestMapping(value = "notice2.do", method = RequestMethod.GET)
	public String homefeb() {
		
		return "notice/noticeModify";
	}
	@RequestMapping(value = "notice3.do", method = RequestMethod.GET)
	public String hoasdmeb() {
		
		return "notice/noticeView";
	}
	@RequestMapping(value = "notice4.do", method = RequestMethod.GET)
	public String homeb2() {
		
		return "notice/noticeWrite";
	}		
	
	@RequestMapping(value = "healthnews1.do", method = RequestMethod.GET)
	public String healthnews1() {
		
		return "healthnews/healthnews";
	}
	
	@RequestMapping(value = "healthnews2.do", method = RequestMethod.GET)
	public String healthnews2() {
		
		return "healthnews/selfcheck";
	}


}
