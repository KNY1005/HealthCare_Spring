package edu.study.controller;

import java.net.InetAddress;
import java.net.http.HttpRequest;
import java.util.List;

import javax.print.attribute.standard.PrinterInfo;
import javax.print.attribute.standard.PrinterLocation;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.annotation.JsonProperty.Access;

import edu.study.service.MemberService;
import edu.study.vo.MemberVo;
import oracle.net.aso.l;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberService;



	
	
	@RequestMapping(value="/login.do",method=RequestMethod.GET )
	public String login() {
		
		System.out.println("로그인");
		
		return "member/login"; 
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST )
	public String login( MemberVo vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVo login = memberService.login(vo);
		 
		if(login == null) {
			session.setAttribute("member", null);
			System.out.println("로그인실패");
			
			
			return "member/login";
		}else {
			session.setAttribute("member", login);
			System.out.println(login);
			System.out.println("로그인완료");
			return "redirect:/";
		}
			
		
	}
	
	
	@RequestMapping(value="/logout.do", method=RequestMethod.GET)
	public String logout(HttpServletRequest request) {
		
		System.out.println("logout메서드 진입");
		
		 HttpSession session = request.getSession();
	        
	      session.invalidate();
	        
		return "home";
	}
	
	
	@RequestMapping(value="/join.do",method=RequestMethod.POST)
	public String join(MemberVo vo, HttpServletRequest request){
		System.out.println("회원가입중");
		
		memberService.register(vo);
		
		return "member/login";
	}
	
	
	@ResponseBody
	@RequestMapping(value="/checkId.do", method=RequestMethod.POST)
	public String checkId(String mid) {
		
		int result = memberService.selectById(mid);
		
		if(result >0) {
			return "1";
		}else {
			return "0";
		}
	}
	
	@RequestMapping(value="/membersearch.do",method=RequestMethod.GET)
	public String membersearch(MemberVo vo, HttpServletRequest request){
		System.out.println("아이디 비밀번호 찾기중");
		
		
		return "member/memberSearch";
	}
/*
	//아이디찾기
	@RequestMapping(value = "/memberSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(@RequestParam("inputName_1") String mname, 
			@RequestParam("inputPhone_1") String mphone) {
		
		String result = memberService.get_searchId(mname, mphone);

		return result;
	}


	//비밀번호찾기
	@RequestMapping(value = "/user/searchPassword", method = RequestMethod.GET)
	@ResponseBody
	public String passwordSearch(@RequestParam("userId")String mid,
			@RequestParam("userEmail")String memail,
			HttpServletRequest request) {

		mailsender.mailSendWithPassword(mid, memail, request);
		
		return "user/userSearchPassword";
	}
*/

}













