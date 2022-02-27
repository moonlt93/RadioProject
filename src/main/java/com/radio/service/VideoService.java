package com.radio.service;

import java.util.List;	

import org.springframework.web.multipart.MultipartFile;

import com.radio.domain.VideoVO;
import com.radio.domain.Video_Criteria;

public interface VideoService {
	
	public List<VideoVO> getList(Video_Criteria cri);
	
	public void register(VideoVO videoVO);
	
	public VideoVO read(Long video_bno);
	
	public boolean modify(VideoVO videoVO); 
	
	public boolean delete(Long videoVO_bno);
	
	public int getTotal();
	
	public void transfer(MultipartFile file, String fileName) throws Exception;
	
	

	
	
	

}