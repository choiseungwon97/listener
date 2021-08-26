package com.mis.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	private int displayPageNum = 10;

	private Criteria cri;

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;

		// 전체 게시글 수가 설정되면 페이징을 계산한다
		calcData();
	}

	// 페이징을 계산하는 method
	private void calcData() {

		// 페이지 버튼의 시작과 끝 계산
		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);
		startPage = (endPage - displayPageNum) + 1;

		// 페이지 버튼이 10개 이하 일 경우 처리
		int tempEndPage = (int) (Math.ceil(totalCount / (double) cri.getPerPageNum()));

		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		// prev, next 버튼 계산
		prev = startPage == 1 ? false : true;

		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;

	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}

	// 페이징 버튼에서 사용할 페이지 이동 링크(QueryString) 만들기 ->jsp에서 사용 --검색기능이 필요없을때 페이징
	public String makeQuery(int page) {

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum()).build();
		return uriComponents.toUriString();
	}
	

	// 페이징 버튼에서 사용할 페이지 이동 링크 (검색기능(searchType, keyword)포함) 만들기 ->jsp에서 사용 --검색기능이 필요할때 페이징
	public String makeSearch(int page){

		UriComponents uriComponents = UriComponentsBuilder.newInstance().queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
	           	.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
	           	.queryParam("keyword",  ((SearchCriteria)cri).getKeyword()).build();
		
		return uriComponents.toUriString();
	}
}