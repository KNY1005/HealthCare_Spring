package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;
import edu.study.vo.ReserveVo;
import edu.study.vo.ShotVo;

@Repository //서비스에서 의존 자동 주입위해 필수 작성
public class ShotDAO {

	@Autowired
	private SqlSession sqlSession;	//bean 의존 주입
	
	public List<ShotVo> list(ShotVo vo){
		
		return sqlSession.selectList("edu.study.mapper.shotMapper.shotList");
		
	}

	public ShotVo selectinfo(ShotVo vo) {
		return sqlSession.selectOne("edu.study.mapper.shotMapper.selectinfo");
	}
	
	public int reserveInsert(ReserveVo vo) {
		return sqlSession.insert("edu.study.mapper.shotMapper.reserveInsert",vo);
	}
	
	public List<ReserveVo> reservelist(ReserveVo vo) {
		return sqlSession.selectList("edu.study.mapper.shotMapper.reservelist",vo);
	}
	
	public int updatebuy(ReserveVo vo) {	
		return sqlSession.update("edu.study.mapper.boardMapper.updatebuy", vo);
	}
}
