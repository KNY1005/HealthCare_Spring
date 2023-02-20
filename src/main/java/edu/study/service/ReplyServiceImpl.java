package edu.study.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import edu.study.dao.ReplyDAO;
import edu.study.vo.LikeVO;
import edu.study.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Autowired
	private ReplyDAO replyDAO;

	@Override
	public List<ReplyVO> replyList(int bidx){
		
		return replyDAO.replyList(bidx);
	}

	@Override
	public int replyInsert(ReplyVO ro){
		
		return replyDAO.replyInsert(ro);
	}

	@Override
	public int replyUpdate(ReplyVO ro){
		
		return replyDAO.replyUpdate(ro);
	}

	@Override
	public int replyDelete(int pidx){
		
		return replyDAO.replyDelete(pidx);
	}

	@Override
	public int like_cnt_up(LikeVO lo) {
		
		return  replyDAO.like_cnt_up(lo);
	}

	@Override
	public int like_cnt_down(LikeVO lo) {
		
		return replyDAO.like_cnt_down(lo);
	}

	@Override
	public ReplyVO selectByReply(int pidx) {
		
		return replyDAO.selectByReply(pidx);
	}

	
	

}
