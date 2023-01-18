package edu.study.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import edu.study.service.QuestionService;
import edu.study.vo.BoardVo;
import edu.study.vo.PageVO;
import edu.study.vo.SearchCriteria;

@RequestMapping(value="/question")	
@Controller
public class QuestionController {

	@Autowired
	private QuestionService questionService;	
	
	@RequestMapping(value = "/questionList.do", method = RequestMethod.GET)	
	public String questionList(SearchCriteria scri, Model model) {	
		List<BoardVo> list = questionService.list(scri);
		model.addAttribute("list", list);		
		PageVO pageVo = new PageVO();
		pageVo.setScri(scri);
		pageVo.setTotalCount(questionService.listCount(scri));
		model.addAttribute("page", pageVo);
		
		return "question/questionList";	
	}
	
	@RequestMapping(value = "/questionView.do", method = RequestMethod.GET)	
	public String questionView(int bidx, Model model) {	
		BoardVo vo = questionService.selectByBidx(bidx); 
		
		model.addAttribute("vo",vo);
		return "question/questionView";	
	}
	
	@RequestMapping(value = "/questionModify.do", method = RequestMethod.GET)	
	public String questionModify(int bidx, Model model) {
				
		BoardVo vo = questionService.selectByBidx(bidx); 
		
		model.addAttribute("vo",vo);
		return "question/questionModify";	
	}
	@RequestMapping(value = "/questionModify.do", method = RequestMethod.POST)	
	public String questionModify2(BoardVo vo) {
				
		int result = questionService.updateByBidx(vo); 		
		if(result>0) {
		return "redirect:questionView.do?bidx="+vo.getBidx();	
		}else {
			return "/";
		}
	}
	
	@RequestMapping(value = "/questionWrite.do", method = RequestMethod.GET)	
	public String questionWrite() {	
		
		return "question/questionWrite";	
	}		
	@RequestMapping(value = "/questionWrite.do", method = RequestMethod.POST)	
	public String questionWrite2(BoardVo vo) {	
		int result = questionService.insert(vo);
		return "redirect:questionView.do?bidx="+vo.getBidx();	
	}	
	
}
