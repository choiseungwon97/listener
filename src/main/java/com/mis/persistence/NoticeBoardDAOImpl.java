package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.NbFileVO;
import com.mis.domain.NoticeBoardVO;
import com.mis.domain.SearchCriteria;

@Repository
public class NoticeBoardDAOImpl implements NoticeBoardDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.mis.mapper.NoticeBoardMapper";

	// 공지사항 게시글 작성
	@Override
	public int create(NoticeBoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		return vo.getNbNo();

	}

	// 공지사항 게시글 상세보기
	@Override
	public NoticeBoardVO read(int nbNo) throws Exception {
		return session.selectOne(namespace + ".read", nbNo);
	}

	// 공지사항 게시글 수정
	@Override
	public void update(NoticeBoardVO vo) throws Exception {
		session.update(namespace + ".update", vo);

	}

	// 공지사항 게시글 삭제
	@Override
	public void delete(int nbNo) throws Exception {
		session.delete(namespace + ".delete", nbNo);

	}

	@Override
	public List<NoticeBoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace + ".listSearch", cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace + ".listSearchCount", cri);
	}

	@Override
	public void updateViewCount(int nbNo) throws Exception {
		session.update(namespace + ".updateViewCount", nbNo);
	}

	@Override
	public void insertFile(NbFileVO fVo) throws Exception {
		session.insert(namespace + ".insertFile", fVo);
		
	}

	@Override
	public void deleteFile(int nbFileNo) throws Exception {
		session.delete(namespace + ".deleteFile", nbFileNo);
		
	}

	@Override
	public List<NbFileVO> fileList(int nbFileNo) throws Exception {
		return session.selectList(namespace + ".fileList", nbFileNo);
	}

}
