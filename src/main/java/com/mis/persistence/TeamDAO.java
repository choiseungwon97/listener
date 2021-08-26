package com.mis.persistence;

import java.util.List;

import com.mis.domain.SearchCriteria;
import com.mis.domain.TeamVO;



public interface TeamDAO {
	
	public void create(TeamVO vo) throws Exception;
	
	public TeamVO read(int teamNo) throws Exception;
	
	public void update(TeamVO vo) throws Exception;
	
	public void delete(int teamNo) throws Exception;
	
	 
	   public List<TeamVO> listAll() throws Exception;
	
	public List<TeamVO> listSearch(SearchCriteria cri) throws Exception; //페이징과 검색 기능이 포함 된 list
	
	public int listSearchCount(SearchCriteria cri) throws Exception; // 페이징과 검색 된 게시글 수 
	

}
