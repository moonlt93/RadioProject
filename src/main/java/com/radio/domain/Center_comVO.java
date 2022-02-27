package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Center_comVO {
	private Long com_cno;
	private Long com_bno;
	private String com_id;
	private String com_content;
	private Date com_regadate;
}
