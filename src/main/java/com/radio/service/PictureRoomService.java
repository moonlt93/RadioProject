package com.radio.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.radio.domain.PictureRoomVO;

public interface PictureRoomService {

	void register(PictureRoomVO vo);

	void transfer(MultipartFile file, String fileName) throws Exception;

	List<PictureRoomVO> list(Long from, Long length);

	PictureRoomVO get(Long id);

	boolean delete(Long id);

	boolean modify(PictureRoomVO vo);

}
