package edu.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
import edu.study.vo.SearchCriteria;

@Repository
public class MedicalTalkDAO {
	
	@Autowired
	private SqlSession sqlSession;

	public BoardVo selectByBidx(int bidx) {	
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); 
	}

	
	public List<BoardVo> listSearch(SearchCriteria scri) {
		scri.setBlist("Q");
		return sqlSession.selectList("edu.study.mapper.boardMapper.listSearch",scri);
	}	
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.listCount");
	}
	
	public int deleteByBidx(int bidx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("edu.study.mapper.boardMapper.deleteByBidx", bidx);
	}
	
	public int boardHitUpdate(int midx){
		return sqlSession.update("edu.study.mapper.boardMapper.boardHitUpdate", midx);
	}
	
	public int updateByBidx(BoardVo vo) {
		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx", vo); 
	}
	
	public int insert(BoardVo vo) {	
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo);
	}

	public int maxBidx() {	
		
		return sqlSession.selectOne("edu.study.mapper.boardMapper.maxBidx");
	}
	public int fileInsert(HashMap<String,Object> file_name) {
		return sqlSession.update("edu.study.mapper.boardMapper.fileInsert", file_name);
	}
	public FileVO selectFileByBidx(int bidx) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectFileByBidx", bidx);
	}
}



