package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.ShotDAO;
import edu.study.vo.ShotVo;

@Service
public class ShotServiceImpl implements ShotService {

	@Autowired
	private ShotDAO shotDAO;
	
	@Override
	public List<ShotVo> list() {
		// TODO Auto-generated method stub
		List<ShotVo> list = shotDAO.list();
		
		return list;
	}

	@Override
	public ShotVo selectByUidx(int uidx) {
		// TODO Auto-generated method stub
		return null;
	}

	

	

	
}
