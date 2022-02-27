package com.radio.domain;

import lombok.Data;

@Data
public class Video_Criteria {
	private int pageNum;
	private int amount;
	
	public Video_Criteria() {
		this(1,2); 
	}
	
	public Video_Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}