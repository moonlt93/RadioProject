package com.radio.domain;

import java.util.Date;

import lombok.Data;

@Data
public class VideoVO {
	private Long video_bno;
	private String video_title;
	private String video_date;
	private String video_thumbnail;
	private String video_vod;
	private int video_view_cnt;
	private Date video_regdate;
	private Date video_updatedate;
}