package com.radio.mapper;

import java.util.List;

import com.radio.domain.Criteria;
import com.radio.domain.PlayListVO;

public interface PlayListMapper {
	
	public List<PlayListVO> getList();
	
	public void insert(PlayListVO board);
	
	public void insertSelectKey(PlayListVO board);
	
	public PlayListVO read(Long bno);
	
	public int delete(Long bno);
	
	public int update(PlayListVO board);

	public List<PlayListVO> getListWithPaging(Criteria cri);

	public int getTotalCount(Criteria cri);
	
	public void boardHit(Long bno);

	


}
