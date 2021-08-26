package com.mis.persistence;

import com.mis.domain.MemberVO;

public interface MyPageDAO {

	// 회원정보 상세보기
	public MemberVO myInfo(String id) throws Exception;

	// 회원정보 수정
	public void myInfoUpdate(MemberVO vo) throws Exception;

}