package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.FbCommentVO;

@Repository
public class FbCommentDAOImpl implements FbCommentDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.mis.mapper.FbCommentMapper";

	// 자유게시판 - 댓글 생성
	@Override
	public void create(FbCommentVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	// 자유게시판 - 댓글 삭제
	@Override
	public void delete(int fbCommNo) throws Exception {
		session.delete(namespace + ".delete", fbCommNo);

	}

	// 자유게시판 - 댓글 전체 삭제
	@Override
	public void deleteAll(int fbNo) throws Exception {
		session.delete(namespace + ".deleteAll", fbNo);

	}

	// 자유게시판 - 댓글 전체 보기
	@Override
	public List<FbCommentVO> list(int fbNo) throws Exception {
		return session.selectList(namespace + ".list", fbNo);
	}

}
