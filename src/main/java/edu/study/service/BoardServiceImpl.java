package edu.study.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.BoardDAO;
import edu.study.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService{	//추상메소드 정의

	@Autowired
	private BoardDAO boardDAO;

	@Override
	public BoardVo selectByBidx(int bidx) {	
		
		return boardDAO.selectByBidx(bidx);	//데이터베이스에 접근하는 디에이오
	}

	@Override
	public List<BoardVo> list(BoardVo vo) {
		
		return boardDAO.list(vo);
	}

	@Override
	public int updateByBidx(BoardVo vo) {
		
		return boardDAO.updateByBidx(vo);
	}

	@Override
	public int insert(BoardVo vo) {
		
		return boardDAO.insert(vo);
	}

	@Override
	public int maxBidx() {
		// TODO Auto-generated method stub
		return boardDAO.maxBidx();
	}

	@Override
	public int deleteByBidx(int bidx) {
		// TODO Auto-generated method stub
		return boardDAO.deleteByBidx(bidx);
	}

	


	
}