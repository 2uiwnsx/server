package com.test.toy.board.model;

import lombok.Data;

@Data
public class BoardDTO {
	
	private String seq;
	private String id;
	private String subject;
	private String content;
	private String regdate;
	private int readCount;
	
	private String name;
	private int isNew;
	private int cmtCount;
	
}
