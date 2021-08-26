package com.mis.persistence;

import java.util.List;

import com.mis.domain.CabCommentVO;

public interface CabCommentDAO {

	// 활동게시판 댓글 생성
	public void create(CabCommentVO vo) throws Exception;

	// 활동게시판 댓글 삭제
	public void delete(int cabCommNo) throws Exception;

	// 활동게시판 댓글 전체 삭제
	public void deleteAll(int cabNo) throws Exception;

	// 활동 게시판 댓글 전체 보기
	public List<CabCommentVO> list(int cabNo) throws Exception;

}
