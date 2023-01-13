package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public BoardVo selectByBidx(int bidx) {	//보드브이오로 반환
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); //마이바티스가 제공,한건 조회
	}

	public List<BoardVo> list() {
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.list");
	}
	
	
}
