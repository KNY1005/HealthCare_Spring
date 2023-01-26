package edu.study.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.BoardService;
import edu.study.service.QuestionService;
import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
import edu.study.vo.PageVO;
import edu.study.vo.SearchCriteria;




@RequestMapping(value="/notice",produces="text/plain;charset=UTF-8")
@Controller
public class noticeController {

	@Autowired
	private BoardService boardService;	//전체 데이터 요청
	@Autowired
	private QuestionService questionService;
	@RequestMapping(value = "/list.do", method = RequestMethod.GET)	
	public String board1(Model model,SearchCriteria scri) {
		//DB list 조회
		List<BoardVo> list = boardService.list(scri);
		model.addAttribute("datalist",list);	//키값
		System.out.println("list:"+list);	
		PageVO pageVo = new PageVO();
		pageVo.setScri(scri);
		pageVo.setTotalCount(boardService.listCount(scri));
		model.addAttribute("page", pageVo);
		
		return "notice/noticeList";	//화면으로 포워드
	}
	
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)	
	public String board2(int bidx, Model model) {	//파라미터는 무조건 스트링인데 널을 인트로 받으면 오류가 나옴(예외페이지)
		//DB 상세데이터 조회
		FileVO fvo = questionService.selectFileByBidx(bidx);
		BoardVo vo = boardService.selectByBidx(bidx); //서비스-디에이오 순으로 데이터 가져오기
		
		model.addAttribute("vo",vo);
		model.addAttribute("fvo", fvo);
		
		boardService.boardHitUpdate(bidx);
		return "notice/noticeView";	
	}
	
	@RequestMapping(value = "/write.do", method = RequestMethod.GET)
	public String write(BoardVo vo) {	
		
			
		//db작업 (insert)
		return "notice/noticeWrite";	//redirect되는 가상경로 -> projectpath/board/list.do
		//return "redirect:/user/list.do"; //redirect되는 가상경로 -> projectpath/user/list.do
	}
	@RequestMapping(value = "/write.do", method = RequestMethod.POST)
	public String write2(BoardVo vo, MultipartFile upload,HttpServletRequest req)throws IllegalStateException, IOException {
		
		int result = boardService.insert(vo);
		
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		File dir = new File(path);
		System.out.println("경로"+path);
		if (!dir.exists()) { 
			dir.mkdirs();
		}
		if (!upload.getOriginalFilename().isEmpty()) {
			HashMap<String, Object> file_name = new HashMap<String, Object>();			
			int pos = upload.getOriginalFilename().lastIndexOf(".");
			String ext = upload.getOriginalFilename().substring(pos + 1);
			Date now = new Date();
			String today = new SimpleDateFormat("yyyyMMddHHmmss").format(now);

			int random = (int) ((Math.random() * 100) + 1);
			String result2 = today + random;
			String changeName = result2 + "." + ext;
			String originName = upload.getOriginalFilename();
			upload.transferTo(new File(path,changeName));
			
			file_name.put("originname", originName);
			file_name.put("storedname", changeName);
			file_name.put("bidx", vo.getBidx());

			boardService.fileInsert(file_name);

		}
		return "redirect:view.do?bidx="+vo.getBidx();
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.GET)	//호출
	public String board4(int bidx, Model model) {
		//DB 상세데이터 조회
		
		BoardVo vo = boardService.selectByBidx(bidx); //정의해논 서비스(업무로직에 맞게 이름 짓기) 그대로 사용
		
		model.addAttribute("vo",vo);	//브이오에 담아서 모델에 넘겨 처리
		
		return "notice/noticeModify";	
	}
	
	@RequestMapping(value = "/modify.do", method = RequestMethod.POST)
	public String modify(BoardVo vo) {	//마이바티스는 파라미터 타입 한건만 가능, 브이오가 더 수월하기 때문에 
		
		int result = boardService.updateByBidx(vo);
		
		if(result>0) {
			return "redirect:view.do?bidx="+vo.getBidx();
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping(value = "/delete.do", method = RequestMethod.GET) //포스트 방식이 좋음
	public String delete(int bidx) {	//맵퍼까지 키값을 넘김
		
		boardService.deleteByBidx(bidx);	//매개변수와 매개값을 사용
		
		return "redirect:list.do";
		
	}
	

    public String detail(@PathVariable int bidx, Model model){
    	BoardVo vo = boardService.selectByBidx(bidx);
        
        model.addAttribute("vo",vo);

        return "board/update";
    }
	
    @RequestMapping(value = "/fileDown.do")
	public void downloadFile(int bidx, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//https://velog.io/@oyeon/%ED%8C%8C%EC%9D%BC-%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C-%EA%B5%AC%ED%98%84
		FileVO fvo = new FileVO();
		fvo = questionService.selectFileByBidx(bidx);
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");
		String saveFileName = fvo.getStoredname();
		String originalFileName = fvo.getOriginname();
		System.out.println("다운로드 경로는"+path);
		File downloadFile = new File(path + saveFileName);

		byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);

		response.setHeader("Content-Disposition",
				"attachment; fileName=\"" + URLEncoder.encode(originalFileName, "UTF-8") + "\";");
		response.setHeader("Content-Transfer-Encoding", "binary");

		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}
	
}
