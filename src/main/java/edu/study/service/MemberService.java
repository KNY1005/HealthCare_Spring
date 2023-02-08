package edu.study.service;

import java.util.List;

import edu.study.vo.MemberVo;


public interface MemberService {
	
	/*로그인*/
	public MemberVo login(MemberVo vo)throws Exception;
	/*아이디 중복확인*/
	public int selectById(String mid);
	
	/*회원가입*/
	public int register(MemberVo vo);
	
	/*회원목록*/
	public List<MemberVo> memberlist();
	
	/*등급변경*/
	public String changeStotus(MemberVo vo)throws Exception;
	
	/*회원 입력*/
	public void inserMember(MemberVo vo);
	
	/*회원삭제*/
	public void deleteMember(String mid);
	
	/*회원정보 수정*/
	public void updateMember(MemberVo vo);
	
	//아이디찾기
	public String get_searchId(String mname, String mphone);
	


}
