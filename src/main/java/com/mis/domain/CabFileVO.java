package com.mis.domain;

public class CabFileVO {

	private int cabFileNo;
	private String filename;
	private int cabNo;
	private String fileLocation;

	public int getCabFileNo() {
		return cabFileNo;
	}

	public void setCabFileNo(int cabFileNo) {
		this.cabFileNo = cabFileNo;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getCabNo() {
		return cabNo;
	}

	public void setCabNo(int cabNo) {
		this.cabNo = cabNo;
	}

	public String getFileLocation() {
		return fileLocation;
	}

	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}

	@Override
	public String toString() {
		return "CabFileVO [cabFileNo=" + cabFileNo + ", filename=" + filename + ", cabNo=" + cabNo + ", fileLocation="
				+ fileLocation + "]";
	}

	

}
