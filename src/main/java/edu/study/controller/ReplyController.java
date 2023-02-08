package edu.study.controller;
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

import edu.study.dao.ReplyDAO;
import edu.study.service.LikeService;
import edu.study.service.ReplyService;
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
    public List<ReplyVO> replyList(Model model, int bidx) throws Exception{
    	System.out.println("reply cont \n bidx : " + bidx);
        
        return replyService.replyList(bidx);
    }
    
    @RequestMapping("/insert") //¥Ò±€ ¿€º∫ 
    @ResponseBody
    public int replyInsert(ReplyVO ro, MemberVo mo, Model model) throws Exception{
        
        System.out.println( "ReplyCon : " +  ro.getBidx() + "\n" + ro.getPcontent()  + "\n" + ro.getPtitle() );
        
        model.addAttribute(mo);
        return replyService.replyInsert(ro);
    }
    
    @RequestMapping("/update") //¥Ò±€ ºˆ¡§  
    @ResponseBody
    public int replyUpdate(ReplyVO ro, MemberVo mo) throws Exception{
        

        
        return replyService.replyUpdate(ro);
    }
    
    
    @RequestMapping("/delete/{pidx}") //¥Ò±€ ªË¡¶  
    @ResponseBody
    private int replyDelete(@PathVariable int pidx) throws Exception{
        
        return replyService.replyDelete(pidx);
    }
    
	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="like", method=RequestMethod.GET,
	 * produces="text/plain;charset=UTF-8") public List<LikeVO> readLike(int pidx,
	 * HttpSession session, List<ReplyVO> rolist, int bidx, ReplyVO ro) { JSONObject
	 * obj = new JSONObject(); int midx = (Integer)session.getAttribute("midx");
	 * 
	 * HashMap <String, Object> hashMap = new HashMap<String, Object>();
	 * hashMap.put("pidx", pidx); hashMap.put("midx", midx);
	 * 
	 * List<LikeVO> lo = likeService.readLike(hashMap);
	 * 
	 * rolist = replyService.replyList(bidx);
	 * 
	 * int plike = .getPlike();
	 * 
	 * if(likeService.countbyLike(hashMap)==0) { likeService.create(hashMap); }
	 * 
	 * if(like_check == 0) { likeService.like_check(hashMap); like_check++;
	 * like_cnt++; replyService.like_cnt_up(pidx); }else {
	 * likeService.like_check_cancel(hashMap); like_check--; like_cnt--;
	 * replyService.like_cnt_down(pidx); }
	 * 
	 * 
	 * return likeService.readLike(hashMap);
	 * 
	 * }
	 */
    
}