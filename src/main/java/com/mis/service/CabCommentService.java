package com.mis.service;

import java.util.List;

import com.mis.domain.CabCommentVO;

public interface CabCommentService {

	// 1. 관리자, 학생 :: 활동게시판 - 댓글 생성
	public void add(CabCommentVO vo) throws Exception;

	// 2. 관리자, 학생 :: QnA - 댓글 삭제
	public void remove(int cabCommNo) throws Exception;

	// 3. 관리자, 학생 :: QnA - 댓글 전체 삭제
	public void removeAll(int cabNo) throws Exception;

	// 4. 관리자, 학생 :: QnA - 댓글 전체 보기
	List<CabCommentVO> list(int cabNo) throws Exception;

}
