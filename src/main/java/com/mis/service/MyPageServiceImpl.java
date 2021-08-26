package com.mis.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.MemberVO;
import com.mis.persistence.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MyPageDAO dao;

	@Override
	public MemberVO myInfo(String id) throws Exception {
		return dao.myInfo(id);
	}

	@Override
	public void myInfoModify(MemberVO vo) throws Exception {
		dao.myInfoUpdate(vo);

	}

}
