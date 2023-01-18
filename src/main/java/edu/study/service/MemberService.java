package edu.study.service;

import java.util.List;

import edu.study.vo.MemberVo;


public interface MemberService {
	MemberVo login(MemberVo vo);
	int selectById(String mid);
}
