package edu.study.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import edu.study.service.LikeService;
import edu.study.service.MedicalTalkService;
import edu.study.service.ReplyService;
import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
import edu.study.vo.LikeVO;
import edu.study.vo.PageVO;
import edu.study.vo.ReplyVO;
import edu.study.vo.SearchCriteria;

@RequestMapping(value="/medicalTalk")
@Controller
public class MedicalTalkController{
	
	
	@Autowired
	private MedicalTalkService medicaltalkService;
	private LikeService likeService;
	private ReplyService replyService;
	
	@RequestMapping(value = "/medicalList.do", method = RequestMethod.GET)
	public String medicalList(SearchCriteria scri, Model model) {
		List<BoardVo> list = medicaltalkService.list(scri);
		model.addAttribute("list",list);
		PageVO pageVo = new PageVO();
		pageVo.setScri(scri);
		pageVo.setTotalCount(medicaltalkService.listCount(scri));
		model.addAttribute("page",pageVo);
		
		return "medicalTalk/medicalList";
	}
	
	@RequestMapping(value = "/medicalView.do", method = RequestMethod.GET)
	public String medicalview(int bidx, Model model) throws Exception {
		BoardVo vo = medicaltalkService.selectByBidx(bidx);
		FileVO fvo = medicaltalkService.selectFileByBidx(bidx);
		
		model.addAttribute("vo",vo);
		model.addAttribute("fvo", fvo);
		
		
		return "medicalTalk/medicalView";
		
	}
	@RequestMapping(value = "/medicalModify.do", method = RequestMethod.GET)	
	public String medicalmodify(int bidx, Model model) {
				
		BoardVo vo = medicaltalkService.selectByBidx(bidx); 
		
		model.addAttribute("vo",vo);
		return "medicalTalk/medicalModify";	
	}
	@RequestMapping(value = "/medicalModify.do", method = RequestMethod.POST)	
	public String medicalmodify(BoardVo vo) {
				
		int result = medicaltalkService.updateByBidx(vo); 		
		if(result>0) {
		return "redirect:medicalView.do?bidx="+vo.getBidx();	
		}else {
			return "/";
		}
	}
	
	@RequestMapping(value = "/medicalWrite.do", method = RequestMethod.GET)
	public String medicalWrite() {

		return "medicalTalk/medicalWrite";
	}
	
	
	@RequestMapping(value = "/medicalWrite.do", method = RequestMethod.POST)
	public String medicalWrite2(BoardVo vo, MultipartFile upload, HttpServletRequest req)
			throws IllegalStateException, IOException {
		
		medicaltalkService.insert(vo);
		String path = req.getSession().getServletContext().getRealPath("/resources/upload");
		File dir = new File(path);
		System.out.println(""+path);
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

			medicaltalkService.fileInsert(file_name);

		}
		return "redirect:medicalView.do?bidx=" + vo.getBidx();

	}
	@RequestMapping(value = "/fileDown.do")
	public void downloadFile(int bidx, HttpServletRequest request, HttpServletResponse response) throws Exception {
		//https://velog.io/@oyeon/%ED%8C%8C%EC%9D%BC-%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C-%EA%B5%AC%ED%98%84
		FileVO fvo = new FileVO();
		fvo = medicaltalkService.selectFileByBidx(bidx);
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/");
		String saveFileName = fvo.getStoredname();
		String originalFileName = fvo.getOriginname();
		System.out.println(""+path);
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
	@RequestMapping(value = "/medicalDelete.do", method = RequestMethod.GET)
	public String delete(int bidx) {

		medicaltalkService.deleteByBidx(bidx);

		return "redirect:medicalList.do";

	}
	
	
	
}
