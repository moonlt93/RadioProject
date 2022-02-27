package com.radio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.VideoVO;
import com.radio.domain.Video_Criteria;
import com.radio.domain.Video_PageDTO;
import com.radio.service.VideoService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/video/*")
@AllArgsConstructor
public class VideoController {
	
	@Setter(onMethod_= @Autowired)
	private VideoService service;
	
	
	//게시물 조회
	@GetMapping("/video_list")
	public void getList(Video_Criteria video_Criteria, Model model) {
		log.info("*************(GET)video_list 실행**************");
		List<VideoVO> list = service.getList(video_Criteria);
		
		model.addAttribute("pageInfo", new Video_PageDTO(video_Criteria, service.getTotal()));
		model.addAttribute("list", list);
	}
	
	
	
	
	//게시물 등록
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/video_register")
	public void register(Video_Criteria video_Criteria) {
		log.info("*************(GET)video_register 실행**************");
	}
	
	
	
	@PostMapping("/video_register")
	
	public String register(VideoVO videoVO, Video_Criteria video_Criteria, 
			MultipartFile thumbnail, MultipartFile vod,RedirectAttributes rttr) {
		log.info("*************(POST)video_reigster 실행**************");
		
		//registerForm에서 받아온 정보로 일단 등록한 후 게시물 번호 받음
		service.register(videoVO);
		
		//thumbnail 처리
		if (thumbnail != null) {
			videoVO.setVideo_thumbnail(videoVO.getVideo_bno() + "_" + thumbnail.getOriginalFilename());
			service.modify(videoVO);
			try {
				service.transfer(thumbnail, videoVO.getVideo_thumbnail());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		//vod(영상) 처리
		if (vod != null) {
			videoVO.setVideo_vod(videoVO.getVideo_bno() + "_" + vod.getOriginalFilename());
			service.modify(videoVO);
			try {
				service.transfer(vod, videoVO.getVideo_vod());
				rttr.addFlashAttribute("message", videoVO.getVideo_bno() + "번 게시물이 등록되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		rttr.addAttribute("video_bno", videoVO.getVideo_bno());
		rttr.addAttribute("pageNum", video_Criteria.getPageNum());
		rttr.addAttribute("amount", video_Criteria.getAmount());
		
		
		return "redirect:/video/video_list";
	}
	
	
	
	//게시물 읽기
	@GetMapping("/video_read")
	public void read(Long video_bno, Video_Criteria cri, Model model) {
		log.info("*************(GET)video_read 실행**************");
		VideoVO videoVO = service.read(video_bno);
		
		
		
		model.addAttribute("videoVO", videoVO);
	}
	
	
	
	
	//게시물 수정
	@GetMapping("/video_modify")
	public void modify(Long video_bno, Video_Criteria video_Criteria, Model model) {
		log.info("*************(GET)video_modify 실행**************");
		
		VideoVO videoVO = service.read(video_bno);
		model.addAttribute("videoVO", videoVO);
		
	}
	
	
	
	
	@PostMapping("/video_modify")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public String modify(VideoVO videoVO, Video_Criteria video_Criteria,
			MultipartFile thumbnail, MultipartFile vod,RedirectAttributes rttr) {	
		log.info("*************(POST)video_list 실행**************");
		
		//thumbnail 처리
		if (thumbnail != null) {
			videoVO.setVideo_thumbnail(videoVO.getVideo_bno() + "_" + thumbnail.getOriginalFilename());
			service.modify(videoVO);
			try {
				service.transfer(thumbnail, videoVO.getVideo_thumbnail());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		//vod(영상) 처리
		if (vod != null) {
			videoVO.setVideo_vod(videoVO.getVideo_bno() + "_" + vod.getOriginalFilename());
			service.modify(videoVO);
			try {
				service.transfer(vod, videoVO.getVideo_vod());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}

		if(service.modify(videoVO)) {
			rttr.addFlashAttribute("message", videoVO.getVideo_bno() + "번 게시글이 수정되었습니다.");
		}
		
		rttr.addAttribute("pageNum", video_Criteria.getPageNum());
		rttr.addAttribute("amount", video_Criteria.getAmount());
		
		
		return "redirect:/video/video_list";
	}
	
	
	@PostMapping("/video_delete")
	public String delete(Long video_bno, Video_Criteria video_Criteria, RedirectAttributes rttr) {
		
		if(service.delete(video_bno)) {
			rttr.addFlashAttribute("message", video_bno + "번 게시글이 삭제되었습니다.");
		}
		
		rttr.addAttribute("pageNum", video_Criteria.getPageNum());
		rttr.addAttribute("amount", video_Criteria.getAmount());
		
		
		return "redirect:/video/video_list";
	}
	
	
	
	
	
	
	
	
	
	
	
}