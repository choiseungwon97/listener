package com.mis.persistence;

import java.util.List;

import com.mis.domain.FbCommentVO;

public interface FbCommentDAO {

	// 자유게시판 댓글 생성
	public void create(FbCommentVO vo) throws Exception;

	// 자유게시판 댓글 삭제
	public void delete(int fbCommNo) throws Exception;

	// 자유게시판 댓글 전체 삭제
	public void deleteAll(int fbNo) throws Exception;

	// 자유게시판 댓글 전체 보기
	public List<FbCommentVO> list(int fbNo) throws Exception;

}
