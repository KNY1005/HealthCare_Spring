package edu.study.service;

import java.util.List;

import edu.study.vo.LikeVO;
import edu.study.vo.ReplyVO;


public interface ReplyService {
	
	
	int replyInsert(ReplyVO ro);
	
	int replyUpdate(ReplyVO ro);
	
	int replyDelete(int pidx);

	List<ReplyVO> replyList(int bidx);
	
	ReplyVO selectByReply(int pidx);
	
	
}
