package com.mis.service;

import java.util.List;

import com.mis.domain.FbFileVO;
import com.mis.domain.FreeBoardVO;
import com.mis.domain.SearchCriteria;

public interface FreeBoardService {

	public void register(FreeBoardVO vo) throws Exception;

	public FreeBoardVO read(int fbNo) throws Exception;

	public void modify(FreeBoardVO vo) throws Exception;

	public void remove(int fbNo) throws Exception;

	public List<FreeBoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	// 7. 관리자 :: 파일 목록
	public List<FbFileVO> fileList(int fbNo) throws Exception;

}
