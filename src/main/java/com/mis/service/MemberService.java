package com.mis.service;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;

public interface MemberService {
	// LoginDTO로 로그인 할 테니 UserVO(리턴타입)에 대한 정보를 줘라 라는 뜻
	public MemberVO login(LoginDTO dto) throws Exception;
	
	//회원가입
	public void register(MemberVO vo) throws Exception;
	
	//ID 중복등록 체크
	   public int checkId(String id) throws Exception;
	
}


