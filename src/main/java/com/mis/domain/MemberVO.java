package com.mis.domain;

public class MemberVO {

	private String id;
	private String pw;
	private String name;
	private String nickname;
	private int stid;
	private String major;
	private int birth;
	private String ph;
	private String address;
	private String memberSession;
	private String why;
	private String likeGenre;
	private String artist;
	private String grade;
	private String teamName;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getStid() {
		return stid;
	}
	public void setStid(int stid) {
		this.stid = stid;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getPh() {
		return ph;
	}
	public void setPh(String ph) {
		this.ph = ph;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getMemberSession() {
		return memberSession;
	}
	public void setMemberSession(String memberSession) {
		this.memberSession = memberSession;
	}
	public String getWhy() {
		return why;
	}
	public void setWhy(String why) {
		this.why = why;
	}
	public String getLikeGenre() {
		return likeGenre;
	}
	public void setLikeGenre(String likeGenre) {
		this.likeGenre = likeGenre;
	}
	public String getArtist() {
		return artist;
	}
	public void setArtist(String artist) {
		this.artist = artist;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", nickname=" + nickname + ", stid=" + stid
				+ ", major=" + major + ", birth=" + birth + ", ph=" + ph + ", address=" + address + ", memberSession="
				+ memberSession + ", why=" + why + ", likeGenre=" + likeGenre + ", artist=" + artist + ", grade="
				+ grade + ", teamName=" + teamName + "]";
	}

	
	
	
	
}
