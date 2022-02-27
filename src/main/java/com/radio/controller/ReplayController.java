package com.radio.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.Criteria;
import com.radio.domain.PageDTO;
import com.radio.domain.ReplayVO;
import com.radio.service.FileUpService;
import com.radio.service.ReplayService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@AllArgsConstructor
@RequestMapping("/replay/*")
@Log4j
public class ReplayController {
	
	private ReplayService service;
	
	private FileUpService fileUpSvc;
	
	/*
	public BoardController(BoardService service) {
		super();
		this.service = service;
	}
	*/

	/*
	// 211 page 표
//	@RequestMapping(value = "/list", method = RequestMethod.GET)
	@GetMapping("/list") 
	// handler 메소드의 return type이 void인 경우
	//   요청경로가 view(jsp)의 이름이 됨 
	//   이 메소드는 (/board/list) -> /board/list.jsp
	public void list(Model model) {
		log.info("******************** list *******************");
		List<BoardVO> list = service.getList();
		model.addAttribute("list", list);
	}
	*/
	
	@GetMapping("/list")
	public void list(@ModelAttribute("cri") Criteria cri, Model model) {
		List<ReplayVO> list = service.getList(cri);
		
		int total = service.getTotal(cri);
		
		PageDTO dto = new PageDTO(cri, total);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", dto);
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void register(@ModelAttribute("cri") Criteria cri) {
	 
	}
	
//	@RequestMapping(value = "/register", method = RequestMethod.POST)
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(ReplayVO board,MultipartFile file, RedirectAttributes rttr,Criteria cri) {
		
		/*
		BoardVO board = new BoardVO();
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		board.setWriter(request.getParameter("writer"));
		*/
		board.setFilename("");
		
		//타입 등록 x
		service.register(board);
		
		// 타입 등록하고 수정되야한다네?-> 다시 물어보기 
		if(file !=null) {
			board.setFilename(board.getBno()+"_"+file.getOriginalFilename());
			service.modify(board);
			try {
				fileUpSvc.transfer(file, board.getFilename());
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		
		rttr.addFlashAttribute("result", board.getBno());
		rttr.addFlashAttribute("message", board.getBno() + "번 글이 등록되었습니다.");
		rttr.addFlashAttribute("pageNum",cri.getPageNum());
		rttr.addFlashAttribute("amount",cri.getAmount());
		
//		return "board/list";
		return "redirect:/replay/list";
	}
	
	// 표: /board/read, 코드: /board/get
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("bno") Long bno,
			@ModelAttribute("cri") Criteria cri, Model model, HttpSession session) {
		/** 예전 코드 (스프링 없이) 
		String boardNum = request.getParameter("num");
		int num = Integer.parseInt(boardNum);
		
		BoardVO vo = service.get((long) num);
		
		request.setAttribute("board", vo);
		
		request.getRequestDispatcher(".jsp").forward();
		*/
		String id = session.getId();
		log.info("get method - bno: " + bno);
		log.info("user-id: "+ id);
		log.info(cri);
		
		ReplayVO vo = service.get(bno);
		model.addAttribute("board", vo);
	

	}
	
	/*
	@GetMapping("/modify")
	public void modify(Long bno, Model model) {
		BoardVO vo = service.get(bno);
		model.addAttribute("board", vo);
	}
	*/
	
	@PostMapping("/modify")
	public String modify(ReplayVO board, Criteria cri, RedirectAttributes rttr) {
		/** 스프링 없이
		BoardVO board = new BoardVO();
		board.setBno(request.getParameter("bno"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		*/
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", board.getBno() + "번 글이 수정되었습니다.");
		}
		log.info(cri);
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/replay/list";
	}
	
	@PostMapping("/modify2")
	public String modify2(ReplayVO board, RedirectAttributes rttr) {
		/** 스프링 없이
		BoardVO board = new BoardVO();
		board.setBno(request.getParameter("bno"));
		board.setTitle(request.getParameter("title"));
		board.setContent(request.getParameter("content"));
		*/
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addAttribute("bno", board.getBno());
			rttr.addAttribute("a", "a");
			rttr.addFlashAttribute("b", "b");
		}
		
		return "redirect:/replay/get";
	}
	
	@PostMapping("/remove")
	public String remove(@RequestParam("bno") Long bno,
			Criteria cri, RedirectAttributes rttr) {
		
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
			rttr.addFlashAttribute("message", bno + "번 글이 삭제되었습니다.");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/replay/list";
	}
	
	
}

// servlet/jsp
// ControllerUsingURI(Servlet) ....properties
//   /list.do -> ListHandler 