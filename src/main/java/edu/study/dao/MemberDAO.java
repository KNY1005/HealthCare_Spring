package edu.study.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.MemberVo;

@Repository
public class MemberDAO {

	@Inject
	@Autowired
	private SqlSession sqlSession;
	
	/*관리자 기능*/
	// 회원 전체 정보 출력(탈퇴회원포함)
	public List<MemberVo> memberlist(){
		return sqlSession.selectList("edu.study.mapper.memberMapper.memberlist");
	}
	//가입 회원 정보 풀력
	public List<MemberVo> selectEnabled(){
		return null;
	}
		
	// 회원 전체 정보 출력(탈퇴회원포함)
	public int updateRole(int midx, String mgrade){
		return 0;
	}
	
	
	/*사용자기능*/
	/*로그인*/
	public MemberVo login(MemberVo vo){
		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.login", vo);
	}
	
	/*아이디 중복검사(미구현)*/
	public int selectById(String mid) {
		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.selectById", mid);
	}
	
	/*회원가입*/
	public int register(MemberVo vo) {

		return sqlSession.insert("edu.study.mapper.memberMapper.register", vo);
	}

	
}