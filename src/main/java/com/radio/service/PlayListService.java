package com.radio.service;

import java.util.List;

import com.radio.domain.Criteria;
import com.radio.domain.PlayListVO;

public interface PlayListService {

public void register(PlayListVO board);
	
	public PlayListVO get(Long bno);
	
	public List<PlayListVO> getList(Criteria cri);
	
	public boolean modify(PlayListVO board);
	
	public boolean remove(Long bno);
	
	public int getTotal(Criteria cri);
	
}
