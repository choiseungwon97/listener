package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.FbCommentVO;
import com.mis.persistence.FbCommentDAO;

@Service
public class FbCommentServiceImpl implements FbCommentService {

	@Inject
	private FbCommentDAO dao;

	// 자유게시판 - 댓글 생성
	@Override
	public void add(FbCommentVO vo) throws Exception {
		dao.create(vo);
		
	}

	// 자유게시판 - 댓글 삭제
	@Override
	public void remove(int fbCommNo) throws Exception {
		dao.delete(fbCommNo);
		
	}

	// 자유게시판 - 댓글 전체 삭제
	@Override
	public void removeAll(int fbNo) throws Exception {
		dao.deleteAll(fbNo);
		
	}

	// 자유게시판 - 댓글 전체 보기
	@Override
	public List<FbCommentVO> list(int fbNo) throws Exception {
		return dao.list(fbNo);
	}

}
