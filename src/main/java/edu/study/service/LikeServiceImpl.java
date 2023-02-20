package edu.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.LikeDAO;
import edu.study.vo.LikeVO;
import edu.study.vo.ReplyVO;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired
	private LikeDAO likeDAO;


	@Override
	public int countbyLike(int pidx) {
	
		return likeDAO.countbyLike(pidx);
	}

	@Override
	public int likeUp(LikeVO lo) {
		
		return likeDAO.likeUp(lo);
	}

	@Override
	public int readLike(LikeVO lo) {
		
		return likeDAO.readLike(lo);
	}

	@Override
	public int deletebyLike(LikeVO lo) {
		
		return likeDAO.deletebyLike(lo);
	}

	

}
