package edu.study.service;

import java.util.List;

import edu.study.vo.ReserveVo;
import edu.study.vo.ShotVo;

public interface ShotService {

	List<ShotVo> list(ShotVo vo);	
	ShotVo selectinfo(ShotVo vo);
	int insert(ReserveVo vo);
	List<ReserveVo> list(ReserveVo vo);
	int updatebuy(ReserveVo vo);
	ReserveVo selectByRidx(int ridx);
}
