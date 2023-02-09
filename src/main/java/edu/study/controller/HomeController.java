package edu.study.controller;

import java.util.Enumeration;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.study.service.MemberService;
import edu.study.vo.BoardVo;
import edu.study.vo.MemberVo;
import oracle.net.ns.SessionAtts;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(MemberVo vo,RedirectAttributes rttr, Locale locale, Model model) throws Exception {
	
		
		return "home";
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
	
	
	@RequestMapping(value = "/mypage1.do", method = RequestMethod.GET)
	public String mypage1() {
		
		return "mypage/blood_reserve_inquiry";
	}
	
	@RequestMapping(value = "/mypage2.do", method = RequestMethod.GET)
	public String mypage2() {
		
		return "mypage/shot_reserve_inquiry";
	}
	@RequestMapping(value = "/mypage3.do", method = RequestMethod.GET)
	public String mypage3() {
		
		return "mypage/medical_reserve_inquiry";
	}
	
	@RequestMapping(value = "/mypage4.do", method = RequestMethod.GET)
	public String mypage4() {
		
		return "mypage/my_text_inquiry";
	}
	
	@RequestMapping(value = "/mypage5.do", method = RequestMethod.GET)
	public String mypage5() {
		
		return "mypage/my_information_inquiry";
	}

}
