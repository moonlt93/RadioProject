package com.radio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.radio.domain.Board_Criteria;
import com.radio.domain.Board_ReplyVO;

public interface Board_ReplyMapper {
	
	public int register(Board_ReplyVO vo);
	
	public Board_ReplyVO read(Long reply_bno);
	
	public int delete(Long reply_bno);
	
	public int modify(Board_ReplyVO vo);
	
	public List<Board_ReplyVO> getList(
			@Param("cri") Board_Criteria cri,
			@Param("board_bno") Long board_bno);
	
	


}
