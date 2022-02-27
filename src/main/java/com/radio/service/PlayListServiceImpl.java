package com.radio.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.radio.domain.Criteria;
import com.radio.domain.PlayListVO;
import com.radio.mapper.PlayListMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class PlayListServiceImpl implements PlayListService {

	@Setter(onMethod_ = @Autowired)
	private PlayListMapper mapper;

	
	

	@Override
	public void register(PlayListVO board) {

		log.info("register..." + board);

		mapper.insertSelectKey(board);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public PlayListVO get(Long bno) {

		mapper.boardHit(bno);
		log.info("get......" + bno);

		return mapper.read(bno);
	}

	@Override
	public List<PlayListVO> getList(Criteria cri) {

		return mapper.getListWithPaging(cri);
	}

	@Override
	public boolean modify(PlayListVO board) {

		log.info("modify...." + board);
		return mapper.update(board) == 1;

	}

	@Override
	public boolean remove(Long bno) {

		log.info("remove..." + bno);

		return mapper.delete(bno) == 1;
	}

	@Override
	public int getTotal(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
