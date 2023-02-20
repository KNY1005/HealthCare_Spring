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
import edu.study.service.memberSha256;
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
		
	@RequestMapping(value = "healthnews1.do", method = RequestMethod.GET)
	public String healthnews1() {
		
		return "healthnews/healthnews";
	}
	@RequestMapping(value = "healthnews1.do", method = RequestMethod.POST)
	public String healthnews1_(HttpServletRequest request, Model model) {
		String[] tubeTitle = request.getParameterValues("tubeTitle");
		String[] tubeURL = request.getParameterValues("tubeURL");
		System.out.println("집명은?"+tubeTitle[0]+" 주소는?"+tubeURL[0]);
		model.addAttribute("tubeTitle",tubeTitle[0]);
		model.addAttribute("tubeURL",tubeURL[0]);
		return "healthnews/healthNewsView";
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
	

	@RequestMapping(value="/mypage5.do", method = RequestMethod.POST)
	public String registerUpdate(HttpServletRequest request, RedirectAttributes redirectAttributes,
			MemberVo vo, HttpSession session, Model model){
		
		try {
	        memberService.updateMember(vo);
	        System.out.println("여기");
	        
	    } catch (Exception e) {
	        System.out.println(e.toString());
	        System.out.println("망했네");
	    }
		
		return "redirect:/mypage5.do";
	}
}
