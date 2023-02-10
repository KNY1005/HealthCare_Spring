package edu.study.service;

import java.util.List;

import edu.study.vo.ShotVo;

public interface ShotService {

	List<ShotVo> list(ShotVo vo);	
	ShotVo selectinfo(ShotVo vo);
}
