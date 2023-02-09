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
import edu.study.service.memberSha256;
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
		
		// 비밀번호 암호화
		String mpwd = vo.getMpwd();
		vo.setMpwd(memberSha256.encrypt(mpwd));
		// 암호화 확인
		System.out.println("user_pw : " + vo.getMpwd());
		
		
		System.out.println("로그인실패");
		if(login == null) {
			session.setAttribute("member", null);
			System.out.println("로그인실패");
			return "member/login";
		}else {
			session.setAttribute("member", login);
			
		
			System.out.println(vo.getMid());
			System.out.println(vo.getMpwd());
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
		
		// 암호 확인
		System.out.println("첫번째:" + vo.getMpwd());
		// 비밀번호 암호화 (sha256
		String encryPassword = memberSha256.encrypt(vo.getMpwd());
		vo.setMpwd(encryPassword);
		System.out.println("두번째:" + vo.getMpwd());
		// 회원가입 메서드
		memberService.register(vo);
		/*
		// 인증 메일 보내기 메서드
		mailsender.mailSendWithUserKey(vo.getMemail(), vo.getMemail(), request);
		*/
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
	

	//아이디찾기
	@RequestMapping(value = "/search_result_id.do",method=RequestMethod.POST)
	public String search_result_id(HttpServletRequest request, Model model,
	    @RequestParam(required = true, value = "mname") String mname, 
	    @RequestParam(required = true, value = "mphone") int mphone,
	    MemberVo searchVo) {
		System.out.println("아이디 비밀번호 찾기중 하하");

	 
	try {
	    
	    searchVo.setMname(mname);
	    searchVo.setMphone(mphone);
	    MemberVo memberSearch = memberService.memberIdSearch(searchVo);
	    
	    model.addAttribute("searchVo", memberSearch);
	 
	} catch (Exception e) {
	    System.out.println(e.toString());
	    model.addAttribute("msg", "오류가 발생되었습니다.");
	}
	 
	return "/member/search_result_id";
	}

	/*
	@RequestMapping(value = "/memberSearch", method = RequestMethod.POST)
	@ResponseBody
	public String userIdSearch(HttpServletRequest request, Model model,
			@RequestParam("inputName_1") String mname, 
			@RequestParam("inputPhone_1") int mphone,
			MemberVo searchVO) {
		
		System.out.println("안녕하세요 여기는 아이디 찾기 입니다");
		try {
		    
		    searchVO.setMname(mname);
		    searchVO.setMphone(mphone);
		    MemberVo memberSearch = memberService.memberIdSearch(searchVO);
		    
		    model.addAttribute("searchVO", memberSearch);
		 
		} catch (Exception e) {
		    System.out.println(e.toString());
		    model.addAttribute("msg", "오류가 발생되었습니다.");
		}
		
		return "member/memberSearch";		
	}

	*/
/*
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













