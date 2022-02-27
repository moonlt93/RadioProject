package com.radio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.radio.domain.Board_Criteria;
import com.radio.domain.Board_ReplyVO;
import com.radio.mapper.Board_ReplyMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class Board_ReplyServiceImple implements Board_ReplyService{
	
	@Setter(onMethod_= @Autowired)
	private Board_ReplyMapper mapper;
	
	@Override
	@Transactional
	public int register(Board_ReplyVO vo) {
		
		return mapper.register(vo);
	}

	@Override
	public Board_ReplyVO read(Long reply_bno) {
		
		return mapper.read(reply_bno);
	}

	@Override
	public int modify(Board_ReplyVO vo) {
		
		return mapper.modify(vo);
	}

	@Override
	@Transactional
	public int delete(Long reply_bno) {
	
		return mapper.delete(reply_bno);
	}

	@Override
	public List<Board_ReplyVO> getList(Board_Criteria cri, Long board_bno) {
		
		return mapper.getList(cri, board_bno);
	}

	


}
