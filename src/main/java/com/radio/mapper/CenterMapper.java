package com.radio.mapper;

import java.util.List;


import com.radio.domain.CenterVO;
import com.radio.domain.Criteria;


public interface CenterMapper {
	
	public int register(CenterVO vo);
	
	public List<CenterVO> center_list(Criteria cri);

	public int getTotal(Criteria cri);

	public List<CenterVO> manager_list(Criteria cri);

	public int getTotal_manager(Criteria cri);
	
	public CenterVO getRead(Long center_bno);
	
	public int delete(Long center_bno);
	
	public int com_register(CenterVO vo);
	
}
