package edu.study.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import edu.study.dao.ReplyDAO;
import edu.study.vo.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService{
	
	@Inject
	private ReplyDAO dao;

	@Override
	public List<ReplyVO> readReply(int bidx) throws Exception {
		
		return dao.readReply(bidx);
	}

	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		dao.writeReply(vo);
		
	}

}
