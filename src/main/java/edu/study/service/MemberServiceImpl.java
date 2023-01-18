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
		System.out.println("여기니");
		return MemberDAO.login(vo);
	}

	@Override
	public int selectById(String mid) {

		return MemberDAO.selectById(mid);
	}




	}
