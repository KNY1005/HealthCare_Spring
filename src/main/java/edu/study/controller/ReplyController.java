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
	
	@RequestMapping("/list")
	@ResponseBody
	public List<ReplyVO> replyList(ReplyVO ro, Model model, int bidx, MemberVo mo, LikeVO lo) throws Exception {
		System.out.println("reply cont \n bidx : " + bidx);

		List<ReplyVO> list = replyService.replyList(bidx);
		
		for ( ReplyVO item : list )
		{
			lo.setMidx(mo.getMidx());
			lo.setPidx(item.getPidx());
			
			/* likeService.countbyLike(lo.getPidx()); */		
			item.setLikeCheck(likeService.readLike(lo));
//			System.out.println("reply list / item : like check \n" + lo.toString());
		}
		
		for ( ReplyVO item : list )
		{
			System.out.println("reply list / item : like check \n" + item.toString());
		}
		
//		model.addAttribute("like", like);
		
//		System.out.println("like는 ---->" + like);
		
		
		
//		model.addAttribute(ro);
//		model.addAttribute(mo);
//		model.addAttribute(lo);
//		System.out.println(mo.toString()+"@#@!#$");
		
		return list;
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

	@RequestMapping("/likeUp")
	@ResponseBody
	public int likeUp(LikeVO lo, Model model) throws Exception{
		System.out.println("Like UP call");
		System.out.println("pidx : " + lo.getPidx());
		System.out.println("midx : " + lo.getMidx());
		
		
		
		return likeService.likeUp(lo);
	}

	@ResponseBody
	@RequestMapping("/likeDown")
//	private int likeDown(LikeVO lo, @PathVariable int like_check, Model model) throws Exception{
	private int likeDown(LikeVO lo, Model model) throws Exception{
		System.out.println("Like Down call");
		System.out.println("pidx : " + lo.getPidx());
		System.out.println("midx : " + lo.getMidx());
		
		
		
		return likeService.deletebyLike(lo);
	}
}