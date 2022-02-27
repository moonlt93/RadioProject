package com.radio.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.radio.domain.CenterVO;
import com.radio.domain.Criteria;
 
import com.radio.mapper.CenterMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CenterServiceImpl implements CenterService{
	
	@Setter(onMethod_ = @Autowired)
	private CenterMapper mapper;
	
	@Override
	public int register(CenterVO vo) {
		return mapper.register(vo);
	}
	
	@Override
	public List<CenterVO> center_list(Criteria cri) {
		List<CenterVO> list = mapper.center_list(cri);
		log.info(list); 		
		return list;		
	}
	
	@Override
	public List<CenterVO> manager_list(Criteria cri) {
		List<CenterVO> list = mapper.manager_list(cri);
		log.info(list);
		return list;
	}
	
	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotal(cri);
	}
	
	@Override
	public int getTotal_manager(Criteria cri) {
		return mapper.getTotal_manager(cri);
	}
	 
	@Override
	public CenterVO getRead(Long center_bno) { 
		return mapper.getRead(center_bno);
	}
	
	@Override
	public int delete(Long center_bno) {
		return mapper.delete(center_bno);
	} 
	
	public int com_register(CenterVO vo) {
		return mapper.com_register(vo);
	};
}

