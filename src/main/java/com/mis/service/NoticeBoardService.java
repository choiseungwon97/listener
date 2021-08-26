package com.mis.service;

import java.util.List;

import com.mis.domain.NbFileVO;
import com.mis.domain.NoticeBoardVO;
import com.mis.domain.SearchCriteria;

public interface NoticeBoardService {

	public void register(NoticeBoardVO vo) throws Exception;

	public NoticeBoardVO read(int nbNo) throws Exception;

	public void modify(NoticeBoardVO vo) throws Exception;

	public void remove(int nbNo) throws Exception;

	// 페이징, 검색 기능을 제공하는 list 가져오는 기능
	public List<NoticeBoardVO> listSearch(SearchCriteria cri) throws Exception;

	// 페이징, 검색 기능 게시글 수 가져오는 기능
	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 7. 관리자 :: 파일 목록
	public List<NbFileVO> fileList(int nbNo) throws Exception;

}
