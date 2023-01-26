package edu.study.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.study.dao.MedicalTalkDAO;
import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
import edu.study.vo.SearchCriteria;

@Service
public class MedicalTalkServiceImpl implements MedicalTalkService{
	
	@Autowired
	private MedicalTalkDAO medicaltalkDAO;


	@Override
	public List<BoardVo> list(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.listSearch(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.listCount(scri);
	}

	@Override
	public BoardVo selectByBidx(int bidx) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.selectByBidx(bidx);
	}

	@Override
	public int updateByBidx(BoardVo vo) {
		
		return medicaltalkDAO.updateByBidx(vo);
	}

	@Override
	public int insert(BoardVo vo) {
		
		return medicaltalkDAO.insert(vo);
	}

	@Override
	public int maxBidx() {
		// TODO Auto-generated method stub
		return medicaltalkDAO.maxBidx();
	}

	@Override
	public int deleteByBidx(int bidx) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.deleteByBidx(bidx);
	}

	@Override
	public int boardHitUpdate(int midx) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.boardHitUpdate(midx);
	}

	@Override
	public int fileInsert(HashMap<String, Object> file_name) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.fileInsert(file_name);
	}

	@Override
	public FileVO selectFileByBidx(int bidx) {
		// TODO Auto-generated method stub
		return medicaltalkDAO.selectFileByBidx(bidx);
	}

}
