package edu.study.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}

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
	@RequestMapping(value = "abca.do", method = RequestMethod.GET)
	public String homea() {
		
		return "shot/reserveFree";
	}
	@RequestMapping(value = "abcb.do", method = RequestMethod.GET)
	public String homeb() {
		
		return "shot/reserveCharged";
	}
	
	@RequestMapping(value = "medicallist.do", method = RequestMethod.GET)
	public String medicall() {
		
		return "medical_talk/medical_talk_list";
	}
	
	@RequestMapping(value = "medicalview.do", method = RequestMethod.GET)
	public String medicalv() {
		
		return "medical_talk/medical_talk_view";
	}
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
}
