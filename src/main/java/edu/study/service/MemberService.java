package edu.study.service;

import java.util.List;

import edu.study.vo.MemberVo;


public interface MemberService {
	public MemberVo login(MemberVo vo)throws Exception;
	
	public int selectById(String mid);
	
	/*회원가입*/
	public int register(MemberVo vo);
	
	/*회원목록*/
	public List<MemberVo> memberlist();
	
	/*등급변경*/
	public String changeStotus(MemberVo vo)throws Exception;
	
	
	
	/*회원 입력*/
	public void inserMember(MemberVo vo);
	
	/*회원 정보 상세보기*/
	public MemberVo viewMember();
	
	/*회원삭제*/
	public void deleteMember(String mid);
	
	/*회원정보 수정*/
	public void updateMember(MemberVo vo);


}
