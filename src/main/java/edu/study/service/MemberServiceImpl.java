package edu.study.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MemberDAO;
import edu.study.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberdao;
	@Autowired
	private SqlSessionTemplate memberSqlSession;
	
	//로그인
	@Override
	public MemberVo login(MemberVo vo) throws Exception {
		System.out.println(vo.getMid());

		System.out.println("UserLoginService // 로그인 객체 확인 userVO : " + vo);
		String mid = vo.getMid();
		String mpwd = vo.getMpwd();

		MemberVo membervo = memberdao.login(vo);
		System.out.println("UserLoginService // 로그인 객체 확인 vo : " + membervo);

		// 로그인 결과값
		int result = 0;

		return memberdao.login(vo);
	}
	
	//이름중복검사
	@Override
	public int selectById(String mid) {

		return memberdao.selectById(mid);
	}

	//회원가입 
	@Override
	public int register(MemberVo vo) {

		return memberdao.register(vo);
	}
	
	//회원정보 리스트
	@Override
	public List<MemberVo> memberlist() {

		return memberdao.memberlist();
	}

	//미구현(등급 수정)
	@Override
	public String changeStotus(MemberVo vo) throws Exception {

		return memberdao.changeStotus(vo);
	}

	// 아이디찾기
	@Override
	public MemberVo memberIdSearch(MemberVo searchVo) {
		return memberdao.searchId(searchVo);
	}
	
	//비밀번호 찾기
	@Override
	public int memberPwdCheck(MemberVo searchVo) {
		
		return memberdao.memberPwdCheck(searchVo);
	}
	
	//임의 비밀번호 업데이트
	@Override
	public String passwordUpdate(MemberVo searchVo) {
		
		return memberdao.passwordUpdate(searchVo);
	}
	
	//midx로 회원정보 찾기
	@Override
	public MemberVo selectByMidx(int midx) {
	
		return memberdao.selectByMidx(midx);
	}

	@Override
	public void inserMember(MemberVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteMember(String mid) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateMember(MemberVo vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int selectByDoctor(String ddoctor) {
		// TODO Auto-generated method stub
		return memberdao.selectByDoctor(ddoctor);
	}

}
