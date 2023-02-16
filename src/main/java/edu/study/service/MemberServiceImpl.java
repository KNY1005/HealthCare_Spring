package edu.study.service;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	public MemberVo login(MemberVo vo) throws Exception {
		System.out.println(vo.getMid());

		String mid = vo.getMid();
		String mpwd = vo.getMpwd();

		MemberVo membervo = memberdao.login(vo);
		int result = 0;

		return memberdao.login(vo);
	}
	
	@Override
	public int selectById(String mid) {

		return memberdao.selectById(mid);
	}

	@Override
	public int register(MemberVo vo) {

		return memberdao.register(vo);
	}
	
	@Override
	public List<MemberVo> memberlist() {

		return memberdao.memberlist();
	}

	//미구현(등급 수정)
	@Override
	public String changeStotus(MemberVo vo) throws Exception {

		return memberdao.changeStotus(vo);
	}

	@Override
	public MemberVo memberIdSearch(MemberVo searchVo) {
		return memberdao.searchId(searchVo);
	}
	
	@Override
	public int memberPwdCheck(MemberVo searchVo) {
		
		return memberdao.memberPwdCheck(searchVo);
	}
	
	@Override
	public String passwordUpdate(MemberVo searchVo) {
		
		return memberdao.passwordUpdate(searchVo);
	}
	
	@Override
	public MemberVo selectByMidx(int midx) {
	
		return memberdao.selectByMidx(midx);
	}

	@Override
	public int selectByDoctor(String ddoctor) {
	
		return memberdao.selectByDoctor(ddoctor);
	}

	@Override
	public MemberVo updateMember(MemberVo vo) {

		return memberdao.updateMember(vo);
	}

	@Override
	public int loginCheck(MemberVo vo, HttpSession session) {
		System.out.println("UserService");
		System.out.println("ID : " + vo.getMid());
		System.out.println("PW : " + vo.getMpwd());
		return memberdao.loginCheck(vo);
	}

}
