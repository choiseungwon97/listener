package com.mis.domain;

import java.util.Date;

public class CabCommentVO {

	private int cabCommNo; // 댓글 번호
	private int cabNo; // 활동게시글 번호
	private String id; // 사용자 정보
	private String nickname;
	private String content; // 댓글내용
	private Date regDate; // 댓글날짜
	public int getCabCommNo() {
		return cabCommNo;
	}
	public void setCabCommNo(int cabCommNo) {
		this.cabCommNo = cabCommNo;
	}
	public int getCabNo() {
		return cabNo;
	}
	public void setCabNo(int cabNo) {
		this.cabNo = cabNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
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
	@Override
	public String toString() {
		return "CabCommentVO [cabCommNo=" + cabCommNo + ", cabNo=" + cabNo + ", id=" + id + ", nickname=" + nickname
				+ ", content=" + content + ", regDate=" + regDate + "]";
	}


}
