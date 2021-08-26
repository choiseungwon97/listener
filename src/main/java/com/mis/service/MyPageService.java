package com.mis.service;

import com.mis.domain.MemberVO;

public interface MyPageService {

	public MemberVO myInfo(String id) throws Exception;

	public void myInfoModify(MemberVO vo) throws Exception;

}
