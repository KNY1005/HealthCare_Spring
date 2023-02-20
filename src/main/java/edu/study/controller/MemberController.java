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

import org.apache.commons.lang3.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@RequestMapping("/member")
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/login.do", method = RequestMethod.GET)
	public String login() {

		return "member/login";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(MemberVo vo, HttpServletRequest request, RedirectAttributes rttr) throws Exception {

		HttpSession session = request.getSession();
		String mpwd = vo.getMpwd();
		vo.setMpwd(memberSha256.encrypt(mpwd));
		MemberVo login = memberService.login(vo);
		System.out.println("id는"+vo.getMid()+"   비밀"+vo.getMpwd());		
		
		if (login == null) {
			session.setAttribute("member", null);
			return "member/login";
		} else {
			session.setAttribute("member", login);
			return "redirect:/";
		}

	}
	

	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest request) {

		HttpSession session = request.getSession();

		session.invalidate();

		return "home";
	}
	
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(MemberVo vo, HttpServletRequest request) {

		String encryPassword = memberSha256.encrypt(vo.getMpwd());
		vo.setMpwd(encryPassword);
		memberService.register(vo);
		return "member/login";
	}

	@ResponseBody
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public String checkId(String mid) {

		int result = memberService.selectById(mid);

		if (result > 0) {
			return "1";
		} else {
			return "0";
		}
	}

	
	@ResponseBody
	@RequestMapping(value = "/checkDoctor.do", method = RequestMethod.POST)
	public String checkDoctor(String ddoctor) {

		int result = memberService.selectByDoctor(ddoctor);

		if (result > 0) {
			return "1";
		} else {
			return "0";
		}
	}
	@RequestMapping(value = "/membersearch.do", method = RequestMethod.GET)
	public String membersearch(MemberVo vo, HttpServletRequest request) {

		return "member/memberSearch";
	}
	
	// ���대��李얘린
	@RequestMapping(value = "/search_result_id.do", method = RequestMethod.POST)
	public String search_result_id(HttpServletRequest request, Model model,
			@RequestParam(required = true, value = "mname") String mname,
			@RequestParam(required = true, value = "mphone") int mphone, MemberVo searchVo) {

		System.out.println(mname);
		System.out.println(mphone);

		try {
			searchVo.setMname(mname);
			searchVo.setMphone(mphone);
			MemberVo memberSearch = memberService.memberIdSearch(searchVo);

			model.addAttribute("searchVo", memberSearch);
		} catch (Exception e) {
			model.addAttribute("msg", "존재하지않는 계정입니다.");
		}

		return "/member/search_result_id";
	}

	@RequestMapping(value = "/search_result_pwd.do", method = RequestMethod.GET)
	public String search_result_pwd(MemberVo vo, HttpServletRequest request) {

		return "member/search_pwd";
	}
	
	@RequestMapping(value = "/search_result_pwd.do", method = RequestMethod.POST)
	public String search_result_pwd(HttpServletRequest request, MemberVo vo, Model model,
	    @RequestParam(required = true, value = "mname") String mname, 
	    @RequestParam(required = true, value = "mphone") int mphone, 
	    @RequestParam(required = true, value = "mid") String mid, 
	    MemberVo searchVo) {
	try {
		
	    searchVo.setMname(mname);
	    searchVo.setMphone(mphone);
	    searchVo.setMid(mid);
	    
	    System.out.println(searchVo);
	    
	    int memberSearch = memberService.memberPwdCheck(searchVo);
	    
	    System.out.println(memberSearch);
	    
	    if(memberSearch == 0) {
	        model.addAttribute("msg", "계정.");
	        return "member/search_pwd";
	    }
	    
	    
	    String newPwd = RandomStringUtils.randomAlphanumeric(10);
	    String enpassword = encryptPassword(newPwd);

	    searchVo.setMpwd(enpassword);
	    memberService.passwordUpdate(searchVo);
	    model.addAttribute("newPwd", newPwd);
	 
	    
	    
	} catch (Exception e) {
		
	    System.out.println(e.toString());
	    model.addAttribute("msg", "여긴뭐지.");
	}
	 
	
	
	 
	return "/member/search_result_pwd";
	}

	private String encryptPassword(String newPwd) {
		String encryPassword = memberSha256.encrypt(newPwd);
		System.out.println("user_pw : " + encryPassword);
		return encryPassword;
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
	