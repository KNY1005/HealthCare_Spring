package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.MemberVo;

@Repository
public class MemberDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberVo login(MemberVo vo){
		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.login", vo);
	}
	
	public int selectById(String mid) {
		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.selectById", mid);
	}
	
	
	public int register(MemberVo vo) {

		return sqlSession.insert("edu.study.mapper.memberMapper.register", vo);
	}



	public List<MemberVo> getMemberList() {
		//while문 대신 selectList하면 됨! 세상간단!
		List<MemberVo> memberList = sqlSession.selectList(sqlSession+".memberList");
		System.out.println("DAO: getMemberList결과 - "+memberList);
		return sqlSession.selectOne("edu.study.mapper.memberMapper.findMembers", memberList);
	}



	

	
}