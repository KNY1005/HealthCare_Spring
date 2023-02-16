package edu.study.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import edu.study.vo.MemberVo;


public interface MemberService {
	
	public MemberVo login(MemberVo vo)throws Exception;
	
	public int selectById(String mid);
	
	public int register(MemberVo vo);
	
	public List<MemberVo> memberlist();
	
	public String changeStotus(MemberVo vo)throws Exception;
	
	public MemberVo memberIdSearch(MemberVo searchVo);
	
	public int memberPwdCheck(MemberVo searchVo);
	
	public String passwordUpdate(MemberVo searchVo);
	
	public MemberVo selectByMidx(int midx);

	public int selectByDoctor(String ddoctor);
	
	public MemberVo updateMember(MemberVo vo);

	public int loginCheck(MemberVo vo, HttpSession session);



}
