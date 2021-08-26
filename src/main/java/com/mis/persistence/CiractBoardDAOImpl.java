package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.CabFileVO;
import com.mis.domain.CiractBoardVO;
import com.mis.domain.SearchCriteria;

@Repository
public class CiractBoardDAOImpl implements CiractBoardDAO{
	
	@Inject
	private SqlSession session;
	
	private static final String namespace = "com.mis.mapper.CabMapper";

	@Override
	public int create(CiractBoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		return vo.getCabNo();
		
	}

	@Override
	public CiractBoardVO read(int cabNo) throws Exception {
		return session.selectOne(namespace + ".read", cabNo);
	}

	@Override
	public void update(CiractBoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
		
	}

	@Override
	public void delete(int cabNo) throws Exception {
		session.delete(namespace + ".delete", cabNo);
		
	}

	@Override
	public List<CiractBoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateViewCount(int cabNo) throws Exception {
		session.update(namespace + ".updateViewCount", cabNo);
		
	}

	@Override
	public void insertFile(CabFileVO fVo) throws Exception {
		session.insert(namespace + ".insertFile", fVo);
		
	}

	@Override
	public void deleteFile(int cabFileNo) throws Exception {
		session.delete(namespace + ".deleteFile", cabFileNo);
		
	}

	@Override
	public List<CabFileVO> fileList(int cabFileNo) throws Exception {
		return session.selectList(namespace + ".fileList", cabFileNo);
	}

	


	}


