package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.FbFileVO;
import com.mis.domain.FreeBoardVO;
import com.mis.domain.SearchCriteria;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	
	@Inject
	private SqlSession session;
	
	private static final String namespace="com.mis.mapper.FreeBoardMapper";

	@Override
	public int create(FreeBoardVO vo) throws Exception {
		session.insert(namespace+ ".create", vo);
		return vo.getFbNo();
		
	}

	@Override
	public FreeBoardVO read(int fbNo) throws Exception {
		
		return session.selectOne(namespace+ ".read", fbNo);
	}

	@Override
	public void update(FreeBoardVO vo) throws Exception {
		session.update(namespace+ ".update", vo);
		
	}

	@Override
	public void delete(int fbNo) throws Exception {
		session.delete(namespace+ ".delete", fbNo);
		
	}

	@Override
	public List<FreeBoardVO> listSearch(SearchCriteria cri) throws Exception {
		
		return session.selectList(namespace+ ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		
		return session.selectOne(namespace+ ".listSearchCount", cri);
	}

	@Override
	public void updateViewCount(int fbNo) throws Exception {
		session.update(namespace+ ".updateViewCount", fbNo);
		
	}

	@Override
	public void insertFile(FbFileVO fVo) throws Exception {
		session.insert(namespace + ".insertFile", fVo);
		
	}

	@Override
	public void deleteFile(int fbFileNo) throws Exception {
		session.delete(namespace + ".deleteFile", fbFileNo);
		
	}

	@Override
	public List<FbFileVO> fileList(int fbFileNo) throws Exception {
		return session.selectList(namespace + ".fileList", fbFileNo);
	}

	
}
