package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.ShotVo;

@Repository //서비스에서 의존 자동 주입위해 필수 작성
public class ShotDAO {

	@Autowired
	private SqlSession sqlSession;	//bean 의존 주입
	
	
	
	public int selectById(String id) {
		return sqlSession.selectOne("edu.study.mapper.userMapper.selectById", id);
	}
	
	public List<ShotVo> list(){
		
		return sqlSession.selectList("edu.study.mapper.shotMapper.list");
		
	}

	
}
