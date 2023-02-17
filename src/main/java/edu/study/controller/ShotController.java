package edu.study.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.ShotService;
import edu.study.vo.MemberVo;
import edu.study.vo.ReserveVo;
import edu.study.vo.ShotVo;

@RequestMapping(value = "/shot", produces = "text/plain;charset=UTF-8")
@Controller
public class ShotController {

	@Autowired
	private ShotService shotService;

	@RequestMapping(value = "abc1.do", method = RequestMethod.GET)
	public String home1() {

		return "shot/shotCheckMain";
	}

	@RequestMapping(value = "abc2.do", method = RequestMethod.GET)
	public String home2() {

		return "shot/shotPage2";
	}

	@RequestMapping(value = "abc3.do", method = RequestMethod.GET)
	public String shotlist(HttpServletRequest request, Model model, ShotVo vo) { // 매개변수 필요없음

		List<ShotVo> list = shotService.list(vo);
		model.addAttribute("datalist", list);

		String[] zip = request.getParameterValues("zip");
		String[] addr = request.getParameterValues("addr");
		String[] phone = request.getParameterValues("phone");

		System.out.println("������?" + zip[0] + " �ּҴ�?" + addr[0] + " ����ó��?" + phone[0]);
		model.addAttribute("zip", zip[0]);
		model.addAttribute("addr", addr[0]);
		model.addAttribute("phone", phone[0]);

		return "shot/shotPage3";
	}

	/*
	 * @RequestMapping(value = "abc4.do", method = RequestMethod.POST) public String
	 * insert( HttpSession session,ReserveVo vo) {
	 * 
	 * MemberVo login = (MemberVo)session.getAttribute("login");
	 * vo.setMidx(login.getMidx());
	 * 
	 * int result = shotService.insert(vo);
	 * 
	 * return "redirect:abc6.do?Ridx="+vo.getRidx(); }
	 */

	@RequestMapping(value = "abc5.do", method = RequestMethod.GET)
	public String homea() {

		return "shot/reserveFree";
	}

	@RequestMapping(value = "abc6.do", method = RequestMethod.GET)
	public String homeb23() {
		return "shot/reserveCharged";
	}

	@RequestMapping(value = "abc6.do", method = RequestMethod.POST)
	public String homeb(HttpServletRequest request, Model model, ReserveVo vo, HttpSession session) {

		MemberVo midx = (MemberVo) session.getAttribute("midx");
		String[] rname = request.getParameterValues("rname");
		String[] rbuy = request.getParameterValues("rbuy");
		String[] rstate = request.getParameterValues("rstate");
		String[] rdate = request.getParameterValues("rdate");
		String[] rtime = request.getParameterValues("rtime");
		String[] rhospital = request.getParameterValues("rhospital");
		String[] rcase = request.getParameterValues("rcase");
		
		
		shotService.insert(vo);
		int ridx=vo.getRidx();
		System.out.println("ridx는"+ridx);
		model.addAttribute("midx", midx);
		model.addAttribute("rname", rname[0]);
		model.addAttribute("rbuy", rbuy[0]);
		model.addAttribute("rstate", rstate[0]);
		model.addAttribute("rdate", rdate[0]);
		model.addAttribute("rtime", rtime[0]);
		model.addAttribute("rhospital", rhospital[0]);
		model.addAttribute("rcase", rcase[0]);
		model.addAttribute("ridx",ridx);
		

		/*
		 * MemberVo login = (MemberVo)session.getAttribute("login");
		 * vo.setMidx(login.getMidx());
		 */
		
		
	    
	   
		if(rbuy[0] != "") {
			
	    	return "shot/reserveCharged";
	    	
	    }else {
	    	return "shot/reserveFree";
	    }
		
	}

	@RequestMapping(value = "abc8.do", method = RequestMethod.POST)
	public String home8(ReserveVo vo) {
		
		shotService.updatebuy(vo);

		return "shot/shotMoney2";
	}

	@RequestMapping(value = "abc9.do", method = RequestMethod.POST)
	public String home9(ReserveVo vo) {
		shotService.updatebuy(vo);	
		System.out.println("rstate="+vo.getRstate());
		return "mypage/shot_reserve_inquiry";
	}

}
