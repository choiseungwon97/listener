package com.mis.persistence;

import java.util.List;

import com.mis.domain.MemberVO;
import com.mis.domain.SearchCriteria;

public interface ManagementDAO {

	// 회원 상세보기
	public MemberVO read(String id) throws Exception;

	// 게시글 수정
	public void update(MemberVO vo) throws Exception;

	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

}
