package com.board.mij.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.joda.time.DateTime;
import org.joda.time.LocalDateTime;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class BoardVO {

	private int BOARD_ID; // 글 ID
	private String BOARD_TITLE; // 글 제목
	private String BOARD_CONTENT; // 글 내용
	//@JsonFormat(shape= JsonFormat.Shape.STRING, pattern="yyyy-MM-dd HH:mm:ss", timezone="Asia/Seoul")
	private Date DT_RGST;
	//private java.util.Date DT_RGST; // 글 작성 날짜
	private String USER_ID; //글 작성자
	
	public String getUSER_ID() {
		return USER_ID;
	}
	public void setUSER_ID(String USER_ID) {
		this.USER_ID = USER_ID;
	}

	public int getBOARD_ID() {return BOARD_ID;}
	public void setBOARD_ID(int BOARD_ID) {this.BOARD_ID = BOARD_ID;}

	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String BOARD_TITLE) {
		this.BOARD_TITLE = BOARD_TITLE;
	}

	public String getBOARD_CONTENT() {
		return BOARD_CONTENT;
	}
	public void setBOARD_CONTENT(String BOARD_CONTENT) {
		this.BOARD_CONTENT = BOARD_CONTENT;
	}

	public Date getDT_RGST() {
		return DT_RGST;
	}
	public void setDT_RGST(Date DT_RGST) {
		this.DT_RGST = DT_RGST;
	}
	
}
