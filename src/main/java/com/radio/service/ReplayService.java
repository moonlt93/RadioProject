package com.radio.service;

import java.util.List;

import com.radio.domain.Criteria;
import com.radio.domain.ReplayVO;



public interface ReplayService {
	
	public void register(ReplayVO board);
	
	// public List<BoardVO> getList();
	
	public List<ReplayVO> getList(Criteria cri);
	
	public ReplayVO get(Long bno);
	
	public boolean remove(Long bno);
	
	public boolean modify(ReplayVO board);
	
	public int getTotal(Criteria cri);
	
	
}




