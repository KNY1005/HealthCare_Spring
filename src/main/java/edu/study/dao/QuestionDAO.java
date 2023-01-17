package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;
import edu.study.vo.SearchCriteria;

@Repository
public class QuestionDAO {

	@Autowired
	private SqlSession sqlSession;

	public BoardVo selectByBidx(int bidx) {	
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); //留덉씠諛뷀떚�뒪媛� �젣怨�,�븳嫄� 議고쉶
	}

	public List<BoardVo> listSearch(SearchCriteria scri) {
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.listSearch",scri);
	}	
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.listCount");
	}
	
	
	public int updateByBidx(BoardVo vo) {	//int 紐뉕굔�씠 泥섎━�릺�뿀�뒗媛�(移댁슫�듃 媛�)
		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx", vo); //�뾽�뜲�씠�듃�뒗 寃곌낵異쒕젰 �뾾�쓬
	}
	
	public int insert(BoardVo vo) {	
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo);
	}

	public int maxBidx() {	//由ъ젅�듃 ���엯�씠 int 諛섑솚�룄 int
		
		return sqlSession.selectOne("edu.study.mapper.boardMapper.maxBidx");
	}
}
