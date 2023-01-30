package edu.study.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import edu.study.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	@Inject SqlSession sql;

	@Override
	public List<ReplyVO> readReply(int bidx) throws Exception {
		
		return sql.selectList("edu.study.mapper.boardMapper.readReply",bidx);
	}


	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		sql.insert("edu.study.mapper.boardMapper.writeReply",vo);
		
	}

}
