package com.test.toy.board.model;

import lombok.Data;

@Data
public class CommentDTO {
	
	private String seq;
	private String boardSeq;
	private String id;
	private String content;
	private String regdate;

	private String name;

}
