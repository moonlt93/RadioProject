package com.radio.mapper;

import java.util.List;	

import com.radio.domain.BoardVO;
import com.radio.domain.Board_Criteria;

public interface BoardMapper {
	
	
	public List<BoardVO> getList(Board_Criteria cri);
	
	public void increaseRead_cnt(Long board_bno);
	
	public void register(BoardVO boardVO);
	
	public BoardVO read(Long board_bno);
	
	public int delete(Long board_bno);
	
	public int modify(BoardVO boardVO);
	
	public int getTotal(Board_Criteria cri);
	
	public int getToday();

	
}