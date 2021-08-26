package com.mis.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.mis.domain.MemberVO;
import com.mis.dto.LoginDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.mis.mapper.MemberMapper";

	//로그인
	@Override
	public MemberVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(namespace + ".login", dto);
	}
	
	//회원가입
	@Override
	public void create(MemberVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
		
	}
	
	 //id 검사 AJAX.
	   @Override
	   public int checkId(String id) throws Exception {
	      return session.selectOne(namespace + ".checkId", id);
	   }
}
