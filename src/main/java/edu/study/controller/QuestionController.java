package edu.study.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

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
	public String questionWrite2(BoardVo vo,MultipartFile upload,HttpServletRequest req)throws IllegalStateException, IOException {	
		int result = questionService.insert(vo);
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		File dir = new File(path);		
		if(!dir.exists()) {	//directory가 있는지 없는지 
			dir.mkdirs();
		}
		if(!upload.getOriginalFilename().isEmpty()) {
			int pos = upload.getOriginalFilename().lastIndexOf(".");
	        String ext = upload.getOriginalFilename().substring(pos + 1);
	            
	        Date now = new Date();
	        String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);

	        int random = (int) ((Math.random() * 100) + 1);
	        String result2 = today + random;
	        
			upload.transferTo(new File(path,result2+"."+ext));
			System.out.println("upload는"+upload);
		}
		return "redirect:questionView.do?bidx="+vo.getBidx();	
	}	
	@RequestMapping(value = "/questionDelete.do", method = RequestMethod.GET)
	public String delete(int bidx) {	
		
		questionService.deleteByBidx(bidx);	
		
		return "redirect:questionList.do";
		
	}
	@RequestMapping(value="/fileupload.do", method = RequestMethod.POST)
	public String fileupload(MultipartFile uploadF1,HttpServletRequest req)throws IllegalStateException, IOException {
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		File dir = new File(path);
		if(!dir.exists()) {	//directory가 있는지 없는지 
			dir.mkdirs();
		}
		if(!uploadF1.getOriginalFilename().isEmpty()) {
			int pos = uploadF1.getOriginalFilename().lastIndexOf(".");
	        String ext = uploadF1.getOriginalFilename().substring(pos + 1);
	            
	        Date now = new Date();
	        String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);

	        int random = (int) ((Math.random() * 100) + 1);
	        String result = today + random;
	        
			uploadF1.transferTo(new File(path,result+"."+ext));
			
		}
	
		return "redirect:questionWrite.do";
	}
}












