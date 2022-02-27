package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CenterVO {
	private Long center_bno;
	private String member_id;
	private String center_name;
	private String center_email;
	private String center_type;
	private String center_title;
	private String center_content;
	private Date center_regdate;
	private String center_reply;
	private Date center_reply_regdate;
}
 