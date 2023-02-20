package edu.study.controller;

import java.io.File;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import edu.study.service.ShotService;
import edu.study.vo.FileVO;
import edu.study.vo.ReserveVo;


	

@RequestMapping(value="/medical_check")	
@Controller
public class MedicalCheckController {
	@Autowired
	private ShotService shotService;
	

	
	@RequestMapping(value = "medicalmain.do", method = RequestMethod.GET)
	public String medicalmain() {
		
		return "medical_check/medical_check_main";
	}	
	@RequestMapping(value = "medical1.do", method = RequestMethod.GET)
	public String medical1() {
		
		return "medical_check/medical_check1";
	}
	
	
	@RequestMapping(value = "medical2.do", method = RequestMethod.POST)
	
	public String medical2(HttpServletRequest request, Model model){
		String[] hName = request.getParameterValues("hName");
		String[] addr = request.getParameterValues("addr");
		String[] tel = request.getParameterValues("tel");
		
		model.addAttribute("hName",hName[0]);
		model.addAttribute("addr",addr[0]);
		model.addAttribute("tel",tel[0]);
		
		return "medical_check/medical_check2";
	}
	
	@RequestMapping(value = "medicalresult.do", method = RequestMethod.POST)
	public String medicalresult(Model model,ReserveVo rvo) {	


		shotService.insert(rvo);
		int ridx = rvo.getRidx();
		model.addAttribute("rvo",shotService.selectByRidx(ridx));
		
		return "medical_check/medical_check_result";
	}
	
	@RequestMapping(value = "/fileDown.do")
	public void downloadFile(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//https://velog.io/@oyeon/%ED%8C%8C%EC%9D%BC-%EB%8B%A4%EC%9A%B4%EB%A1%9C%EB%93%9C-%EA%B5%AC%ED%98%84
		FileVO fvo = new FileVO();
		String path = request.getSession().getServletContext().getRealPath("/resources/upload/2021년공단검진전체문진표");
		File downloadFile = new File(path + "문진표.pdf");

		byte fileByte[] = FileUtils.readFileToByteArray(downloadFile);

		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);

		response.setHeader("Content-Transfer-Encoding", "binary");

		response.getOutputStream().write(fileByte);
		response.getOutputStream().flush();
		response.getOutputStream().close();

	}
	
	

}
