package edu.study.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.study.vo.BoardVo;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSession sqlSession;

	public BoardVo selectByBidx(int bidx) {	//보드브이오로 반환
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); //마이바티스가 제공,한건 조회
	}

	public List<BoardVo> list(BoardVo vo) {
		
		return sqlSession.selectList("edu.study.mapper.boardMapper.list",vo);
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
	
	
}
