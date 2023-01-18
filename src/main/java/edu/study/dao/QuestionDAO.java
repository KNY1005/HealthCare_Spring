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
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); //筌띾뜆�뵠獄쏅��뼒占쎈뮞揶쏉옙 占쎌젫�⑨옙,占쎈립椰꾬옙 鈺곌퀬�돳
	}

	public List<BoardVo> listSearch(SearchCriteria scri) {
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.listSearch",scri);
	}	
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.listCount");
	}
	
	
	public int updateByBidx(BoardVo vo) {	//int 筌뤿돂援뷂옙�뵠 筌ｌ꼶�봺占쎈┷占쎈�占쎈뮉揶쏉옙(燁삳똻�뒲占쎈뱜 揶쏉옙)
		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx", vo); //占쎈씜占쎈쑓占쎌뵠占쎈뱜占쎈뮉 野껉퀗�궢�빊�뮆�젾 占쎈씨占쎌벉
	}
	
	public int insert(BoardVo vo) {	
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo);
	}

	public int maxBidx() {	//�뵳�딆쟿占쎈뱜 占쏙옙占쎌뿯占쎌뵠 int 獄쏆꼹�넎占쎈즲 int
		
		return sqlSession.selectOne("edu.study.mapper.boardMapper.maxBidx");
	}
}
