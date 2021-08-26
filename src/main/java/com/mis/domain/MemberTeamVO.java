package com.mis.domain;

public class MemberTeamVO {
	
	private int mtNo;
	private String id;
	private int teamNO;
	private String teamName;
	public int getMtNo() {
		return mtNo;
	}
	public void setMtNo(int mtNo) {
		this.mtNo = mtNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getTeamNO() {
		return teamNO;
	}
	public void setTeamNO(int teamNO) {
		this.teamNO = teamNO;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	@Override
	public String toString() {
		return "MemberTeamVO [mtNo=" + mtNo + ", id=" + id + ", teamNO=" + teamNO + ", teamName=" + teamName + "]";
	}
	
	
	
	
	
}
