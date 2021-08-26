package com.mis.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.CabCommentVO;

@Repository
public class CabCommentDAOImpl implements CabCommentDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.mis.mapper.CabCommentMapper";

	// 동아리활동 게시판 - 댓글 생성
	@Override
	public void create(CabCommentVO vo) throws Exception {
		session.insert(namespace + ".create", vo);

	}

	// 동아리활동 게시판 - 댓글 삭제
	@Override
	public void delete(int cabCommNo) throws Exception {
		session.delete(namespace + ".delete", cabCommNo);

	}

	// 동아리활동 게시판 - 댓글 전체 삭제
	@Override
	public void deleteAll(int cabNo) throws Exception {
		session.delete(namespace + ".deleteAll", cabNo);

	}

	// 동아리활동 게시판 - 댓글 전체 보기
	@Override
	public List<CabCommentVO> list(int cabNo) throws Exception {
		return session.selectList(namespace + ".list", cabNo);
	}

}
