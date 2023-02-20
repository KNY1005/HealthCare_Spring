package edu.study.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import edu.study.vo.BoardVo;
import edu.study.vo.MemberVo;
import edu.study.vo.ReserveVo;


public interface MemberService {
	
	public MemberVo login(MemberVo vo)throws Exception;
	
	public int selectById(String mid);
	
	public int register(MemberVo vo);
	
	public List<MemberVo> memberlist();
	
	public String changeStotus(MemberVo vo)throws Exception;
	
	public String changedelyn(MemberVo vo)throws Exception;
	
	public MemberVo memberIdSearch(MemberVo searchVo);
	
	public int memberPwdCheck(MemberVo searchVo);
	
	public String passwordUpdate(MemberVo searchVo);
	
	public MemberVo selectByMidx(int midx);

	public int selectByDoctor(String ddoctor);
	
	public MemberVo updateMember(MemberVo vo);

	public List<BoardVo> selectMyBoard(int midx);
	
	public List<ReserveVo> selectMyBoard1(int midx);
	
	public List<ReserveVo> selectMyBoard2(int midx);
	
	public List<ReserveVo> selectMyBoard3(int midx);


}
