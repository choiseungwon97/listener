package com.mis.domain;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

public class NoticeBoardVO {

	private int nbNo;
	private String title;
	private String content;
	private Date regdate;
	private int viewcnt;
	private String id;
	private int mustRead;
	private String nickname;
	private String[] files;
	private ArrayList<NbFileVO> fileList;

	public int getNbNo() {
		return nbNo;
	}

	public void setNbNo(int nbNo) {
		this.nbNo = nbNo;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getMustRead() {
		return mustRead;
	}

	public void setMustRead(int mustRead) {
		this.mustRead = mustRead;
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

	public ArrayList<NbFileVO> getFileList() {
		return fileList;
	}

	public void setFileList(ArrayList<NbFileVO> fileList) {
		this.fileList = fileList;
	}

	@Override
	public String toString() {
		return "NoticeBoardVO [nbNo=" + nbNo + ", title=" + title + ", content=" + content + ", regdate=" + regdate
				+ ", viewcnt=" + viewcnt + ", id=" + id + ", mustRead=" + mustRead + ", nickname=" + nickname
				+ ", files=" + Arrays.toString(files) + ", fileList=" + fileList + "]";
	}

	

}
