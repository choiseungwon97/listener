package com.mis.domain;

public class TeamVO {

	private int teamNo;
	private String teamName;
	private String captain;
	private String captainPh;
	private String genre;
	private String vocal;
	private String vocal2;
	private String guitar;
	private String guitar2;
	private String drum;
	private String bass;
	private String synth;
	private String extra;
	private int mentor;
	private String song;
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getCaptain() {
		return captain;
	}
	public void setCaptain(String captain) {
		this.captain = captain;
	}
	public String getCaptainPh() {
		return captainPh;
	}
	public void setCaptainPh(String captainPh) {
		this.captainPh = captainPh;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getVocal() {
		return vocal;
	}
	public void setVocal(String vocal) {
		this.vocal = vocal;
	}
	public String getVocal2() {
		return vocal2;
	}
	public void setVocal2(String vocal2) {
		this.vocal2 = vocal2;
	}
	public String getGuitar() {
		return guitar;
	}
	public void setGuitar(String guitar) {
		this.guitar = guitar;
	}
	public String getGuitar2() {
		return guitar2;
	}
	public void setGuitar2(String guitar2) {
		this.guitar2 = guitar2;
	}
	public String getDrum() {
		return drum;
	}
	public void setDrum(String drum) {
		this.drum = drum;
	}
	public String getBass() {
		return bass;
	}
	public void setBass(String bass) {
		this.bass = bass;
	}
	public String getSynth() {
		return synth;
	}
	public void setSynth(String synth) {
		this.synth = synth;
	}
	public String getExtra() {
		return extra;
	}
	public void setExtra(String extra) {
		this.extra = extra;
	}
	public int getMentor() {
		return mentor;
	}
	public void setMentor(int mentor) {
		this.mentor = mentor;
	}
	public String getSong() {
		return song;
	}
	public void setSong(String song) {
		this.song = song;
	}
	@Override
	public String toString() {
		return "TeamVO [teamNo=" + teamNo + ", teamName=" + teamName + ", captain=" + captain + ", captainPh="
				+ captainPh + ", genre=" + genre + ", vocal=" + vocal + ", vocal2=" + vocal2 + ", guitar=" + guitar
				+ ", guitar2=" + guitar2 + ", drum=" + drum + ", bass=" + bass + ", synth=" + synth + ", extra=" + extra
				+ ", mentor=" + mentor + ", song=" + song + "]";
	}
	
	
	
	
}
