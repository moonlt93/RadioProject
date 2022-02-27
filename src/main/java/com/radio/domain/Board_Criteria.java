package com.radio.domain;

import lombok.Data;

@Data
public class Board_Criteria {
	
	private int pageNum;
	private int amount;
	
	private String type;
	private String keyword;
	
	private int day;
	
	
	public Board_Criteria() {
		this(1, 10);
	}
	
	public Board_Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}
	
	public String[] getTypeArr() {
		return this.type == null ? new String[] {} : type.split("");
	}

}
