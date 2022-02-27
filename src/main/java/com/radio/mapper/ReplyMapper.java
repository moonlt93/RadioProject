package com.radio.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Param;

import com.radio.domain.Criteria;
import com.radio.domain.ReplyVO;


public interface ReplyMapper {
	public int insert(ReplyVO vo);
	public ReplyVO read(Long rno);
	public int delete(Long rno);
	public int update(ReplyVO reply);
	public List<ReplyVO> getList( 
			@Param("bno") Long bno);
}
