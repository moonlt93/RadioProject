package com.radio.service;

import java.util.List;

import com.radio.domain.Board_Criteria;
import com.radio.domain.Board_ReplyVO;

public interface Board_ReplyService {
	public int register(Board_ReplyVO vo);
	
	public Board_ReplyVO read(Long reply_bno);
	
	public int modify(Board_ReplyVO vo);
	
	public int delete(Long reply_bno);
	
	public List<Board_ReplyVO> getList(Board_Criteria cri, Long board_bno);
	
}
