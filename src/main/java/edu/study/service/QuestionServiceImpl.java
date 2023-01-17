package edu.study.service;

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
		
		return questionDAO.selectByBidx(bidx);	//�뜲�씠�꽣踰좎씠�뒪�뿉 �젒洹쇳븯�뒗 �뵒�뿉�씠�삤
	}

	
	@Override
	public int updateByBidx(BoardVo vo) {
		
		return questionDAO.updateByBidx(vo);
	}

	@Override
	public int insert(BoardVo vo) {
		
		return questionDAO.insert(vo);
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

	
}
