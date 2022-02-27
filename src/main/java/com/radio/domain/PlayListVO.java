package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PlayListVO {
	private Long bno;
	private String title;
	private Date regdate; 
	private String content;
	private String writer;
	private Date updateDate;
	private Long hit;
	private String Ptitle;
	
	
}
