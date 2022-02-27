package com.radio.domain;

import lombok.Data;

@Data
public class Video_PageDTO {
	private int startPage;
	private int endPage;
	private boolean prev, next;
	
	private int total;
	private Video_Criteria video_Criteria;
	
	public Video_PageDTO(Video_Criteria video_Criteria, int total) {
		this.video_Criteria = video_Criteria;
		this.total = total;
		
		//cri에 담긴 pageNum으로 시작과 끝 페이지 구하기
		this.endPage = (int) (Math.ceil(video_Criteria.getPageNum() / 10.0) * 10);
		this.startPage = this.endPage - 9;
		 
		
		//total 게시물 개수를 이용해 맨 마지막 페이지 구하기
		int finalPage = (int) (Math.ceil((total*1.0) / video_Criteria.getAmount()));
		if(finalPage < endPage) {
			this.endPage = finalPage;
		}
		
		
		//prev 와 next가 화면에 노출될 조건
		this.prev = this.startPage > 5;
		this.next = this.endPage < finalPage;
		
		
	}

}