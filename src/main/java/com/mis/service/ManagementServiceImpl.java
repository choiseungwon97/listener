package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.MemberVO;
import com.mis.domain.SearchCriteria;
import com.mis.persistence.ManagementDAO;

@Service
public class ManagementServiceImpl implements ManagementService{
	
	@Inject
	ManagementDAO dao;

	@Override
	public MemberVO read(String id) throws Exception {
		return dao.read(id);
	}

	@Override
	public void modify(MemberVO vo) throws Exception {
		dao.update(vo); //질문해야함 이거
		
	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return dao.listSearchCount(cri);
	}
	
	

}
