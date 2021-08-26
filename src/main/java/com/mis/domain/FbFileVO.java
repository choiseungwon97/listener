package com.mis.domain;

public class FbFileVO {
	
	private int fbFileNo;
	private String filename;
	private int fbNo;
	private String fileLocation;
	
	public int getFbFileNo() {
		return fbFileNo;
	}
	public void setFbFileNo(int fbFileNo) {
		this.fbFileNo = fbFileNo;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getFbNo() {
		return fbNo;
	}
	public void setFbNo(int fbNo) {
		this.fbNo = fbNo;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	@Override
	public String toString() {
		return "FbFileVO [fbFileNo=" + fbFileNo + ", filename=" + filename + ", fbNo=" + fbNo + ", fileLocation="
				+ fileLocation + "]";
	}
	
	
	
	

}
