package com.mis.domain;

import java.util.Date;

public class FbCommentVO {

	
	private int fbCommNo; // 댓글 번호
	private String content; // 댓글 내용
	private Date regDate; //댓글 날짜
	private String id; //사용자 정보
	private int fbNo; //자유게시글 번호
	private String nickname;
	public int getFbCommNo() {
		return fbCommNo;
	}
	public void setFbCommNo(int fbCommNo) {
		this.fbCommNo = fbCommNo;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getFbNo() {
		return fbNo;
	}
	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	@Override
	public String toString() {
		return "FbCommentVO [fbCommNo=" + fbCommNo + ", content=" + content + ", regDate=" + regDate + ", id=" + id
				+ ", fbNo=" + fbNo + ", nickname=" + nickname + "]";
	}
	
	
}
