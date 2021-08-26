package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.MemberVO;
import com.mis.domain.SearchCriteria;

@Repository
public class ManagementDAOImpl implements ManagementDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.ManagementMapper";

	@Override
	public MemberVO read(String id) throws Exception {
		return session.selectOne(namespace + ".read", id);
	}

	@Override
	public void update(MemberVO vo) throws Exception {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public List<MemberVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

}
