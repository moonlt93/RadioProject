package com.radio.controller;


import java.security.Principal;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.radio.domain.CenterVO;
import com.radio.domain.Criteria;
import com.radio.domain.PageDTO;
import com.radio.mapper.MemberMapper;
import com.radio.service.CenterService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/service")
@AllArgsConstructor
@Log4j
public class CenterController {

	@Setter(onMethod_ = @Autowired)
	private CenterService service;
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/register")
	public void registerView(CenterVO vo) {
		log.info("-- register view --"); 
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register")
	public String register(CenterVO vo, Criteria cri, RedirectAttributes rttr) {
		log.info("-- register controller 실행 --");
		service.register(vo);
		
		rttr.addAttribute(cri.getPageNum());
		rttr.addAttribute(cri.getAmount()); 
		return "redirect:/service/member";
	}
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/member")
	public void list(@ModelAttribute("cri") Criteria cri, Model model, Principal principal) {
		String username = principal.getName();	
		int total = service.getTotal(cri);		
		PageDTO dto = new PageDTO(cri, total);
		
		cri.setId(username);
		
		log.info(username);
	 
		log.info("-- list view --");
		log.info(cri); 
		log.info("아이디 : " + username);				
		
			
		List<CenterVO> list = service.center_list(cri);
		 
		log.info(list);
		
		model.addAttribute("list", list);
		model.addAttribute("page", dto);	
	}
	
	//채형이의 메세지 쓰는 법은 제가 찾아놧어여 ㅎㅎ
	//언니 ROLE_ADMIN 맞는지 확인해보세용
	//그리구 주소도 맴에 안들면 바꾸세여!!
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin")
	public void listForAdmin(@ModelAttribute("cri") Criteria cri, Model model, Principal principal) {
		String username = principal.getName();
		int total = service.getTotal_manager(cri);		
		PageDTO dto = new PageDTO(cri, total);
		 
		cri.setId(username);
		
		log.info("-- manager_list view --");
		log.info(cri); 
				
		List<CenterVO> list = service.manager_list(cri);
		 
		log.info(list);
		
		model.addAttribute("list", list);
		model.addAttribute("page", dto);
	
	}
	
	@GetMapping("/read")
	public void get(
			@RequestParam("center_bno")Long center_bno, 
			@ModelAttribute("cri")Criteria cri, 
			Model model) {
		
		log.info(cri);
		CenterVO vo = service.getRead(center_bno);
		model.addAttribute("CenterVO", vo);	
		model.addAttribute("cen_bno", center_bno);
	}
	
	@PostMapping("/delete_member")
	public String delete_member(
			@RequestParam("center_bno") Long center_bno, 
			@ModelAttribute("cri")Criteria cri, 
			RedirectAttributes rttr) {
		log.info("-- member_list delete --");
		
		if(service.delete(center_bno) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
	
		return "redirect:/service/member"; 
	}
	
	@PostMapping("/delete_admin")
	public String delete_admin(
			@RequestParam("center_bno") Long center_bno, 
			@ModelAttribute("cri")Criteria cri, 
			RedirectAttributes rttr) {
		log.info("-- admin_list delete --");
		
		if(service.delete(center_bno) == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/service/admin";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/com_register")
	public String com_register(
			CenterVO vo,
			RedirectAttributes rttr) {
			
			log.info("-- 답글 --");  
		
			int reg = service.com_register(vo);
			System.out.println(reg);
			
	
		rttr.addFlashAttribute("CenterVO", vo);
		rttr.addAttribute("center_bno", vo.getCenter_bno());
			 
		return "redirect:/service/read";
	}
	
}
