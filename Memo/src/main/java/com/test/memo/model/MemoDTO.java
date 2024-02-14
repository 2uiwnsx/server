package com.test.memo.model;

public class MemoDTO {
	
	private String seq;
	private String name;
	private String pswd;
	private String memo;
	private String regdate;
	
	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPswd() {
		return pswd;
	}
	
	public void setPswd(String pswd) {
		this.pswd = pswd;
	}
	
	public String getMemo() {
		return memo;
	}
	
	public void setMemo(String memo) {
		this.memo = memo;
	}
	
	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
