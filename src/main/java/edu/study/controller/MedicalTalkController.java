package edu.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.MedicalTalkService;
import edu.study.vo.BoardVo;
import edu.study.vo.PageVO;
import edu.study.vo.SearchCriteria;

@RequestMapping(value="/medical_talk")

@Controller
public class MedicalTalkController{
	
	@Autowired
	private MedicalTalkService medicaltalkService;
	
	@RequestMapping(value = "/medicaltalkList.do", method = RequestMethod.GET)
	public String medicalList(SearchCriteria scri, Model model) {
		List<BoardVo> list = medicaltalkService.list(scri);
		model.addAttribute("list",list);
		PageVO pageVo = new PageVO();
		pageVo.setScri(scri);
		pageVo.setTotalCount(medicaltalkService.listCount(scri));
		model.addAttribute("page",pageVo);
		
		return "medicaltalk/medicaltalkList";
	}
	
	@RequestMapping(value = "/medicalview.do", method = RequestMethod.GET)
	public String medicalview(int bidx, Model model) {
		BoardVo vo = medicaltalkService.selectByBidx(bidx);
		
		model.addAttribute("vo",vo);
		return "medicaltalk/medicalview";
	}
	@RequestMapping(value = "/medicalmodify.do", method = RequestMethod.GET)	
	public String medicalmodify(int bidx, Model model) {
				
		BoardVo vo = medicaltalkService.selectByBidx(bidx); 
		
		model.addAttribute("vo",vo);
		return "medicaltalk/medicalmodify";	
	}
	@RequestMapping(value = "/medicalmodify.do", method = RequestMethod.POST)	
	public String medicalmodify(BoardVo vo) {
				
		int result = medicaltalkService.updateByBidx(vo); 		
		if(result>0) {
		return "redirect:medicalview.do?bidx="+vo.getBidx();	
		}else {
			return "/";
		}
	}
	
	@RequestMapping(value = "/medicalwrite.do", method = RequestMethod.GET)	
	public String medicalwrite() {	
		
		return "medicaltalk/medicalwrite";	
	}		
}
