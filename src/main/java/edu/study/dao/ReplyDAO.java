package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.ReplyVO;

@Repository
public class ReplyDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int replyCount(ReplyVO ro){
		return sqlSession.selectOne("edu.study.mapper.boardMapper.replyCount", ro);
	}
	
	public List<ReplyVO> replyList(int bidx){
		return sqlSession.selectList("edu.study.mapper.boardMapper.replyList", bidx);
	}
	 
    // ¥Ò±€ ¿€º∫
    public int replyInsert(ReplyVO ro){	
		return sqlSession.insert("edu.study.mapper.boardMapper.replyInsert", ro);
	}
    
    // ¥Ò±€ ºˆ¡§
    public int replyUpdate(ReplyVO ro){
		return sqlSession.update("edu.study.mapper.boardMapper.replyUpdate", ro);
	}
 
    // ¥Ò±€ ªË¡¶
    public int replyDelete(int pidx){
	
		return sqlSession.delete("edu.study.mapper.boardMapper.replyDelete", pidx);
	}

	public int like_cnt_up(int pidx) {
		
		return sqlSession.update("edu.study.mapper.boardMapper.like_cnt_up", pidx);
	}
	
	public int like_cnt_down(int pidx) {
		
		return sqlSession.update("edu.study.mapper.boardMapper.like_cnt_down", pidx);
		
	}
	
	public ReplyVO selectByReply(int pidx) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByReply", pidx);
	}
	
	
}
	
	
	
	
	


