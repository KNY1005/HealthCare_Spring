package edu.study.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.BoardService;
import edu.study.vo.BoardVo;



@RequestMapping(value="/notice",produces="text/plain;charset=UTF-8")
@Controller
public class noticeController {

	@Autowired
	private BoardService boardService;	//전체 데이터 요청
	
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)	
	public String board1(Model model,BoardVo vo) {
		//DB list 조회
		List<BoardVo> list = boardService.list(vo);
		model.addAttribute("datalist",list);	//키값
		System.out.println("list:"+list);		
		return "notice/noticeList";	//화면으로 포워드
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)	
	public String board2(int bidx, Model model) {	//파라미터는 무조건 스트링인데 널을 인트로 받으면 오류가 나옴(예외페이지)
		//DB 상세데이터 조회
		
		BoardVo vo = boardService.selectByBidx(bidx); //서비스-디에이오 순으로 데이터 가져오기
		
		model.addAttribute("vo",vo);
		
		return "notice/noticeView";	
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write(BoardVo vo, HttpSession session) {	//세션 객체 꺼내옴
		
		int result = boardService.insert(vo);
		
		//db작업 (insert)
		return "notice/noticeWrite"+vo.getBidx();	//redirect되는 가상경로 -> projectpath/board/list.do
		//return "redirect:/user/list.do"; //redirect되는 가상경로 -> projectpath/user/list.do
	}
}