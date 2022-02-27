package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PictureRoomVO {
	private Long id;
	private String title;
	private String content;
	private String memberId;
	private String fileName;
	private int hit;
	private Date regdate;
	
}
