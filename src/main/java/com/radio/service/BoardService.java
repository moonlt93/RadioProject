package com.radio.service;

import java.util.List;

import com.radio.domain.BoardVO;
import com.radio.domain.Board_Criteria;

public interface BoardService {
	
	//게시물 목록
	public List<BoardVO> getList(Board_Criteria cri);
	
	//게시물 등록
	public void register(BoardVO boardVO);
	
	//게시물 읽기
	public BoardVO read(Long board_bno);
	
	//게시물 수정
	public boolean modify(BoardVO boardVO);
	
	//게시물 얻기(조회수 증가x)
	public BoardVO get(Long board_bno);
	
	//게시물 삭제
	public boolean delete(Long board_bno);
	
	//게시물 총 개수
	public int getTotal(Board_Criteria cri);
	
	//오늘날짜 받아오기
	public int getToday();
	
}