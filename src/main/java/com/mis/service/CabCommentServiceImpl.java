package com.mis.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.mis.domain.CabCommentVO;
import com.mis.persistence.CabCommentDAO;

@Service
public class CabCommentServiceImpl implements CabCommentService {

	@Inject
	private CabCommentDAO dao;

	// 1. 활동게시판 - 댓글 생성
	@Override
	public void add(CabCommentVO vo) throws Exception {
		dao.create(vo);

	}

	// 2. 활동게시판 - 댓글 삭제
	@Override
	public void remove(int cabCommNo) throws Exception {
		dao.delete(cabCommNo);

	}

	// 3. 활동게시판 - 댓글 전체 삭제
	@Override
	public void removeAll(int cabNo) throws Exception {
		dao.deleteAll(cabNo);

	}

	// 4. 활동게시판 - 댓글 전체 보기
	@Override
	public List<CabCommentVO> list(int cabNo) throws Exception {
		return dao.list(cabNo);
	}

}
