package com.radio.controller;

import java.util.List;	

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.radio.domain.Board_Criteria;
import com.radio.domain.Board_ReplyVO;
import com.radio.service.Board_ReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/reply/*")
@Log4j
@AllArgsConstructor
public class Board_ReplyController {
	
	private Board_ReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/new", consumes="application/json",
					produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> register(@RequestBody Board_ReplyVO board_ReplyVO){
		log.info("******register메소드 실행******");
		
		
		
		int result = service.register(board_ReplyVO);
		
		if(result == 1) {
			return new ResponseEntity<String>("Create Success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	@GetMapping(value="/list/{board_bno}/{page}", 
				produces= {
						MediaType.APPLICATION_JSON_VALUE
				})
	public ResponseEntity<List<Board_ReplyVO>> getList(
			@PathVariable("board_bno") Long board_bno,
			@PathVariable("page") int page){
		log.info("************getList메소드 실행!!**********************");
		Board_Criteria cri = new Board_Criteria(page, 10);
		return new ResponseEntity<List<Board_ReplyVO>>(service.getList(cri, board_bno), HttpStatus.OK);
		
	}
	
	
	
	@GetMapping(value="/{reply_bno}",
				produces= {
						MediaType.APPLICATION_JSON_UTF8_VALUE
				})
	public ResponseEntity<Board_ReplyVO> read(@PathVariable("reply_bno") Long reply_bno){
		log.info("********read메소드 실행**************************");
		return new ResponseEntity<Board_ReplyVO>(service.read(reply_bno), HttpStatus.OK);
	}
	
	
	
	@PreAuthorize("principal.username == #vo.reply_id")
	@DeleteMapping(value="/{reply_no}",
					produces= {
							MediaType.TEXT_PLAIN_VALUE
					})
	public ResponseEntity<String> delete(@RequestBody Board_ReplyVO vo,
										 @PathVariable("reply_no") Long reply_bno){
		log.info("****************delete메소드 실행*************");
		
		if(service.delete(reply_bno)==1) {
			return new ResponseEntity<String>(reply_bno + "delete success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	
	

	@PreAuthorize("principal.username == #vo.reply_id")
	@RequestMapping(method = RequestMethod.PUT,
	value="/{reply_bno}",
	consumes=MediaType.APPLICATION_JSON_UTF8_VALUE,
	produces=MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> modify(@RequestBody Board_ReplyVO vo, 
										 @PathVariable("reply_bno") Long reply_bno){
		log.info("***********modify메소드 실행********************");
		vo.setReply_bno(reply_bno);
		
		if(service.modify(vo) == 1) {
			return new ResponseEntity<String>("modify Success", HttpStatus.OK);
		}else {
			return new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
