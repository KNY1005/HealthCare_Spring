package edu.study.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.LikeVO;
import edu.study.vo.ReplyVO;

@Repository
public class LikeDAO {
	
	@Autowired
	private SqlSession sqlSession;

	
	public int countbyLike(ReplyVO ro) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.countbyLike",ro);
	}

	public int likeUp(LikeVO lo) {
		return sqlSession.insert("edu.study.mapper.boardMapper.countbyLike",lo);
	}
	
	public int readLike(LikeVO lo) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.readLike",lo);
	}
	
	public int deletebyLike(int likeno) {
		return sqlSession.delete("edu.study.mapper.boardMapper.deletebyLike",likeno);
	}

}
