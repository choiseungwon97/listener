package com.mis.service;

import java.util.List;

import com.mis.domain.CabFileVO;
import com.mis.domain.CiractBoardVO;
import com.mis.domain.SearchCriteria;

public interface CiractBoardService {
	
	public void register(CiractBoardVO vo) throws Exception;
	
	public CiractBoardVO read(int cabNo) throws Exception;
	
	public void modify(CiractBoardVO vo) throws Exception;
	
	public void remove(int cabNo) throws Exception;
	
	public List<CiractBoardVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	// 7. 관리자 :: 파일 목록
	public List<CabFileVO> fileList(int cabNo) throws Exception;


}
