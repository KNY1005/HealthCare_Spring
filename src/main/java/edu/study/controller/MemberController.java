package edu.study.controller;

import java.net.http.HttpRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String login(MemberVo vo, HttpServletRequest rep, RedirectAttributes rttr) throws Exception {
		System.out.println("로그인중");
		
		HttpSession session = rep.getSession();
		MemberVo login = MemberService.login(vo);
		 
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "member/login";
		}else {
			session.setAttribute("member", login);
			return "redirect:/";
		}
			
		
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
	
	
	
	
	
	
	
	
	
}













