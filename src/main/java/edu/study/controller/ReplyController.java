package edu.study.controller;


import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
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
	
	@ResponseBody
	@RequestMapping("/likeUp")
	public int likeUp(LikeVO lo, ReplyVO ro, MemberVo mo, Model model) throws Exception{
		model.addAttribute(mo);
		model.addAttribute(lo);
		model.addAttribute(ro);
		
		System.out.println("여기 탔어 ?");
		
		return likeService.likeUp(lo);
	}

	@RequestMapping("/list")
	@ResponseBody
	public List<ReplyVO> replyList(ReplyVO ro, Model model, int bidx, MemberVo mo, LikeVO lo) throws Exception {
		System.out.println("reply cont \n bidx : " + bidx);
		
		LikeVO like = new LikeVO();
		
		like.setMidx(like.getMidx());
		like.setPidx(like.getPidx());
		
		
		model.addAttribute("like", like);
		
		System.out.println("like는 ---->" + like);
		
		
		
		model.addAttribute(ro);
		model.addAttribute(mo);
		model.addAttribute(lo);
		System.out.println(lo.toString()+"@#@!@##$");
		System.out.println(mo.toString()+"@#@!#$");
		
		return replyService.replyList(bidx);
	}

	@RequestMapping("/insert") // ۼ
	@ResponseBody
	public int replyInsert(ReplyVO ro, MemberVo mo, Model model, BoardVo vo) throws Exception {

		System.out.println("ReplyCon : " + ro.getBidx() + "\n" + ro.getPcontent() + "\n" + ro.getPtitle());

		model.addAttribute(mo);
		model.addAttribute(vo);
		
		return replyService.replyInsert(ro);
	}

	@RequestMapping("/update") //
	@ResponseBody
	public int replyUpdate(ReplyVO ro, MemberVo mo) throws Exception {

		return replyService.replyUpdate(ro);
	}

	@RequestMapping("/delete/{pidx}") //
	@ResponseBody
	private int replyDelete(@PathVariable int pidx) throws Exception {

		return replyService.replyDelete(pidx);
	}

	

	
	@ResponseBody
	@RequestMapping("/likeDown/{like_check}")
	private int likeDown(LikeVO lo, @PathVariable int like_check, Model model) throws Exception{
		model.addAttribute(lo);
		
		System.out.println("lo값은 ------>"+ lo);
		
		return likeService.deletebyLike(like_check);
	}

	
	

}