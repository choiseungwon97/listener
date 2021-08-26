package com.mis.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.MemberVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession session;

	private static final String namespace = "com.mis.mapper.MemberMapper";

	@Override
	public MemberVO myInfo(String id) throws Exception {
		return session.selectOne(namespace + ".myInfo", id);
	}

	@Override
	public void myInfoUpdate(MemberVO vo) throws Exception {
		session.update(namespace + ".myInfoUpdate", vo);

	}

}
