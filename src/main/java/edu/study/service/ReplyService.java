package edu.study.service;

import java.util.List;

import edu.study.vo.ReplyVO;

public interface ReplyService {
	public List<ReplyVO> readReply(int bidx) throws Exception;

	public void writeReply(ReplyVO vo) throws Exception;
}
