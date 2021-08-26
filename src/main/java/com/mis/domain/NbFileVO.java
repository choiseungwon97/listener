package com.mis.domain;

public class NbFileVO {
	
	private int nbFileNO;
	private String filename;
	private int nbNo;
	private String fileLocation;
	
	public int getNbFileNO() {
		return nbFileNO;
	}
	public void setNbFileNO(int nbFileNO) {
		this.nbFileNO = nbFileNO;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public int getNbNo() {
		return nbNo;
	}
	public void setNbNo(int nbNo) {
		this.nbNo = nbNo;
	}
	public String getFileLocation() {
		return fileLocation;
	}
	public void setFileLocation(String fileLocation) {
		this.fileLocation = fileLocation;
	}
	@Override
	public String toString() {
		return "NbFileVO [nbFileNO=" + nbFileNO + ", filename=" + filename + ", nbNo=" + nbNo + ", fileLocation="
				+ fileLocation + "]";
	}
	
	
	

}
