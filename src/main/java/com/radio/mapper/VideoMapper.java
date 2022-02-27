package com.radio.mapper;

import java.util.List;

import com.radio.domain.VideoVO;
import com.radio.domain.Video_Criteria;

public interface VideoMapper {
	public List<VideoVO> getList(Video_Criteria cri);
	
	public void register(VideoVO videoVO);
	
	public VideoVO read(Long video_bno); 
	
	public int modify(VideoVO videoVO);
	
	public int delete(Long video_bno);
	
	public int getTotal();
	
	public void increaseView_cnt(Long video_bno);
	
	
}