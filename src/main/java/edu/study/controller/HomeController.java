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
	
	
	
}
