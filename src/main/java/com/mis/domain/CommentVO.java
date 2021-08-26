package com.mis.domain;

import java.util.Date;

public class CommentVO {

	private int commNo;
	private String content;
	private Date regdate;
	private String id;
	private int fbNo;
	private int cabNo;

	public int getCommNo() {
		return commNo;
	}

	public void setCommNo(int commNo) {
		this.commNo = commNo;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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

	public int getCabNo() {
		return cabNo;
	}

	public void setCabNo(int cabNo) {
		this.cabNo = cabNo;
	}

	@Override
	public String toString() {
		return "CommentVO [commNo=" + commNo + ", content=" + content + ", regdate=" + regdate + ", id=" + id
				+ ", fbNo=" + fbNo + ", cabNo=" + cabNo + "]";
	}

}
