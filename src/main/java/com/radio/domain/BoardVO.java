package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class BoardVO {
	private Long board_bno;
	private String board_title;
	private String board_content;
	private String board_id;
	private Date board_regdate;
	private Date board_updateDate;
	private int board_read_cnt;
	private int board_pin;
	private int board_day;
	
}
