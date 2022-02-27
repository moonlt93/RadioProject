package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Board_ReplyVO {
	
	private Long reply_bno;
	private Long board_bno;
	
	private String reply_content;
	private String reply_id;
	private Date reply_regdate;
	private Date reply_updatedate;
	

}
