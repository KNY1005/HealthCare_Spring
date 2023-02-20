package edu.study.service;



import edu.study.vo.LikeVO;
import edu.study.vo.ReplyVO;

public interface LikeService {
	
	
	public int countbyLike(int pidx);
	
	public int likeUp(LikeVO lo);
	
	public int readLike(LikeVO lo);
	
	public int deletebyLike(LikeVO lo);
	
	
	
	
	

}
