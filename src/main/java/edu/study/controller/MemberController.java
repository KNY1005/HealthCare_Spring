package edu.study.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.MemberService;
import edu.study.vo.MemberVo;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService MemberService;
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET )
	public String login() {
		System.out.println("로그인");
		return "member/login"; 
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST )
	public String login(MemberVo vo, HttpSession sesstion) {
	
		System.out.println("띠용");
		MemberVo loginVO = MemberService.login(vo);
		
		if(loginVO != null) {
			sesstion.setAttribute("login", loginVO);
			
			System.out.println(loginVO.toString());
		}
			
		return "redirect:/";
	}
	
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/join.do",method=RequestMethod.GET)
	public String join() {
		return "member/join";
	}
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public String checkId(String mid) {
		
		int result = MemberService.selectById(mid);
		
		if(result >0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	
	
	@RequestMapping(value = "/mypage1.do", method = RequestMethod.GET)
	public String mypage1() {
		
		return "member/blood_reserve_inquiry";
	}
	
	@RequestMapping(value = "/mypage2.do", method = RequestMethod.GET)
	public String mypage2() {
		
		return "member/shot_reserve_inquiry";
	}
	@RequestMapping(value = "/mypage3.do", method = RequestMethod.GET)
	public String mypage3() {
		
		return "member/medical_reserve_inquiry";
	}
	
	@RequestMapping(value = "/mypage4.do", method = RequestMethod.GET)
	public String mypage4() {
		
		return "member/my_text_inquiry";
	}
	
	@RequestMapping(value = "/mypage5.do", method = RequestMethod.GET)
	public String mypage5() {
		
		return "member/my_information_inquiry";
	}
	
	
	
	
	
	
	
}













