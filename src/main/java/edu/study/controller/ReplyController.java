package edu.study.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.study.service.LikeService;
import edu.study.service.ReplyService;
import edu.study.vo.BoardVo;
import edu.study.vo.LikeVO;
import edu.study.vo.MemberVo;
import edu.study.vo.ReplyVO;

@Controller
@RequestMapping("/medicalTalk/medicalView/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService;
	@Autowired
	private LikeService likeService;

	@RequestMapping("/list")
	@ResponseBody
	public List<ReplyVO> replyList(Model model, int bidx, MemberVo mo) throws Exception {
		System.out.println("reply cont \n bidx : " + bidx);
		
		
		model.addAttribute(mo);
		


		return replyService.replyList(bidx);
	}

	@RequestMapping("/insert") // ´ñ±Û ÀÛ¼º
	@ResponseBody
	public int replyInsert(ReplyVO ro, MemberVo mo, Model model, BoardVo vo) throws Exception {

		System.out.println("ReplyCon : " + ro.getBidx() + "\n" + ro.getPcontent() + "\n" + ro.getPtitle());

		model.addAttribute(mo);
		model.addAttribute(vo);
		
		return replyService.replyInsert(ro);
	}

	@RequestMapping("/update") // ´ñ±Û ¼öÁ¤
	@ResponseBody
	public int replyUpdate(ReplyVO ro, MemberVo mo) throws Exception {

		return replyService.replyUpdate(ro);
	}

	@RequestMapping("/delete/{pidx}") // ´ñ±Û »èÁ¦
	@ResponseBody
	private int replyDelete(@PathVariable int pidx) throws Exception {

		return replyService.replyDelete(pidx);
	}

	
	@ResponseBody
	@RequestMapping(value="like.do", method=RequestMethod.GET, produces="text/plain;charset=UTF-8") 
	public String readLike(BoardVo vo, HttpSession session, MemberVo mo, LikeVO lo) {
		
		ReplyVO ro = new ReplyVO();
		HashMap <String, Object>hashMap = new HashMap<String, Object>();
		if(likeService.countbyLike(hashMap)==0) {
			likeService.create(hashMap);
		    }
		lo.setLike_check(likeService.like_check(hashMap));
		
		
		System.out.println(vo.toString());
		System.out.println(lo.toString());
		System.out.println("$$$$$$$$$$"+lo);
		
		JSONObject obj = new JSONObject();
		/*
		 * int midx = mo.getMidx(); int pidx = ro.getPidx(); int bidx = vo.getBidx();
		 * String pwriter = ro.getPwriter();
		 */
		
		System.out.println("midx´Â ´ã±è?"+mo);
		ArrayList<String> msgs = new ArrayList<String>();
		
		
		  
		hashMap.put("pidx", ro.getPidx()); 
		hashMap.put("midx", mo.getMidx());
		hashMap.put("pwriter", ro.getPwriter());
		hashMap.put("bidx", vo.getBidx());
		
		System.out.println("midx´Â ´ã±è?"+mo);
		System.out.println("midx´Â ´ã±è?"+ro);
		System.out.println("midx´Â ´ã±è?"+vo);
		
		  
		lo = likeService.readLike(hashMap);
		System.out.println("#########"+lo);
		  
		List<ReplyVO> rolist = replyService.replyList(vo.getBidx());
		  

		
		int plikecount = ro.getPlikecount();                                                     
		int like_check = 0;
		like_check = lo.getLike_check();
		  
		  
		if(likeService.countbyLike(hashMap)==0) { 
			likeService.create(hashMap); 
		}if(like_check == 0) {
			msgs.add("ÁÁ¾Æ¿ä!");
			likeService.like_check(hashMap);
			like_check++; 
			plikecount++; replyService.like_cnt_up(ro.getPidx()); 
		}else {
			msgs.add("ÁÁ¾Æ¿ä Ãë¼Ò");
			likeService.like_check_cancel(hashMap);
			like_check--;
			plikecount--; 
			replyService.like_cnt_down(ro.getPidx());
		}
		
		ro.setPlikecount(replyService.like_cnt_up(plikecount));
		obj.put("ro.getPidx()", lo.getPidx()); 
		obj.put("like_check", lo.getLike_check());
		obj.put("plikecount", ro.getPlikecount());
		obj.put("msg", msgs);
		 	 
		return obj.toJSONString();

		
	}
	 

}