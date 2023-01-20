package edu.study.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.QuestionService;
import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
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
		//HashMap 매개변수로 넣어줘야 전달이 되는데 파일 업로드를 할경우가 있고 안할경우가 있다.
		questionService.insert(vo);
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");		
		File dir = new File(path);
		System.out.println("bidx값은?"+vo.getBidx());
		HashMap<String,String> file_name = new HashMap<String,String>(); 
		
		
		//System.out.println("파일이름은1?"+vo.getFilename());
		//for(String key : keys) {sum += map.get(key);	}
		if(!dir.exists()) {	//directory가 있는지 없는지 
			dir.mkdirs();
		}
		if(!upload.getOriginalFilename().isEmpty()) {
			System.out.println("파일이름은2?"+upload.getOriginalFilename());
			System.out.println("업로드는?"+upload);	
			int pos = upload.getOriginalFilename().lastIndexOf(".");
	        String ext = upload.getOriginalFilename().substring(pos + 1);	        
	        Date now = new Date();
	        String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);

	        int random = (int) ((Math.random() * 100) + 1);
	        String result2 = today + random;
	        String changeName=result2+"."+ext;
	        String originName = upload.getOriginalFilename();
			upload.transferTo(new File(changeName));	
			System.out.println("변환된 파일이름은?"+changeName);
			file_name.put("originname",originName);
			file_name.put("storedname",changeName);
			
			System.out.println("파일의 값은?"+file_name.values());
			questionService.fileInsert(file_name);
			
		}		
		return "redirect:questionView.do?bidx="+vo.getBidx();	
		
	}	
	@RequestMapping(value = "/questionDelete.do", method = RequestMethod.GET)
	public String delete(int bidx) {	
		
		questionService.deleteByBidx(bidx);	
		
		return "redirect:questionList.do";
		
	}
	
}












