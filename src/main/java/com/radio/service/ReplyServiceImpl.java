package com.radio.service;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.radio.domain.ReplyVO;
import com.radio.mapper.ReplayMapper;
import com.radio.mapper.ReplyMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	


	@Override
	@Transactional
	public int register(ReplyVO vo) {	
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

	@Override
	@Transactional
	public int remove(Long rno) {
		ReplyVO vo = mapper.read(rno);

		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList (Long bno) {
		return mapper.getList(bno);
	}

}
