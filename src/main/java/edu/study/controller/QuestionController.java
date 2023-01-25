package edu.study.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.QuestionService;
import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
import edu.study.vo.PageVO;
import edu.study.vo.SearchCriteria;

@RequestMapping(value = "/question")
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
		FileVO fvo = questionService.selectFileByBidx(bidx);

		model.addAttribute("vo", vo);
		model.addAttribute("fvo", fvo);
		return "question/questionView";
	}

	@RequestMapping(value = "/questionModify.do", method = RequestMethod.GET)
	public String questionModify(int bidx, Model model) {

		BoardVo vo = questionService.selectByBidx(bidx);

		model.addAttribute("vo", vo);
		return "question/questionModify";
	}

	@RequestMapping(value = "/questionModify.do", method = RequestMethod.POST)
	public String questionModify2(BoardVo vo) {

		int result = questionService.updateByBidx(vo);
		if (result > 0) {
			return "redirect:questionView.do?bidx=" + vo.getBidx();
		} else {
			return "/";
		}
	}

	@RequestMapping(value = "/questionWrite.do", method = RequestMethod.GET)
	public String questionWrite() {

		return "question/questionWrite";
	}

	@RequestMapping(value = "/questionWrite.do", method = RequestMethod.POST)
	public String questionWrite2(BoardVo vo, MultipartFile upload, HttpServletRequest req)
			throws IllegalStateException, IOException {
		
		questionService.insert(vo);
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

			questionService.fileInsert(file_name);

		}
		return "redirect:questionView.do?bidx=" + vo.getBidx();

	}

	@RequestMapping(value = "/questionDelete.do", method = RequestMethod.GET)
	public String delete(int bidx) {

		questionService.deleteByBidx(bidx);

		return "redirect:questionList.do";

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
