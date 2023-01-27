package edu.study.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;
import edu.study.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public BoardVo reply_write(ReplyVO pvo) {
		BoardVo vo = new BoardVo();
		vo.setBidx(pvo.getBidx());
		
		sqlSession.update("reply_up",vo);
		
		int pgrp = sqlSession.selectOne("table_reply_max_pidx");
		
		pvo.setPgrp(pgrp+1);
		
		int result = sqlSession.insert("reply_write",pvo);
		
		int check = sqlSession.selectOne("table_reply_max_pidx");
		
		pvo.setPgrp(check);
		
		int check_update =sqlSession.update("reply_check",pvo);
		
		if(result ==1) {
			vo = sqlSession.selectOne("reply_count",vo);
		}
		return vo;
	}
	
	
	
	
	

}
