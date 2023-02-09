package edu.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.LikeVO;
import edu.study.vo.ReplyVO;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int like_check(HashMap hashMap){
		return sqlSession.update("edu.study.mapper.boardMapper.like_check",hashMap);
	}
	
	public int like_check_cancel(HashMap hashMap) {
		return sqlSession.update("edu.study.mapper.boardMapper.like_check_cancel",hashMap);
	}
	
	public int countbyLike(HashMap hashMap) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.countbyLike",hashMap);
	}

	public int create(HashMap hashMap) {
		return sqlSession.insert("edu.study.mapper.boardMapper.create",hashMap);
	}
	
	public LikeVO readLike(HashMap hashMap) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.readLike",hashMap);
	}
	
	public int deletebyMidxLike(int midx) {
		return sqlSession.delete("edu.study.mapper.boardMapper.deletebyMidxLike",midx);
	}
	
	public int deletebyPidxLike(int pidx) {
		return sqlSession.delete("edu.study.mapper.boardMapper.deletebyPidxLike",pidx);
	}
}
