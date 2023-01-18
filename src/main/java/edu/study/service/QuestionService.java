package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.BoardVo;
import edu.study.vo.SearchCriteria;

@Service
public interface QuestionService {

	
	List<BoardVo> list(SearchCriteria scri);
	int listCount(SearchCriteria scri);
	
	BoardVo selectByBidx(int bidx); 
	
	int updateByBidx(BoardVo vo);
	int insert(BoardVo vo);
	int maxBidx();
	int deleteByBidx(int bidx);
	int boardHitUpdate(int midx);
}
