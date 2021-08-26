package com.mis.service;

import java.util.List;

import com.mis.domain.SearchCriteria;
import com.mis.domain.TeamVO;



public interface TeamService {
	
	public void register(TeamVO vo) throws Exception;
	
	public TeamVO read(int teamNo) throws Exception;
	
	public void modify(TeamVO vo) throws Exception;
	
	public void remove(int teamNo) throws Exception;
	
	   public List<TeamVO> listAll() throws Exception;

	
	public List<TeamVO> listSearch(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;

}
