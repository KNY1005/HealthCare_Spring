package edu.study.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;
import edu.study.vo.MemberVo;
import edu.study.vo.ReserveVo;

@Repository
public class MemberDAO {

	@Inject
	@Autowired
	private SqlSession sqlSession;

	// 관리자 기능
	// 회원 전체 정보 출력(탈퇴회원포함)
	public List<MemberVo> memberlist() {
		return sqlSession.selectList("edu.study.mapper.memberMapper.memberlist");
	}

	// 가입 회원 정보 풀력
	public List<MemberVo> selectEnabled() {
		return null;
	}

	// 회원등급 수정
	public int updateRole(int midx, String mgrade) {
		return 0;
	}

	public MemberVo login(MemberVo vo) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.login", vo);
	}

	public int selectById(String mid) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.selectById", mid);
	}
	
	public int selectByDoctor(String ddoctor) {

			return sqlSession.selectOne("edu.study.mapper.memberMapper.selectByDoctor", ddoctor);
		}
	
	public int register(MemberVo vo) {

		return sqlSession.insert("edu.study.mapper.memberMapper.register", vo);
	}

	public String changeStotus(MemberVo vo) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.changeStotus", vo);
	}

	public MemberVo searchId(MemberVo searchVo) {
		
		return sqlSession.selectOne("edu.study.mapper.memberMapper.searchId", searchVo);
	}
	
	public int memberPwdCheck(MemberVo searchVo) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.memberPwdCheck", searchVo);
	}
	
	public String passwordUpdate(MemberVo searchVo) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.passwordUpdate", searchVo);
	}
	
	public MemberVo selectByMidx(int midx) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.selectByMidx", midx);
	}
	
	public MemberVo updateMember(MemberVo vo) {

		return sqlSession.selectOne("edu.study.mapper.memberMapper.updateMembe", vo);
	}
	
	public List<BoardVo> selectMyBoard(int midx) {

		return sqlSession.selectList("edu.study.mapper.memberMapper.selectMyBoard", midx);
	}
	public List<ReserveVo> selectMyBoard1(int midx) {

		return sqlSession.selectList("edu.study.mapper.memberMapper.selectMyBoard1", midx);
	}
	public List<ReserveVo> selectMyBoard2(int midx) {

		return sqlSession.selectList("edu.study.mapper.memberMapper.selectMyBoard2", midx);
	}
	public List<ReserveVo> selectMyBoard3(int midx) {

		return sqlSession.selectList("edu.study.mapper.memberMapper.selectMyBoard3", midx);
	}

}