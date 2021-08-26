package com.mis.domain;

public class SearchCriteria extends Criteria{ //상속 받으면 Criteria의 기능을 사용할 수 있다. (= Criteria의 확장된 버전)

	
	private String SearchType; //제목, 내용, 제목 or 내용
	private String keyword; //검색어
	public String getSearchType() {
		return SearchType;
	}
	public void setSearchType(String searchType) {
		SearchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	@Override
	public String toString() {
		return "SearchCriteria [SearchType=" + SearchType + ", keyword=" + keyword + "]";
	}
	
	
}
