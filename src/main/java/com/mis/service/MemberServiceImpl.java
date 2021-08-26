package com.mis.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;
import com.mis.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	private MemberDAO dao;

	//로그인
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		return dao.login(dto);
	}
	
	//회원가입
	@Override
	public void register(MemberVO vo) throws Exception {
		dao.create(vo);
		
	}

	 // ID 중복등록 체크
	   @Override
	   public int checkId(String id) throws Exception {
	      return dao.checkId(id);
	   }
}
