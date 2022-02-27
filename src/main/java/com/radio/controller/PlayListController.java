package com.radio.controller;

import java.util.List;


import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.radio.domain.Criteria;
import com.radio.domain.PageDTO;
import com.radio.domain.PlayListVO;
import com.radio.service.PlayListService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@AllArgsConstructor
@Controller
@Log4j
@RequestMapping("/playlist/*")
public class PlayListController {
	

	private PlayListService service;
	
	
	@GetMapping("/play")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		List<PlayListVO> list = service.getList(cri);
		
		int total = service.getTotal(cri);
		
		PageDTO dto = new PageDTO(cri, total);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", dto);
	}
	
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	 public void register(Criteria cri) {
		
		
	 }
	
	
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(PlayListVO board, RedirectAttributes rttr) {
		log.info("register: "+board);
		
		service.register(board);
		
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/playlist/play";
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri, Model model) {
		/** 예전 코드 (스프링 없이) 
		String boardNum = request.getParameter("num");
		int num = Integer.parseInt(boardNum);
		
		BoardVO vo = service.get((long) num);
		
		request.setAttribute("board", vo);
		
		request.getRequestDispatcher(".jsp").forward();
		*/
		
		log.info("get method - bno: " + bno);
		log.info(cri);
		
		
		
		PlayListVO vo = service.get(bno);
		model.addAttribute("board", vo);
		
		
//		model.addAttribute("cri", cri);
	}
	
	@PostMapping("/modify")
	public String modify(PlayListVO board, Criteria cri, RedirectAttributes rttr) {
		log.info("modify:"+board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result","success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount() );
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addAttribute("type", cri.getType());
		
		
		return "redirect:/playlist/play";
	}
	
	@PostMapping("/remove")
	public String delete(Long bno,Criteria cri, RedirectAttributes rttr) {
		log.info("************delete 실행*************");
		
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
	
		
		
		return "redirect:/playlist/play";
	}
	
	
	
	
	
	
}
