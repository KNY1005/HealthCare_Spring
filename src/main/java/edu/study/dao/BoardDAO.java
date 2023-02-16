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

	public BoardVo selectByBidx(int bidx) {	//蹂대��釉��댁�ㅻ� 諛���
		return sqlSession.selectOne("edu.study.mapper.boardMapper.selectByBidx", bidx); //留��대��곗�ㅺ� ��怨�,��嫄� 議고��
	}

	public List<BoardVo> list(SearchCriteria scri) {
		scri.setBlist("N");
		return sqlSession.selectList("edu.study.mapper.boardMapper.listSearch",scri);
	}
	
	public int listCount(SearchCriteria scri) {
		return sqlSession.selectOne("edu.study.mapper.boardMapper.listCount",scri);
	}
	
	public int updateByBidx(BoardVo vo) {	//int 紐�嫄댁�� 泥�由щ������媛�(移댁�댄�� 媛�)
		return sqlSession.update("edu.study.mapper.boardMapper.updateByBidx", vo); //���곗�댄�몃�� 寃곌낵異��� ����
	}
	
	public int insert(BoardVo vo) {	
		return sqlSession.insert("edu.study.mapper.boardMapper.insert", vo);
	}

	public int maxBidx() {	//由ъ���� ������ int 諛����� int
		
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
