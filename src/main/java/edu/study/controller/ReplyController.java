package edu.study.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import edu.study.service.ReplyService;
import edu.study.vo.MemberVo;
import edu.study.vo.ReplyVO;

@Controller
@RequestMapping("/medicalTalk/medicalView/reply")
public class ReplyController {
 
	@Autowired
	private ReplyService replyService;
    
	
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
    
}
 
