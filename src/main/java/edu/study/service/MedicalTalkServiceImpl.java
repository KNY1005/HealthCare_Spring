package edu.study.service;

import java.util.List;

import org.springframework.stereotype.Service;

import edu.study.vo.BoardVo;
import edu.study.vo.SearchCriteria;

@Service
public class MedicalTalkServiceImpl implements MedicalTalkService{

	@Override
	public List<BoardVo> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public BoardVo selectByBidx(int bidx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateByBidx(BoardVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int maxBidx() {
		// TODO Auto-generated method stub
		return 0;
	}

}
