package com.mis.service;

import java.util.List;

import com.mis.domain.MemberVO;
import com.mis.domain.SearchCriteria;

public interface ManagementService {

	public MemberVO read(String id) throws Exception;

	public void modify(MemberVO vo) throws Exception;

	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
