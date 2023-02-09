package edu.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.LikeDAO;
import edu.study.vo.LikeVO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDAO likeDAO;

	@Override
	public int like_check(HashMap hashMap) {
		
		return likeDAO.like_check(hashMap);
		
	}

	@Override
	public int like_check_cancel(HashMap hashMap) {
		
		return likeDAO.like_check_cancel(hashMap);
	}

	@Override
	public int countbyLike(HashMap hashMap) {
	
		return likeDAO.countbyLike(hashMap);
	}

	@Override
	public int create(HashMap hashMap) {
		
		return likeDAO.create(hashMap);
	}

	@Override
	public LikeVO readLike(HashMap hashMap) {
		
		return likeDAO.readLike(hashMap);
	}

	@Override
	public int deletebyMidxLike(int midx) {
		
		return likeDAO.deletebyMidxLike(midx);
	}

	@Override
	public int deletebyPidxLike(int pidx) {
		
		return likeDAO.deletebyPidxLike(pidx);
	}

	

}
