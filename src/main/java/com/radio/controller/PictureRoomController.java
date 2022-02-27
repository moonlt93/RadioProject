package com.radio.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.radio.domain.PictureRoomVO;
import com.radio.service.PictureRoomService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/picroom")
@Log4j
public class PictureRoomController {

	@Setter(onMethod_ = @Autowired)
	private PictureRoomService service;

	@GetMapping("/register")
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	public void register() {

	}

	@PostMapping("/register")
//	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@ResponseBody
	public ResponseEntity<String> register(PictureRoomVO vo, MultipartFile file) throws Exception {
		vo.setFileName(file.getOriginalFilename());
		service.register(vo);

		if (file != null) {
			log.info(file);
			service.transfer(file, vo.getId() + "_" + file.getOriginalFilename());
		}
		log.info(vo);
		return new ResponseEntity<String>("" + vo.getId(), HttpStatus.OK);
	}

	@GetMapping("/list")
	public void list() {

	}

	@GetMapping("/more")
	@ResponseBody
	public List<PictureRoomVO> loadMore(Long from, Long length) {
		return service.list(from, length);
	}

	@GetMapping("/id/{id}")
	public String get(@PathVariable Long id, Model model) {
		log.info(id);

		model.addAttribute("vo", service.get(id));

		return "/picroom/get";
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/delete")
	public ResponseEntity<String> delete(PictureRoomVO vo, MultipartFile file) {
		if (service.delete(vo.getId())) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public ResponseEntity<String> modify(PictureRoomVO vo, MultipartFile file) throws Exception {
		log.info(file);
		if (file.getSize() > 0) {
			vo.setFileName(vo.getId() + "_" + file.getOriginalFilename());
			service.transfer(file, vo.getFileName());
		}
		if (service.modify(vo)) {
			return new ResponseEntity<String>(HttpStatus.OK);
		} else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
