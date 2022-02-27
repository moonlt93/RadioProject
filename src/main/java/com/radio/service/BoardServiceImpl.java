package com.radio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.radio.domain.BoardVO;
import com.radio.domain.Board_Criteria;
import com.radio.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Log4j
@Service
public class BoardServiceImpl implements BoardService{
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	//게시물 목록
	@Override
	public List<BoardVO> getList(Board_Criteria cri) {
		List<BoardVO> list = mapper.getList(cri);
		
		
		return list;
	}
	
	@Override
	public int getTotal(Board_Criteria cri) {
		
		return mapper.getTotal(cri);
	}
	
	
	//게시물 등록
	@Override
	public void register(BoardVO boardVO) {
		mapper.register(boardVO);		
	}
	
	
	//게시물 읽기(조회수증가)
	@Override
	public BoardVO read(Long board_bno) {
		mapper.increaseRead_cnt(board_bno);
		BoardVO boardVO = mapper.read(board_bno);
		

		return boardVO;
	}
	
	//게시물 얻기(조회수 증가x)
	@Override
	public BoardVO get(Long board_bno) {
		BoardVO boardVO = mapper.read(board_bno);
		

		return boardVO;
	}

	
	//게시물 수정
	@Override
	public boolean modify(BoardVO boardVO) {				
		
		return mapper.modify(boardVO) == 1;
	}
	
	
	
	
	//게시물 삭제
	@Override
	public boolean delete(Long board_bno) {
		
		return mapper.delete(board_bno) == 1;
	}
	
	//오늘 요일정보 받아오기
	@Override
	public int getToday() {
		
		return mapper.getToday();
	}
	
	
	

}