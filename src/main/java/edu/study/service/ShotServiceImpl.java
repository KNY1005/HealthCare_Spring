package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.ShotDAO;
import edu.study.vo.ReserveVo;
import edu.study.vo.ShotVo;

@Service
public class ShotServiceImpl implements ShotService {

	@Autowired
	private ShotDAO shotDAO;
	
	@Override
	public List<ShotVo> list(ShotVo vo) {
		// TODO Auto-generated method stub
		List<ShotVo> list = shotDAO.list(vo);
		
		return list;
	}

	@Override
	public ShotVo selectinfo(ShotVo vo) {
		// TODO Auto-generated method stub
		return shotDAO.selectinfo(vo);
	}

	@Override
	public int insert(ReserveVo vo) {
		// TODO Auto-generated method stub
		return shotDAO.reserveInsert(vo);
	}

	@Override
	public List<ReserveVo> list(ReserveVo vo) {
		// TODO Auto-generated method stub
		List<ReserveVo> list = shotDAO.reservelist(vo);
		
		return list;
	}
	

	
	
}
