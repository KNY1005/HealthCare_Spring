package edu.study.controller;

import java.net.http.HttpRequest;
import java.util.List;

import javax.print.attribute.standard.PrinterInfo;
import javax.print.attribute.standard.PrinterLocation;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.study.service.MemberService;
import edu.study.vo.MemberVo;
import oracle.net.aso.l;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value="/god.do", method=RequestMethod.GET)
	public String god(HttpSession session) {
		
		/*
		//관리자 세션 제어
		String mgrade = (String) session.getAttribute("mgrade");
		String mid = (String) session.getAttribute("mid");
		if(mgrade == null || !(mgrade.equals("A"))){
			System.out.println("관리자가아닙니다");
			return "";
		}
		*/
		
		return "admin/god";
	}
	
	@RequestMapping(value="/memberlist.do", method=RequestMethod.GET)
	public String memberlist(Model model){
		List<MemberVo> list = memberService.memberlist();
		model.addAttribute("list", list);
		return "admin/memberlist";
	}
	
	
	
	
	
}













