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
	
	@Override
	public MemberVo login(MemberVo vo)throws Exception {
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

	@Override
	public int selectById(String mid) {

		return memberdao.selectById(mid);
	}

	@Override
	public int register(MemberVo vo){
		
		return memberdao.register(vo);
	}

	@Override
	public List<MemberVo> memberlist() {
		
		return memberdao.memberlist();
	}

	@Override
	public void inserMember(MemberVo vo) {
	}

	@Override
	public void deleteMember(String mid) {
	}

	@Override
	public void updateMember(MemberVo vo) {

	}

	@Override
	public String changeStotus(MemberVo vo) throws Exception {
		
		return memberdao.changeStotus(vo);
	}

	//아이디찾기
	@Override
	public String get_searchId(String mname, String mphone) {
		// TODO Auto-generated method stub
		return null;
	}


	}
