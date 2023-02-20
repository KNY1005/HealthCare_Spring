package edu.study.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MemberDAO;
import edu.study.vo.BoardVo;
import edu.study.vo.MemberVo;
import edu.study.vo.ReserveVo;

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

	@Override
	public String changeStotus(MemberVo vo) throws Exception {

		return memberdao.changeStotus(vo);
	}
	
	@Override
	public String changedelyn(MemberVo vo) throws Exception {

		return memberdao.changedelyn(vo);
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

    	String mpwd = vo.getMpwd();
		vo.setMpwd(memberSha256.encrypt(mpwd));
		System.out.println("여기는요?"+vo);
	    		
	   return memberdao.updateMember(vo);
	}

	@Override
	public List<BoardVo> selectMyBoard(int midx) {
		
		return memberdao.selectMyBoard(midx);
	}

	@Override
	public List<ReserveVo> selectMyBoard1(int midx) {

		return memberdao.selectMyBoard1(midx);
	}

	@Override
	public List<ReserveVo> selectMyBoard2(int midx) {

		return memberdao.selectMyBoard2(midx);
	}

	@Override
	public List<ReserveVo> selectMyBoard3(int midx) {

		return memberdao.selectMyBoard3(midx);
	}
}
