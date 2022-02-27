package com.radio.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.radio.domain.PictureRoomVO;

public interface PictureRoomMapper {

	public int insert(PictureRoomVO vo);
	public int insertSelectKey(PictureRoomVO vo);
	public PictureRoomVO selectById(Long id);
//	public List<PictureRoomVO> list(Criteria cri);
	public int delete(Long id);
	public int update(PictureRoomVO vo);
	public List<PictureRoomVO> list(@Param("from") Long from, @Param("length") Long length);
}
