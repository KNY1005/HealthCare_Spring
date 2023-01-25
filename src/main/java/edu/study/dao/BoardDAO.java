package edu.study.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;
import javax.sql.DataSource;

import edu.study.vo.BoardVo;
import edu.study.vo.FileVO;
import edu.study.vo.SearchCriteria;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public BoardVo selectByBidx(int bidx) {	//보드브이오로 반환
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); //마이바티스가 제공,한건 조회
	}

	public List<BoardVo> list(SearchCriteria scri) {
		scri.setBlist("N");
		return sqlSession.selectList("edu.study.mapper.boardMapper.listSearch",scri);
	}
	
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.listCount");
	}
	
	public int updateByBidx(BoardVo vo) {	//int 몇건이 처리되었는가(카운트 값)
		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx", vo); //업데이트는 결과출력 없음
	}
	
	public int insert(BoardVo vo) {	
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo);
	}

	public int maxBidx() {	//리절트 타입이 int 반환도 int
		
		return sqlSession.selectOne("edu.study.mapper.boardMapper.maxBidx");
	}

	public int deleteByBidx(int bidx) {
		// TODO Auto-generated method stub
		return sqlSession.delete("edu.study.mapper.boardMapper.deleteByBidx", bidx);
	}
	
	public int boardHitUpdate(int midx){
		return sqlSession.update("edu.study.mapper.boardMapper.boardHitUpdate", midx);
	}

	public int fileInsert(HashMap<String, Object> file_name) {
		// TODO Auto-generated method stub
		return sqlSession.update("edu.study.mapper.boardMapper.fileInsert", file_name);
	}
	
	public FileVO selectFileByBidx(int bidx) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectFileByBidx", bidx);
	}
}
