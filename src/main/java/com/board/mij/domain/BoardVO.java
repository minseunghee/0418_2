package com.board.mij.domain;

import org.joda.time.DateTime;

public class BoardVO {

	private int board_Id; // 글 ID
	private String BOARD_TITLE; // 글 제목
	private String boardContent; // 글 내용
	private String DT_RGST; // 글 작성 날짜
	private String user_id; //글 작성자
	
	public String getuser_id() {
		return user_id;
	}
	public void setuser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getboard_id() {return board_Id;}
	public void setboard_Id(int Board_Id) {this.board_Id = Board_Id;}

	public String getBOARD_TITLE() {
		return BOARD_TITLE;
	}
	public void setBOARD_TITLE(String BOARD_TITLE) {
		this.BOARD_TITLE = BOARD_TITLE;
	}

	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public String getDT_RGST() {
		return DT_RGST;
	}
	public void setDT_RGST(String DT_RGST) {
		this.DT_RGST = DT_RGST;
	}
	
}
