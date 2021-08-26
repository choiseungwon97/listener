package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.SearchCriteria;
import com.mis.domain.TeamVO;
import com.mis.persistence.TeamDAO;

@Service
public class TeamServiceImpl implements TeamService{
	
	@Inject
	TeamDAO dao;

	@Override
	public void register(TeamVO vo) throws Exception {
		dao.create(vo);
		
	}

	@Override
	public TeamVO read(int teamNo) throws Exception {
		
		
		return dao.read(teamNo);
	}

	@Override
	public void modify(TeamVO vo) throws Exception {
		dao.update(vo);
		
	}

	@Override
	public void remove(int teamNo) throws Exception {
		dao.delete(teamNo);
		
	}
	
	@Override
	   public List<TeamVO> listAll() throws Exception {
	      return dao.listAll();
	   }

	@Override
	public List<TeamVO> listSearch(SearchCriteria cri) throws Exception {
		
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return dao.listSearchCount(cri);
	}

}
