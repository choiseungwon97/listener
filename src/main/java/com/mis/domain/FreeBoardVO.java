package com.mis.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class FreeBoardVO {

	private int fbNo;
	private String title;
	private String content;
	private Date regdate;
	private int viewcnt;
	private String youtubeLink;
	private String id;
	private String nickname;
	private String[] files;
	private ArrayList<FbFileVO> fileList;

	public int getFbNo() {
		return fbNo;
	}

	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
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

	public int getViewcnt() {
		return viewcnt;
	}

	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}

	public String getYoutubeLink() {
		return youtubeLink;
	}

	public void setYoutubeLink(String youtubeLink) {
		this.youtubeLink = youtubeLink;
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

	public String[] getFiles() {
		return files;
	}

	public void setFiles(String[] files) {
		this.files = files;
	}

	public ArrayList<FbFileVO> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<FbFileVO> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [fbNo=" + fbNo + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", youtubeLink=" + youtubeLink + ", id=" + id + ", nickname=" + nickname
				+ ", files=" + Arrays.toString(files) + ", fileList=" + fileList + "]";
	}

	
}
