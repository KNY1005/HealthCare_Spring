package edu.study.service;

import java.util.List;

import edu.study.vo.MemberVo;


public interface MemberService {
	public MemberVo login(MemberVo vo)throws Exception;
	
	public int selectById(String mid);
	
	/*회원가입*/
	public int register(MemberVo vo);

	/*회원리스트조회*/
	public List<MemberVo> memberlist();

}
