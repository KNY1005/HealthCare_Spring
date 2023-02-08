package edu.study.service;

import java.util.HashMap;
import java.util.List;

import edu.study.vo.LikeVO;

public interface LikeService {
	
	public int like_check(HashMap hashMap);
	
	public int like_check_cancel(HashMap hashMap);
	
	public int countbyLike(HashMap hashMap);
	
	public int create(HashMap hashMap);
	
	public List<LikeVO> readLike(HashMap hashMap);
	
	public int deletebyMidxLike(int midx);
	
	public int deletebyPidxLike(int pidx);
	
	
	
	

}
