package edu.study.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import edu.study.service.ReplyService;
import edu.study.vo.ReplyVO;

@Controller
@RequestMapping("/medicalTalk/medicalView/reply")
public class ReplyController {
 
	@Autowired
	private ReplyService replyService;
    
	
    @RequestMapping("/list") 
    @ResponseBody
    public List<ReplyVO> replyList(Model model, int bidx) throws Exception{
        
        return replyService.replyList(bidx);
    }
    
    @RequestMapping("/insert") //댓글 작성 
    @ResponseBody
    public int replyInsert(@RequestParam int bidx, @RequestParam String pcontent) throws Exception{
        
        ReplyVO ro = new ReplyVO();
        ro.setBidx(bidx);
        ro.setPcontent(pcontent);
        //로그인 기능을 구현했거나 따로 댓글 작성자를 입력받는 폼이 있다면 입력 받아온 값으로 사용하면 됩니다. 저는 따로 폼을 구현하지 않았기때문에 임시로 "test"라는 값을 입력해놨습니다.
        ro.setPwriter("test");  
        
        return replyService.replyInsert(ro);
    }
    
    @RequestMapping("/update") //댓글 수정  
    @ResponseBody
    public int replyUpdate(@RequestParam int pidx, @RequestParam String pcontent) throws Exception{
        
    	ReplyVO ro = new ReplyVO();
        ro.setPidx(pidx);
        ro.setPcontent(pcontent);
        ro.setPwriter("test");  
        
        return replyService.replyUpdate(ro);
    }
    
    
    @RequestMapping("/delete/{pidx}") //댓글 삭제  
    @ResponseBody
    private int replyDelete(@PathVariable int pidx) throws Exception{
        
        return replyService.replyDelete(pidx);
    }
    
}
 
