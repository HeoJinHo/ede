package com.ede.board;

import java.sql.Date;

public class BoardDTO {

	private int not_num;
	private String not_title;
	private String writer;
	private String contents;
	private int hit;
	private Date reg_date;
	
	public int getNot_num() {
		return not_num;
	}
	public void setNot_num(int not_num) {
		this.not_num = not_num;
	}
	public String getNot_title() {
		return not_title;
	}
	public void setNot_title(String not_title) {
		this.not_title = not_title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
