package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MemberDAO;
import edu.study.vo.MemberVo;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO MemberDAO;

	@Override
	public MemberVo login(MemberVo vo)throws Exception {
		System.out.println(vo.getMid());
		return MemberDAO.login(vo);
	}

	@Override
	public int selectById(String mid) {

		return MemberDAO.selectById(mid);
	}

	@Override
	public int register(MemberVo vo){
		System.out.println("회원가입2");
		System.out.println(vo.getMid());
		System.out.println(vo.getMpwd());
		System.out.println(vo.getMname());
		System.out.println(vo.getMnumber());
		System.out.println(vo.getMphone());
		System.out.println(vo.getMaddrdetail());
		System.out.println(vo.getMmaddzipnum());
		System.out.println(vo.getMemail());
		return MemberDAO.register(vo);
	}




	}
