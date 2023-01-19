package edu.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.QuestionDAO;
import edu.study.vo.BoardVo;
import edu.study.vo.SearchCriteria;

@Service
public class QuestionServiceImpl implements QuestionService{

	@Autowired
	private QuestionDAO questionDAO;

	@Override
	public BoardVo selectByBidx(int bidx) {	
		
		return questionDAO.selectByBidx(bidx);	//占쎈�뀐옙��占쎄숲甕곗���占쎈�わ옙肉� 占쎌��域뱀�노릭占쎈�� 占쎈�占쎈�占쎌��占쎌��
	}

	
	@Override
	public int updateByBidx(BoardVo vo) {
		
		return questionDAO.updateByBidx(vo);
	}
	

	@Override
	public int maxBidx() {
		// TODO Auto-generated method stub
		return questionDAO.maxBidx();
	}


	@Override
	public List<BoardVo> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return questionDAO.listSearch(scri);
	}


	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return questionDAO.listCount(scri);
	}


	@Override
	public int deleteByBidx(int bidx) {
		// TODO Auto-generated method stub
		return questionDAO.deleteByBidx(bidx);
	}


	@Override
	public int boardHitUpdate(int midx) {
		// TODO Auto-generated method stub
		return questionDAO.boardHitUpdate(midx);
	}


	@Override
	public int insert(BoardVo vo) {
		// TODO Auto-generated method stub
		return questionDAO.insert(vo);
	}

	
}
