package edu.study.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.ShotService;
import edu.study.vo.ShotVo;

@RequestMapping(value="/shot",produces="text/plain;charset=UTF-8")
@Controller
public class ShotController {
	
	@Autowired
	private ShotService shotService;
	
	@RequestMapping(value="/list.do", method = RequestMethod.GET)
	public String shotlist(Model model,ShotVo vo) {	//매개변수 필요없음
		
		List<ShotVo> list = shotService.list(vo);
		System.out.println("list:"+list);
		model.addAttribute("datalist",list);
		
		return "shot/shotPage3";	
	}
	
	
	
}
