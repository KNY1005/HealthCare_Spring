package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MemberDAO;
import edu.study.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberdao;

	@Override
	public MemberVo login(MemberVo vo)throws Exception {
		System.out.println(vo.getMid());
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

	}
