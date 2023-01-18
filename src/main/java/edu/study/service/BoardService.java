package edu.study.service;

import java.util.List;

import edu.study.vo.BoardVo;
import edu.study.vo.SearchCriteria;


public interface BoardService {

	
	BoardVo selectByBidx(int bidx); //업무로직에 맞게 이름 짓기
	List<BoardVo> list(SearchCriteria scri);
	int listCount(SearchCriteria scri);
	int updateByBidx(BoardVo vo);
	int deleteByBidx(int bidx);
	int insert(BoardVo vo);
	int maxBidx();
	int boardHitUpdate(int midx);
	
}
