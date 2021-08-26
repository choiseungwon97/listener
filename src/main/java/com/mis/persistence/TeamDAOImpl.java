package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.SearchCriteria;
import com.mis.domain.TeamVO;



@Repository
public class TeamDAOImpl implements TeamDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.mis.mapper.TeamMapper";

	@Override
	public void create(TeamVO vo) throws Exception {
		session.insert(namespace+ ".create", vo);
		
	}

	@Override
	public TeamVO read(int teamNo) throws Exception {
		
		return session.selectOne(namespace+".read", teamNo);
	}

	@Override
	public void update(TeamVO vo) throws Exception {
		session.update(namespace+ ".update", vo);
		
	}

	@Override
	public void delete(int teamNo) throws Exception {
		session.delete(namespace+ ".delete", teamNo);
		
	}
	
	 @Override
	   public List<TeamVO> listAll() throws Exception {
	      return session.selectList(namespace + ".listAll");
	   }

	@Override
	public List<TeamVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+ ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+ ".listSearchCount", cri);
	}

	

	

}
